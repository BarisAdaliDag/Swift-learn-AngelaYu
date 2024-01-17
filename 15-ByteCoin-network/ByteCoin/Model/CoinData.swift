//
//  CoinData.swift
//  ByteCoin
//
//  Created by Ada on 28.12.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation




// MARK: - CoinData
struct CoinData: Codable {
    let time, assetIDBase, assetIDQuote: String?
    let rate: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
