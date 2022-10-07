//
//  UserBalanceRemoteDataSource.swift
//  CurrencyExchange
//
//  Created by Beka Demuradze on 04.10.22.
//

import Factory
import Foundation

// MARK: - UserBalanceRemoteDataSource Interface
protocol UserBalanceRemoteDataSourceInterface {
    func getUserBalances() async throws -> [BalanceEntity]
}

// MARK: - UserBalanceRemoteDataSource
final class UserBalanceRemoteDataSource: UserBalanceRemoteDataSourceInterface {

    /// Faked network response
    /// In real world application there would be proper networking
    func getUserBalances() async throws -> [BalanceEntity] {
        [
            BalanceEntity(amount: 1000, currency: CurrencyEntity(name: "EUR", symbol: "€")),
            BalanceEntity(amount: 0, currency: CurrencyEntity(name: "USD", symbol: "$")),
            BalanceEntity(amount: 0, currency: CurrencyEntity(name: "JPY", symbol: "¥")),
        ]
    }
}

// MARK: - Factory
extension Container {
    static let userBalanceRemoteDataSource = Factory { UserBalanceRemoteDataSource() as UserBalanceRemoteDataSourceInterface }
}
