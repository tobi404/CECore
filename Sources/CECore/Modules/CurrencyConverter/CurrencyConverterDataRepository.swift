//
//  CurrencyConverterDataRepository.swift
//  CurrencyExchange
//
//  Created by Beka Demuradze on 05.10.22.
//

import Factory
import Foundation

final class CurrencyConverterDataRepository: CurrencyConverterDataInterface {

    // MARK: - Private Properties
    @Injected(Container.currencyConverterRemoteDataSource)
    private var remoteDataSource: CurrencyConverterRemoteDataSourceInterface

    // MARK: - Exposed Methods
    func getExchangedValue(amount: String, fromCurrency: CurrencyEntity, toCurrency: CurrencyEntity) async throws -> CurrencyExchangeResultEntity {
        try await remoteDataSource.getExchangedValue(amount: amount, fromCurrency: fromCurrency, toCurrency: toCurrency).toEntity()
    }

    func getAvailableCurrencies() async throws -> [CurrencyEntity] {
        try await remoteDataSource.getAvailableCurrencies()
    }

}

// MARK: - Factory
extension Container {
    static let currencyConverterDataRepository = Factory { CurrencyConverterDataRepository() as CurrencyConverterDataInterface }
}
