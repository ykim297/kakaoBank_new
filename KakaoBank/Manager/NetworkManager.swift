//
//  NetworkManager.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit


class NetworkManager {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }

    static let shared = NetworkManager()
    var params: [String: Any]?
    
    func getSearchAppStoreList(model: SearchMain.Search.Request, completion: @escaping (SearchResultListModel?, Error?) -> Void ) {        
        let url = "https://itunes.apple.com/search?term=\(model.term)&country=\(model.country)&media=\(model.media)"
        let encodedString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        fetchGenericJSONData(urlString: encodedString, params: nil, completion: completion)
    }
    
    private func fetchGenericJSONData<T: Decodable>(
        urlString: String,
        httpMethod: NetworkManager.Method = .get,
        params: [String: Any]?,
        completion: @escaping (T?, Error?) -> ()
    ) {
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let err = error {
                completion(nil, err)
                return
            }

            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                completion(objects, nil)
            } catch let DecodingError.dataCorrupted(context) {
                Log.error("\(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                Log.error("Key '\(key)' not found: \(context.debugDescription)")
                Log.error("codingPath: \(context.codingPath)")
            } catch let DecodingError.valueNotFound(value, context) {
                Log.error("value: \(value) codingPath: \(context.codingPath)")
            } catch let DecodingError.typeMismatch(type, context) {
                Log.error("Type '\(type)' mismatch: \(context.debugDescription)")
                Log.error("codingPath: \(context.codingPath)")
            } catch {
                Log.error("error: \(error.localizedDescription)")
            }
        }.resume()
    }



}
