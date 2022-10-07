//
//  CurrencyConverterRemoteDataSource.swift
//  CurrencyExchange
//
//  Created by Beka Demuradze on 05.10.22.
//

import Factory
import Foundation

protocol CurrencyConverterRemoteDataSourceInterface {
    func getExchangedValue(amount: String, fromCurrency: CurrencyEntity, toCurrency: CurrencyEntity) async throws -> CurrencyExchangeResultModel
    func getAvailableCurrencies() async throws -> [CurrencyEntity]
}

final class CurrencyConverterRemoteDataSource: CurrencyConverterRemoteDataSourceInterface {

    func getExchangedValue(amount: String, fromCurrency: CurrencyEntity, toCurrency: CurrencyEntity) async throws -> CurrencyExchangeResultModel {
        let path = "http://api.evp.lt/currency/commercial/exchange/\(amount)-\(fromCurrency.name)/\(toCurrency.name)/latest"

        let networking = Networking<CurrencyExchangeResultModel>.object
        return try await networking.sendRequest(path: path)
    }

    func getAvailableCurrencies() async throws -> [CurrencyEntity] {
        [
            CurrencyEntity(name: "EUR", symbol: "€"),
            CurrencyEntity(name: "USD", symbol: "$"),
            CurrencyEntity(name: "JPY", symbol: "¥")
        ]
    }
}

extension Container {
    static let currencyConverterRemoteDataSource = Factory { CurrencyConverterRemoteDataSource() as CurrencyConverterRemoteDataSourceInterface }
}
