//
//  CurrencyExchangeResultModel.swift
//  CurrencyExchange
//
//  Created by Beka Demuradze on 05.10.22.
//

import CEDomain
import Foundation

struct CurrencyExchangeResultModel: Codable {
    let amount: String
    let currency: String

    func toEntity() -> CurrencyExchangeResultEntity {
        CurrencyExchangeResultEntity(amount: amount, currency: currency)
    }
}
