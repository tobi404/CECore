//
//  CoreFactory.swift
//  
//
//  Created by Beka Demuradze on 07.10.22.
//

import Factory
import CEDomain

// MARK: - Global container
public class CoreContainer: CoreContainerInterface {

    public init() { }

    public var userBalanceDataRepository: Factory<UserBalanceDataInterface> { Factory { UserBalanceDataRepository() as UserBalanceDataInterface } }
    public var currencyConverterDataRepository: Factory<CurrencyConverterDataInterface> { Factory { CurrencyConverterDataRepository() as CurrencyConverterDataInterface } }
}
