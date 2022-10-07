//
//  FactoryExtension.swift
//  CurrencyConverterTests
//
//  Created by Beka Demuradze on 04.10.22.
//

import Foundation
import Factory
@testable import CurrencyExchange

extension Container {
    /// Override regular dependencies with mocked objects
    static func configureMocks() {
        currencyConverterRemoteDataSource.register(factory: { CurrencyConverterMockRemoteDataSource() })
    }
}
