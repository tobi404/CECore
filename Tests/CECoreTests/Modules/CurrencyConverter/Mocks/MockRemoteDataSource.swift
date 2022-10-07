//
//  MockRemoteDataSource.swift
//  CurrencyExchangeTests
//
//  Created by Beka Demuradze on 06.10.22.
//


import Factory
import Foundation
@testable import CEDomain
@testable import CECore

final class CurrencyConverterMockRemoteDataSource: CurrencyConverterRemoteDataSourceInterface {

    func getExchangedValue(amount: String, fromCurrency: CurrencyEntity, toCurrency: CurrencyEntity) async throws -> CurrencyExchangeResultModel {
        CurrencyExchangeResultModel(amount: "123.45", currency: "USD")
    }

    func getAvailableCurrencies() async throws -> [CurrencyEntity] {
        [
            CurrencyEntity(name: "EUR", symbol: "€"),
            CurrencyEntity(name: "USD", symbol: "$"),
            CurrencyEntity(name: "JPY", symbol: "¥")
        ]
    }

}
