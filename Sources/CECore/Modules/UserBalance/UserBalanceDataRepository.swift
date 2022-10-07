//
//  UserBalanceDataRepository.swift
//  CurrencyExchange
//
//  Created by Beka Demuradze on 04.10.22.
//

import Factory
import Foundation

final class UserBalanceDataRepository: UserBalanceDataInterface {

    // MARK: - Private Properties
    @Injected(Container.userBalanceRemoteDataSource)
    private var remoteDataSource: UserBalanceRemoteDataSourceInterface

    // MARK: - Exposed Methods
    func getUserBalances() async throws -> [BalanceEntity] {
        try await remoteDataSource.getUserBalances()
    }
}

// MARK: - Factory
extension Container {
    static let userBalanceDataRepository = Factory { UserBalanceDataRepository() as UserBalanceDataInterface }
}
