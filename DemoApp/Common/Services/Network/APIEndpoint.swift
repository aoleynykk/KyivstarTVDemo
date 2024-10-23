//
//  APIEndpoint.swift
//  DemoApp
//
//  Created by Alex Oliynyk on 20.10.2024.
//

import Foundation

enum APIHTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}

protocol ApiEndpoint {
    var baseURLString: String { get }
    var path: String { get }
    var suffix: String { get }
    var headers: [String: String]? { get }
    var method: APIHTTPMethod { get }
}

extension ApiEndpoint {
    var makeRequest: URLRequest {
        // Ensure baseURLString is valid and well-formed
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Invalid baseURLString: \(baseURLString)")
        }

        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        var longPath = ""

        if !path.isEmpty {
            longPath.append("/\(path)")
        }

        if !suffix.isEmpty {
            longPath.append("/\(suffix)")
        }

        // Set the path for URLComponents
        urlComponents?.path = longPath

        // Log URL details for debugging
        print("Constructed URL Path: \(longPath)")

        // Safely unwrap the URL, and handle error cases explicitly
        guard let finalURL = urlComponents?.url else {
            fatalError("Failed to construct a valid URL with baseURLString: \(baseURLString) and path: \(longPath)")
        }

        // Create the URLRequest
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue

        // Add headers if present
        if let headers = headers {
            for header in headers {
                request.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }

        // Log the final request details for debugging
        print("Final URL Request: \(request)")

        return request
    }
}
