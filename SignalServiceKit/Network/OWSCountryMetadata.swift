//
// Copyright 2024 Signal Messenger, LLC
// SPDX-License-Identifier: AGPL-3.0-only
//

import Foundation

public struct OWSCountryMetadata {

    let name: String
    let frontingDomain: OWSFrontingHost?
    public let countryCode: String
    public let localizedCountryName: String

    private init(name: String, frontingDomain: OWSFrontingHost?, countryCode: String) {
        owsAssertDebug(!name.isEmpty)
        owsAssertDebug(!countryCode.isEmpty)

        self.name = name
        self.frontingDomain = frontingDomain
        self.countryCode = countryCode

        if let localizedCountryName = Locale.current.localizedString(forRegionCode: countryCode), !localizedCountryName.isEmpty {
            self.localizedCountryName = localizedCountryName
        } else {
            self.localizedCountryName = name
        }
    }

    public static func countryMetadata(countryCode: String) -> OWSCountryMetadata? {
        owsAssertDebug(!countryCode.isEmpty)
        return allCountryMetadataByCountryCode[countryCode]
    }

    public static let allCountryMetadatas: [OWSCountryMetadata] = [
        OWSCountryMetadata(name: "Andorra", frontingDomain: nil, countryCode: "AD"),
        OWSCountryMetadata(name: "United Arab Emirates", frontingDomain: .googleUae, countryCode: "AE"),
        OWSCountryMetadata(name: "Afghanistan", frontingDomain: nil, countryCode: "AF"),
        OWSCountryMetadata(name: "Antigua and Barbuda", frontingDomain: nil, countryCode: "AG"),
        OWSCountryMetadata(name: "Anguilla", frontingDomain: nil, countryCode: "AI"),
        OWSCountryMetadata(name: "Albania", frontingDomain: nil, countryCode: "AL"),
        OWSCountryMetadata(name: "Armenia", frontingDomain: nil, countryCode: "AM"),
        OWSCountryMetadata(name: "Angola", frontingDomain: nil, countryCode: "AO"),
        OWSCountryMetadata(name: "Argentina", frontingDomain: nil, countryCode: "AR"),
        OWSCountryMetadata(name: "American Samoa", frontingDomain: nil, countryCode: "AS"),
        OWSCountryMetadata(name: "Austria", frontingDomain: nil, countryCode: "AT"),
        OWSCountryMetadata(name: "Australia", frontingDomain: nil, countryCode: "AU"),
        OWSCountryMetadata(name: "Azerbaijan", frontingDomain: nil, countryCode: "AZ"),
        OWSCountryMetadata(name: "Bosnia and Herzegovina", frontingDomain: nil, countryCode: "BA"),
        OWSCountryMetadata(name: "Bangladesh", frontingDomain: nil, countryCode: "BD"),
        OWSCountryMetadata(name: "Belgium", frontingDomain: nil, countryCode: "BE"),
        OWSCountryMetadata(name: "Burkina Faso", frontingDomain: nil, countryCode: "BF"),
        OWSCountryMetadata(name: "Bulgaria", frontingDomain: nil, countryCode: "BG"),
        OWSCountryMetadata(name: "Bahrain", frontingDomain: nil, countryCode: "BH"),
        OWSCountryMetadata(name: "Burundi", frontingDomain: nil, countryCode: "BI"),
        OWSCountryMetadata(name: "Benin", frontingDomain: nil, countryCode: "BJ"),
        OWSCountryMetadata(name: "Brunei", frontingDomain: nil, countryCode: "BN"),
        OWSCountryMetadata(name: "Bolivia", frontingDomain: nil, countryCode: "BO"),
        OWSCountryMetadata(name: "Brazil", frontingDomain: nil, countryCode: "BR"),
        OWSCountryMetadata(name: "Bahamas", frontingDomain: nil, countryCode: "BS"),
        OWSCountryMetadata(name: "Bhutan", frontingDomain: nil, countryCode: "BT"),
        OWSCountryMetadata(name: "Botswana", frontingDomain: nil, countryCode: "BW"),
        OWSCountryMetadata(name: "Belarus", frontingDomain: nil, countryCode: "BY"),
        OWSCountryMetadata(name: "Belize", frontingDomain: nil, countryCode: "BZ"),
        OWSCountryMetadata(name: "Canada", frontingDomain: nil, countryCode: "CA"),
        OWSCountryMetadata(name: "Cambodia", frontingDomain: nil, countryCode: "KH"),
        OWSCountryMetadata(name: "Cocos (Keeling) Islands", frontingDomain: nil, countryCode: "CC"),
        OWSCountryMetadata(name: "Democratic Republic of the Congo", frontingDomain: nil, countryCode: "CD"),
        OWSCountryMetadata(name: "Central African Republic", frontingDomain: nil, countryCode: "CF"),
        OWSCountryMetadata(name: "Republic of the Congo", frontingDomain: nil, countryCode: "CG"),
        OWSCountryMetadata(name: "Switzerland", frontingDomain: nil, countryCode: "CH"),
        OWSCountryMetadata(name: "Ivory Coast", frontingDomain: nil, countryCode: "CI"),
        OWSCountryMetadata(name: "Cook Islands", frontingDomain: nil, countryCode: "CK"),
        OWSCountryMetadata(name: "Chile", frontingDomain: nil, countryCode: "CL"),
        OWSCountryMetadata(name: "Cameroon", frontingDomain: nil, countryCode: "CM"),
        OWSCountryMetadata(name: "China", frontingDomain: nil, countryCode: "CN"),
        OWSCountryMetadata(name: "Colombia", frontingDomain: nil, countryCode: "CO"),
        OWSCountryMetadata(name: "Costa Rica", frontingDomain: nil, countryCode: "CR"),
        OWSCountryMetadata(name: "Cuba", frontingDomain: .fastly, countryCode: "CU"),
        OWSCountryMetadata(name: "Cape Verde", frontingDomain: nil, countryCode: "CV"),
        OWSCountryMetadata(name: "Christmas Island", frontingDomain: nil, countryCode: "CX"),
        OWSCountryMetadata(name: "Cyprus", frontingDomain: nil, countryCode: "CY"),
        OWSCountryMetadata(name: "Czech Republic", frontingDomain: nil, countryCode: "CZ"),
        OWSCountryMetadata(name: "Germany", frontingDomain: nil, countryCode: "DE"),
        OWSCountryMetadata(name: "Djibouti", frontingDomain: nil, countryCode: "DJ"),
        OWSCountryMetadata(name: "Denmark", frontingDomain: nil, countryCode: "DK"),
        OWSCountryMetadata(name: "Dominica", frontingDomain: nil, countryCode: "DM"),
        OWSCountryMetadata(name: "Dominican Republic", frontingDomain: nil, countryCode: "DO"),
        OWSCountryMetadata(name: "Algeria", frontingDomain: nil, countryCode: "DZ"),
        OWSCountryMetadata(name: "Ecuador", frontingDomain: nil, countryCode: "EC"),
        OWSCountryMetadata(name: "Estonia", frontingDomain: nil, countryCode: "EE"),
        OWSCountryMetadata(name: "Egypt", frontingDomain: .googleEgypt, countryCode: "EG"),
        OWSCountryMetadata(name: "Spain", frontingDomain: nil, countryCode: "ES"),
        OWSCountryMetadata(name: "Ethiopia", frontingDomain: nil, countryCode: "ET"),
        OWSCountryMetadata(name: "Finland", frontingDomain: nil, countryCode: "FI"),
        OWSCountryMetadata(name: "Fiji", frontingDomain: nil, countryCode: "FJ"),
        OWSCountryMetadata(name: "Federated States of Micronesia", frontingDomain: nil, countryCode: "FM"),
        OWSCountryMetadata(name: "France", frontingDomain: nil, countryCode: "FR"),
        OWSCountryMetadata(name: "Gabon", frontingDomain: nil, countryCode: "GA"),
        OWSCountryMetadata(name: "Georgia", frontingDomain: nil, countryCode: "GE"),
        OWSCountryMetadata(name: "French Guiana", frontingDomain: nil, countryCode: "GF"),
        OWSCountryMetadata(name: "Guernsey", frontingDomain: nil, countryCode: "GG"),
        OWSCountryMetadata(name: "Ghana", frontingDomain: nil, countryCode: "GH"),
        OWSCountryMetadata(name: "Gibraltar", frontingDomain: nil, countryCode: "GI"),
        OWSCountryMetadata(name: "Greenland", frontingDomain: nil, countryCode: "GL"),
        OWSCountryMetadata(name: "Gambia", frontingDomain: nil, countryCode: "GM"),
        OWSCountryMetadata(name: "Guadeloupe", frontingDomain: nil, countryCode: "GP"),
        OWSCountryMetadata(name: "Greece", frontingDomain: nil, countryCode: "GR"),
        OWSCountryMetadata(name: "Guatemala", frontingDomain: nil, countryCode: "GT"),
        OWSCountryMetadata(name: "Guyana", frontingDomain: nil, countryCode: "GY"),
        OWSCountryMetadata(name: "Hong Kong", frontingDomain: nil, countryCode: "HK"),
        OWSCountryMetadata(name: "Honduras", frontingDomain: nil, countryCode: "HN"),
        OWSCountryMetadata(name: "Croatia", frontingDomain: nil, countryCode: "HR"),
        OWSCountryMetadata(name: "Haiti", frontingDomain: nil, countryCode: "HT"),
        OWSCountryMetadata(name: "Hungary", frontingDomain: nil, countryCode: "HU"),
        OWSCountryMetadata(name: "Indonesia", frontingDomain: nil, countryCode: "ID"),
        OWSCountryMetadata(name: "Iraq", frontingDomain: nil, countryCode: "IQ"),
        OWSCountryMetadata(name: "Ireland", frontingDomain: nil, countryCode: "IE"),
        OWSCountryMetadata(name: "Israel", frontingDomain: nil, countryCode: "IL"),
        OWSCountryMetadata(name: "Isle of Man", frontingDomain: nil, countryCode: "IM"),
        OWSCountryMetadata(name: "India", frontingDomain: nil, countryCode: "IN"),
        OWSCountryMetadata(name: "British Indian Ocean Territory", frontingDomain: nil, countryCode: "IO"),
        OWSCountryMetadata(name: "Iceland", frontingDomain: nil, countryCode: "IS"),
        OWSCountryMetadata(name: "Italy", frontingDomain: nil, countryCode: "IT"),
        OWSCountryMetadata(name: "Jersey", frontingDomain: nil, countryCode: "JE"),
        OWSCountryMetadata(name: "Jamaica", frontingDomain: nil, countryCode: "JM"),
        OWSCountryMetadata(name: "Jordan", frontingDomain: nil, countryCode: "JO"),
        OWSCountryMetadata(name: "Japan", frontingDomain: nil, countryCode: "JP"),
        OWSCountryMetadata(name: "Kenya", frontingDomain: nil, countryCode: "KE"),
        OWSCountryMetadata(name: "Kiribati", frontingDomain: nil, countryCode: "KI"),
        OWSCountryMetadata(name: "Kyrgyzstan", frontingDomain: nil, countryCode: "KG"),
        OWSCountryMetadata(name: "South Korea", frontingDomain: nil, countryCode: "KR"),
        OWSCountryMetadata(name: "Kuwait", frontingDomain: nil, countryCode: "KW"),
        OWSCountryMetadata(name: "Kazakhstan", frontingDomain: nil, countryCode: "KZ"),
        OWSCountryMetadata(name: "Laos", frontingDomain: nil, countryCode: "LA"),
        OWSCountryMetadata(name: "Lebanon", frontingDomain: nil, countryCode: "LB"),
        OWSCountryMetadata(name: "Saint Lucia", frontingDomain: nil, countryCode: "LC"),
        OWSCountryMetadata(name: "Liechtenstein", frontingDomain: nil, countryCode: "LI"),
        OWSCountryMetadata(name: "Sri Lanka", frontingDomain: nil, countryCode: "LK"),
        OWSCountryMetadata(name: "Lesotho", frontingDomain: nil, countryCode: "LS"),
        OWSCountryMetadata(name: "Lithuania", frontingDomain: nil, countryCode: "LT"),
        OWSCountryMetadata(name: "Luxembourg", frontingDomain: nil, countryCode: "LU"),
        OWSCountryMetadata(name: "Latvia", frontingDomain: nil, countryCode: "LV"),
        OWSCountryMetadata(name: "Libya", frontingDomain: nil, countryCode: "LY"),
        OWSCountryMetadata(name: "Morocco", frontingDomain: nil, countryCode: "MA"),
        OWSCountryMetadata(name: "Moldova", frontingDomain: nil, countryCode: "MD"),
        OWSCountryMetadata(name: "Montenegro", frontingDomain: nil, countryCode: "ME"),
        OWSCountryMetadata(name: "Madagascar", frontingDomain: nil, countryCode: "MG"),
        OWSCountryMetadata(name: "Macedonia", frontingDomain: nil, countryCode: "MK"),
        OWSCountryMetadata(name: "Mali", frontingDomain: nil, countryCode: "ML"),
        OWSCountryMetadata(name: "Myanmar", frontingDomain: nil, countryCode: "MM"),
        OWSCountryMetadata(name: "Mongolia", frontingDomain: nil, countryCode: "MN"),
        OWSCountryMetadata(name: "Montserrat", frontingDomain: nil, countryCode: "MS"),
        OWSCountryMetadata(name: "Malta", frontingDomain: nil, countryCode: "MT"),
        OWSCountryMetadata(name: "Mauritius", frontingDomain: nil, countryCode: "MU"),
        OWSCountryMetadata(name: "Maldives", frontingDomain: nil, countryCode: "MV"),
        OWSCountryMetadata(name: "Malawi", frontingDomain: nil, countryCode: "MW"),
        OWSCountryMetadata(name: "Mexico", frontingDomain: nil, countryCode: "MX"),
        OWSCountryMetadata(name: "Malaysia", frontingDomain: nil, countryCode: "MY"),
        OWSCountryMetadata(name: "Mozambique", frontingDomain: nil, countryCode: "MZ"),
        OWSCountryMetadata(name: "Namibia", frontingDomain: nil, countryCode: "NA"),
        OWSCountryMetadata(name: "Niger", frontingDomain: nil, countryCode: "NE"),
        OWSCountryMetadata(name: "Norfolk Island", frontingDomain: nil, countryCode: "NF"),
        OWSCountryMetadata(name: "Nigeria", frontingDomain: nil, countryCode: "NG"),
        OWSCountryMetadata(name: "Nicaragua", frontingDomain: nil, countryCode: "NI"),
        OWSCountryMetadata(name: "Netherlands", frontingDomain: nil, countryCode: "NL"),
        OWSCountryMetadata(name: "Norway", frontingDomain: nil, countryCode: "NO"),
        OWSCountryMetadata(name: "Nepal", frontingDomain: nil, countryCode: "NP"),
        OWSCountryMetadata(name: "Nauru", frontingDomain: nil, countryCode: "NR"),
        OWSCountryMetadata(name: "Niue", frontingDomain: nil, countryCode: "NU"),
        OWSCountryMetadata(name: "New Zealand", frontingDomain: nil, countryCode: "NZ"),
        OWSCountryMetadata(name: "Oman", frontingDomain: .googleOman, countryCode: "OM"),
        OWSCountryMetadata(name: "Pakistan", frontingDomain: .googlePakistan, countryCode: "PK"),
        OWSCountryMetadata(name: "Panama", frontingDomain: nil, countryCode: "PA"),
        OWSCountryMetadata(name: "Peru", frontingDomain: nil, countryCode: "PE"),
        OWSCountryMetadata(name: "Philippines", frontingDomain: nil, countryCode: "PH"),
        OWSCountryMetadata(name: "Poland", frontingDomain: nil, countryCode: "PL"),
        OWSCountryMetadata(name: "Papua New Guinea", frontingDomain: nil, countryCode: "PG"),
        OWSCountryMetadata(name: "Pitcairn Islands", frontingDomain: nil, countryCode: "PN"),
        OWSCountryMetadata(name: "Puerto Rico", frontingDomain: nil, countryCode: "PR"),
        OWSCountryMetadata(name: "Palestine[4]", frontingDomain: nil, countryCode: "PS"),
        OWSCountryMetadata(name: "Portugal", frontingDomain: nil, countryCode: "PT"),
        OWSCountryMetadata(name: "Paraguay", frontingDomain: nil, countryCode: "PY"),
        OWSCountryMetadata(name: "Qatar", frontingDomain: .googleQatar, countryCode: "QA"),
        OWSCountryMetadata(name: "Romania", frontingDomain: nil, countryCode: "RO"),
        OWSCountryMetadata(name: "Serbia", frontingDomain: nil, countryCode: "RS"),
        OWSCountryMetadata(name: "Russia", frontingDomain: .default, countryCode: "RU"),
        OWSCountryMetadata(name: "Rwanda", frontingDomain: nil, countryCode: "RW"),
        OWSCountryMetadata(name: "Saudi Arabia", frontingDomain: nil, countryCode: "SA"),
        OWSCountryMetadata(name: "Solomon Islands", frontingDomain: nil, countryCode: "SB"),
        OWSCountryMetadata(name: "Seychelles", frontingDomain: nil, countryCode: "SC"),
        OWSCountryMetadata(name: "Sweden", frontingDomain: nil, countryCode: "SE"),
        OWSCountryMetadata(name: "Singapore", frontingDomain: nil, countryCode: "SG"),
        OWSCountryMetadata(name: "Saint Helena, Ascension and Tristan da Cunha", frontingDomain: nil, countryCode: "SH"),
        OWSCountryMetadata(name: "Slovenia", frontingDomain: nil, countryCode: "SI"),
        OWSCountryMetadata(name: "Slovakia", frontingDomain: nil, countryCode: "SK"),
        OWSCountryMetadata(name: "Sierra Leone", frontingDomain: nil, countryCode: "SL"),
        OWSCountryMetadata(name: "Senegal", frontingDomain: nil, countryCode: "SN"),
        OWSCountryMetadata(name: "San Marino", frontingDomain: nil, countryCode: "SM"),
        OWSCountryMetadata(name: "Somalia", frontingDomain: nil, countryCode: "SO"),
        OWSCountryMetadata(name: "São Tomé and Príncipe", frontingDomain: nil, countryCode: "ST"),
        OWSCountryMetadata(name: "Suriname", frontingDomain: nil, countryCode: "SR"),
        OWSCountryMetadata(name: "El Salvador", frontingDomain: nil, countryCode: "SV"),
        OWSCountryMetadata(name: "Chad", frontingDomain: nil, countryCode: "TD"),
        OWSCountryMetadata(name: "Togo", frontingDomain: nil, countryCode: "TG"),
        OWSCountryMetadata(name: "Thailand", frontingDomain: nil, countryCode: "TH"),
        OWSCountryMetadata(name: "Tajikistan", frontingDomain: nil, countryCode: "TJ"),
        OWSCountryMetadata(name: "Tokelau", frontingDomain: nil, countryCode: "TK"),
        OWSCountryMetadata(name: "Timor-Leste", frontingDomain: nil, countryCode: "TL"),
        OWSCountryMetadata(name: "Turkmenistan", frontingDomain: nil, countryCode: "TM"),
        OWSCountryMetadata(name: "Tonga", frontingDomain: nil, countryCode: "TO"),
        OWSCountryMetadata(name: "Tunisia", frontingDomain: nil, countryCode: "TN"),
        OWSCountryMetadata(name: "Turkey", frontingDomain: nil, countryCode: "TR"),
        OWSCountryMetadata(name: "Trinidad and Tobago", frontingDomain: nil, countryCode: "TT"),
        OWSCountryMetadata(name: "Taiwan", frontingDomain: nil, countryCode: "TW"),
        OWSCountryMetadata(name: "Tanzania", frontingDomain: nil, countryCode: "TZ"),
        OWSCountryMetadata(name: "Ukraine", frontingDomain: nil, countryCode: "UA"),
        OWSCountryMetadata(name: "Uganda", frontingDomain: nil, countryCode: "UG"),
        OWSCountryMetadata(name: "United States", frontingDomain: nil, countryCode: "US"),
        OWSCountryMetadata(name: "Uruguay", frontingDomain: nil, countryCode: "UY"),
        OWSCountryMetadata(name: "Uzbekistan", frontingDomain: .googleUzbekistan, countryCode: "UZ"),
        OWSCountryMetadata(name: "Saint Vincent and the Grenadines", frontingDomain: nil, countryCode: "VC"),
        OWSCountryMetadata(name: "Venezuela", frontingDomain: .googleVenezuela, countryCode: "VE"),
        OWSCountryMetadata(name: "British Virgin Islands", frontingDomain: nil, countryCode: "VG"),
        OWSCountryMetadata(name: "United States Virgin Islands", frontingDomain: nil, countryCode: "VI"),
        OWSCountryMetadata(name: "Vietnam", frontingDomain: nil, countryCode: "VN"),
        OWSCountryMetadata(name: "Vanuatu", frontingDomain: nil, countryCode: "VU"),
        OWSCountryMetadata(name: "Samoa", frontingDomain: nil, countryCode: "WS"),
        OWSCountryMetadata(name: "South Africa", frontingDomain: nil, countryCode: "ZA"),
        OWSCountryMetadata(name: "Zambia", frontingDomain: nil, countryCode: "ZM"),
        OWSCountryMetadata(name: "Zimbabwe", frontingDomain: nil, countryCode: "ZW"),
    ].sorted { $0.localizedCountryName < $1.localizedCountryName }

    private static let allCountryMetadataByCountryCode = {
        var result = [String: OWSCountryMetadata]()
        for metadata in allCountryMetadatas {
            result[metadata.countryCode] = metadata
        }
        return result
    }()
}
