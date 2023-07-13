//
//  CountryModel.swift
//  UberPath
//
//  Created by IPS-161 on 12/07/23.
//

import Foundation
import UIKit

class CountryModel{
    let countryLanguages: [String: String] = [
        "Afghanistan": "Pashto, Dari",
        "Aland Islands": "Swedish",
        "Albania": "Albanian",
        "Algeria": "Arabic",
        "American Samoa": "English, Samoan",
        "Andorra": "Catalan",
        "Angola": "Portuguese",
        "Anguilla": "English",
        "Antarctica": "Russian",
        "Antigua and Barbuda": "English",
        "Argentina": "Spanish",
        "Armenia": "Armenian",
        "Aruba": "Dutch",
        "Ascension Island": "English",
        "Australia": "English",
        "Austria": "German",
        "Azerbaijan": "Azerbaijani",
        "Bahamas": "English",
        "Bahrain": "Arabic",
        "Bangladesh": "Bengali",
        "Barbados": "English",
        "Belarus": "Belarusian, Russian",
        "Belgium": "Dutch, French, German",
        "Belize": "English",
        "Benin": "French",
        "Bermuda": "English",
        "Bhutan": "Dzongkha",
        "Bolivia": "Spanish, Quechua, Aymara",
        "Bonaire, Sint Eustatius and Saba": "Dutch",
        "Bosnia and Herzegovina": "Bosnian, Croatian, Serbian",
        "Botswana": "English, Tswana",
        "Bouvet Island": "Norwegian",
        "Brazil": "Portuguese",
        "British Indian Ocean Territory": "English",
        "British Virgin Islands": "English",
        "Brunei Darussalam": "Malay",
        "Bulgaria": "Bulgarian",
        "Burkina Faso": "French",
        "Burundi": "Kirundi, French",
        "Cambodia": "Khmer",
        "Cameroon": "French, English",
        "Canada": "English, French",
        "Canary Islands": "Spanish",
        "Cape Verde": "Portuguese",
        "Cayman Islands": "English",
        "Central African Republic": "French, Sango",
        "Ceuta & Melilla": "Spanish",
        "Chad": "French, Arabic",
        "Chile": "Spanish",
        "China": "Chinese",
        "Christmas Island": "English",
        "Clipperton Island": "French",
        "Cocos (Keeling) Islands": "English",
        "Colombia": "Spanish",
        "Comoros": "Comorian, Arabic, French",
        "Congo": "French",
        "Congo, Democratic Republic of the": "French",
        "Cook Islands": "English",
        "Costa Rica": "Spanish",
        "Cote d'Ivoire": "French",
        "Croatia": "Croatian",
        "Cuba": "Spanish",
        "Curacao": "Dutch, Papiamento",
        "Cyprus": "Greek, Turkish",
        "Czech Republic": "Czech",
        "Denmark": "Danish",
        "Diego Garcia": "English",
        "Djibouti": "Arabic, French",
        "Dominica": "English",
        "Dominican Republic": "Spanish",
        "Ecuador": "Spanish",
        "Egypt": "Arabic",
        "El Salvador": "Spanish",
        "Equatorial Guinea": "Spanish, French, Portuguese",
        "Eritrea": "Tigrinya, Arabic, English",
        "Estonia": "Estonian",
        "Ethiopia": "Amharic",
        "Falkland Islands": "English",
        "Faroe Islands": "Faroese",
        "Fiji": "English, Fijian, Fiji Hindi",
        "Finland": "Finnish, Swedish",
        "France": "French",
        "French Guiana": "French",
        "French Polynesia": "French",
        "French Southern Territories": "French",
        "Gabon": "French",
        "Gambia": "English",
        "Georgia": "Georgian",
        "Germany": "German",
        "Ghana": "English",
        "Gibraltar": "English",
        "Greece": "Greek",
        "Greenland": "Greenlandic, Danish",
        "Grenada": "English",
        "Guadeloupe": "French",
        "Guam": "English, Chamorro",
        "Guatemala": "Spanish",
        "Guernsey": "English",
        "Guinea": "French",
        "Guinea-Bissau": "Portuguese",
        "Guyana": "English",
        "Haiti": "French, Haitian Creole",
        "Heard Island and McDonald Islands": "",
        "Holy See": "Latin, Italian",
        "Honduras": "Spanish",
        "Hong Kong": "Chinese, English",
        "Hungary": "Hungarian",
        "Iceland": "Icelandic",
        "India": "Hindi, English",
        "Indonesia": "Indonesian",
        "Iran": "Persian",
        "Iraq": "Arabic, Kurdish",
        "Ireland": "Irish, English",
        "Isle of Man": "English, Manx",
        "Israel": "Hebrew",
        "Italy": "Italian",
        "Jamaica": "English",
        "Japan": "Japanese",
        "Jersey": "English",
        "Jordan": "Arabic",
        "Kazakhstan": "Kazakh, Russian",
        "Kenya": "Swahili, English",
        "Kiribati": "English, Kiribati",
        "Korea, Democratic People's Republic of": "Korean",
        "Korea, Republic of": "Korean",
        "Kosovo": "Albanian, Serbian",
        "Kuwait": "Arabic",
        "Kyrgyz Republic": "Kyrgyz, Russian",
        "Lao People's Democratic Republic": "Lao",
        "Latvia": "Latvian",
        "Lebanon": "Arabic",
        "Lesotho": "English, Sesotho",
        "Liberia": "English",
        "Libyan Arab Jamahiriya": "Arabic",
        "Liechtenstein": "German",
        "Lithuania": "Lithuanian",
        "Luxembourg": "Luxembourgish, French, German",
        "Macao": "Chinese, Portuguese",
        "Macedonia": "Macedonian",
        "Madagascar": "Malagasy, French",
        "Malawi": "English, Chichewa",
        "Malaysia": "Malay",
        "Maldives": "Maldivian",
        "Mali": "French",
        "Malta": "Maltese, English",
        "Marshall Islands": "English, Marshallese",
        "Martinique": "French",
        "Mauritania": "Arabic",
        "Mauritius": "English",
        "Mayotte": "French",
        "Mexico": "Spanish",
        "Micronesia, Federated States of": "English",
        "Moldova": "Moldovan",
        "Monaco": "French",
        "Mongolia": "Mongolian",
        "Montenegro": "Montenegrin",
        "Montserrat": "English",
        "Morocco": "Arabic, Berber",
        "Mozambique": "Portuguese",
        "Myanmar": "Burmese",
        "Namibia": "English",
        "Nauru": "Nauruan, English",
        "Nepal": "Nepali",
        "Netherlands": "Dutch",
        "New Caledonia": "French",
        "New Zealand": "English, Maori",
        "Nicaragua": "Spanish",
        "Niger": "French",
        "Nigeria": "English",
        "Niue": "Niuean, English",
        "Norfolk Island": "English",
        "Northern Mariana Islands": "English, Chamorro",
        "Norway": "Norwegian",
        "Oman": "Arabic",
        "Pakistan": "Urdu, English",
        "Palau": "English",
        "Palestinian Territory": "Arabic",
        "Panama": "Spanish",
        "Papua New Guinea": "English",
        "Paraguay": "Spanish, Guarani",
        "Peru": "Spanish",
        "Philippines": "Filipino, English",
        "Pitcairn Islands": "English",
        "Poland": "Polish",
        "Portugal": "Portuguese",
        "Puerto Rico": "Spanish, English",
        "Qatar": "Arabic",
        "Reunion": "French",
        "Romania": "Romanian",
        "Russian Federation": "Russian",
        "Rwanda": "Kinyarwanda, French, English",
        "Saint Barthelemy": "French",
        "Saint Helena": "English",
        "Saint Kitts and Nevis": "English",
        "Saint Lucia": "English",
        "Saint Martin": "French, Dutch",
        "Saint Pierre and Miquelon": "French",
        "Saint Vincent and the Grenadines": "English",
        "Samoa": "Samoan, English",
        "San Marino": "Italian",
        "Sao Tome and Principe": "Portuguese",
        "Saudi Arabia": "Arabic",
        "Senegal": "French",
        "Serbia": "Serbian",
        "Seychelles": "Seychellois Creole, English, French",
        "Sierra Leone": "English",
        "Singapore": "English, Malay, Mandarin, Tamil",
        "Sint Maarten (Dutch part)": "Dutch, English",
        "Slovakia": "Slovak",
        "Slovenia": "Slovene",
        "Solomon Islands": "English",
        "Somalia": "Somali, Arabic",
        "South Africa": "Afrikaans, English, Zulu",
        "South Georgia and the South Sandwich Islands": "English",
        "South Sudan": "English",
        "Spain": "Spanish",
        "Sri Lanka": "Sinhala, Tamil",
        "Sudan": "Arabic, English",
        "Suriname": "Dutch",
        "Svalbard & Jan Mayen Islands": "Norwegian",
        "Swaziland": "Swazi, English",
        "Sweden": "Swedish",
        "Switzerland": "German, French, Italian, Romansh",
        "Syrian Arab Republic": "Arabic",
        "Taiwan": "Chinese",
        "Tajikistan": "Tajik",
        "Tanzania": "Swahili, English",
        "Thailand": "Thai",
        "Timor-Leste": "Portuguese, Tetum",
        "Togo": "French",
        "Tokelau": "Tokelauan, English",
        "Tonga": "Tongan, English",
        "Trinidad and Tobago": "English",
        "Tristan da Cunha": "English",
        "Tunisia": "Arabic",
        "Turkey": "Turkish",
        "Turkmenistan": "Turkmen",
        "Turks and Caicos Islands": "English",
        "Tuvalu": "Tuvaluan, English",
        "Uganda": "English, Swahili",
        "Ukraine": "Ukrainian",
        "United Arab Emirates": "Arabic",
        "United Kingdom of Great Britain & Northern Ireland": "English",
        "United States Minor Outlying Islands": "English",
        "United States of America": "English",
        "United States Virgin Islands": "English",
        "Uruguay": "Spanish",
        "Uzbekistan": "Uzbek",
        "Vanuatu": "Bislama, English, French",
        "Venezuela": "Spanish",
        "Vietnam": "Vietnamese",
        "Wallis and Futuna": "French",
        "Western Sahara": "Arabic",
        "Yemen": "Arabic",
        "Zambia": "English",
        "Zimbabwe": "English"
    ]

}