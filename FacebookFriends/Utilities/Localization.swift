//
//  Localization.swift
//  FacebookFriends
//
//  Created by Salih Topcu on 29.02.2020.
//  Copyright © 2020 salihtopcu. All rights reserved.
//

import Foundation

let noLocalizedStringKey = "NoLocalizedStringKey"

private class Localization {
    static func localizedString(forKey key: String) -> String {

        let string = Bundle.main.localizedString(forKey: key, value: noLocalizedStringKey, table: "LocalizedStrings")

        return string
    }
}

func LocalizedString(_ key: String) -> String {
    return Localization.localizedString(forKey: key)
}
