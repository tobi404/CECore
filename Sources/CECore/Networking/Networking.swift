//
//  Networking.swift
//  CurrencyExchange
//
//  Created by Beka Demuradze on 05.10.22.
//

import Factory
import Combine
import RxSwift
import Foundation

/// HTTP request methods.
enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public class Networking<Model: Codable>: NSObject, URLSessionTaskDelegate {

    static var object: Networking<Model> {
        Networking<Model>()
    }

    private override init() {
        print("📡🟢 ===Initialised=== networking, with model: ", Model.self)
    }

    deinit {
        print("📡🟠 ===Deinitialised=== Networking, with model: ", Model.self)
    }

    // MARK: - Basic URL Request
    @discardableResult
    func sendRequest(path: String) async throws -> Model {
        guard let url = URL(string: path) else {
            throw unidentifiedError(debugMessage: "Invalid URL")
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 30

        return try await makeNetworkCall(with: request)
    }

    // MARK: - Network call
    private func makeNetworkCall(with request: URLRequest) async throws -> Model {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession(configuration: config)
        let jsonDecoder = JSONDecoder()

        do {
            // Make network call
            let (data, response) = try await session.data(for: request)

            // Check HTTPURLResponse on error cases
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw unidentifiedError(debugMessage: "HTTP Responce")
            }

            // Parse data as Model
            let dataModel = try jsonDecoder.decode(Model.self, from: data)

            return dataModel
        } catch let err as URLError {
            throw unidentifiedError(debugMessage: "URL Error - \(err.localizedDescription)")
        } catch let err as Swift.DecodingError {
            throw unidentifiedError(debugMessage: "Decoding error - \(err.localizedDescription)")
        }
    }

    private func unidentifiedError(debugMessage: String) -> CEError {
        CEError(userMessage: "Unidentified error occured", debugMessage: debugMessage)
    }
}
