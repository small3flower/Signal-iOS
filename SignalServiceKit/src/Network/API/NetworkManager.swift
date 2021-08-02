//
//  Copyright (c) 2021 Open Whisper Systems. All rights reserved.
//

import Foundation
import PromiseKit

@objc
public class NetworkManager: NSObject {
    private let restNetworkManager = RESTNetworkManager()

    @objc
    public override init() {
        super.init()

        SwiftSingletons.register(self)
    }

    public func makePromise(request: TSRequest) -> Promise<HTTPResponse> {
        // TODO: Websocket might be just opening. We should wait.
        Self.socketManager.makeRequestPromise(request: request, webSocketType: .default)
    }

    private func isRESTOnlyEndpoint(request: TSRequest) -> Bool {
        guard let url = request.url else {
            owsFailDebug("Missing url.")
            return true
        }
        guard let urlComponents = URLComponents(string: url.absoluteString) else {
            owsFailDebug("Missing urlComponents.")
            return true
        }
        let path: String = urlComponents.path
        let missingEndpoints = [
            "/v1/payments/auth"
        ]
        return missingEndpoints.contains(path)
    }

    private func restRequestPromise(request: TSRequest) -> Promise<HTTPResponse> {
        restNetworkManager.makePromise(request: request)
    }

    private func websocketRequestPromise(request: TSRequest) -> Promise<HTTPResponse> {
        // TODO: Websocket might be just opening. We should wait.
        Self.socketManager.makeRequestPromise(request: request, webSocketType: .default)
    }
}

// MARK: -

#if TESTABLE_BUILD

@objc
public class OWSFakeNetworkManager: NetworkManager {

    public override func makePromise(request: TSRequest) -> Promise<HTTPResponse> {
        Logger.info("Ignoring request: \(request)")
        // Never resolve.
        let (promise, _) = Promise<HTTPResponse>.pending()
        return promise
    }
}

#endif

// MARK: -

@objc
public extension NetworkManager {
    // NOTE: This function should only be called from IsNetworkConnectivityFailure().
    static func isSwiftNetworkConnectivityError(_ error: Error?) -> Bool {
        guard let error = error else {
            return false
        }
        switch error {
        case let httpError as OWSHTTPError:
            return httpError.isNetworkConnectivityError
        case GroupsV2Error.timeout:
            return true
        case let contactDiscoveryError as ContactDiscoveryError:
            return contactDiscoveryError.kind == .timeout
        case PaymentsError.timeout:
            return true
        default:
            return false
        }
    }

    // NOTE: This function should only be called from HTTPStatusCodeForError().
    static func swiftHTTPStatusCodeForError(_ error: Error?) -> NSNumber? {
        if let httpError = error as? OWSHTTPError {
            let statusCode = httpError.responseStatusCode
            guard statusCode > 0 else {
                return nil
            }
            return NSNumber(value: statusCode)
        }
        return nil
    }

    // NOTE: This function should only be called from HTTPRetryAfterDate().
    static func swiftHTTPRetryAfterDateForError(_ error: Error?) -> Date? {
        if let httpError = error as? OWSHTTPError {
            if let retryAfterDate = httpError.customRetryAfterDate {
                return retryAfterDate
            }
            if let retryAfterDate = httpError.responseHeaders?.retryAfterDate {
                return retryAfterDate
            }
            if let responseError = httpError.responseError {
                return swiftHTTPRetryAfterDateForError(responseError)
            }
        }
        return nil
    }

    // NOTE: This function should only be called from HTTPResponseDataForError().
    static func swiftHTTPResponseDataForError(_ error: Error?) -> Data? {
        guard let error = error else {
            return nil
        }
        if let responseData = (error as NSError).userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] as? Data {
            return responseData
        }
        switch error {
        case let httpError as OWSHTTPError:
            if let responseData = httpError.responseBodyData {
                return responseData
            }
            if let responseError = httpError.responseError {
                return swiftHTTPResponseDataForError(responseError)
            }
            return nil
        default:
            return nil
        }
    }
}
