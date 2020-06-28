//
//  ModelParser.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/27.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class ModelParser {
    static func parsing<T: Codable>(json: Data, type: T.Type, completion: @escaping (_ data: T?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try decoder.decode(type.self, from: json)
            return completion(data, nil)
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
            Log.error("Error from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}
