//
//  MockRemoteDataSource.swift
//  CurrencyExchangeTests
//
//  Created by Beka Demuradze on 06.10.22.
//


import Factory
import Foundation
@testable import CurrencyExchange

final class CurrencyConverterMockRemoteDataSource: CurrencyConverterRemoteDataSourceInterface {

    func getExchangedValue(amount: String, fromCurrency: CurrencyExchange.CurrencyEntity, toCurrency: CurrencyExchange.CurrencyEntity) async throws -> CurrencyExchange.CurrencyExchangeResultModel {
        CurrencyExchange.CurrencyExchangeResultModel(amount: "123.45", currency: "USD")
    }

    func getAvailableCurrencies() async throws -> [CurrencyExchange.CurrencyEntity] {
        [
            CurrencyExchange.CurrencyEntity(name: "EUR", symbol: "€"),
            CurrencyExchange.CurrencyEntity(name: "USD", symbol: "$"),
            CurrencyExchange.CurrencyEntity(name: "JPY", symbol: "¥")
        ]
    }

}
