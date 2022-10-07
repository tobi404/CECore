//
//  FactoryExtension.swift
//  CurrencyConverterTests
//
//  Created by Beka Demuradze on 04.10.22.
//

import Factory
import Foundation
@testable import CECore

extension Container {
    /// Override regular dependencies with mocked objects
    static func configureMocks() {
        currencyConverterRemoteDataSource.register(factory: { CurrencyConverterMockRemoteDataSource() })
    }
}
