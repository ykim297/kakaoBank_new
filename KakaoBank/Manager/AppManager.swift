//
//  AppManager.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/28.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit



class AppManager {

    let userDefault_RecentSearchWords: String = "recentSearchWords"
        
    static let shared: AppManager = {
        let instance = AppManager()
        return instance
    }()

    
    func addRecentSearchWord(text:String) {
        let defaults = UserDefaults.standard
        var recentSearchWords = defaults.stringArray(forKey: userDefault_RecentSearchWords) ?? [String]()

        if recentSearchWords.count != 0 {
            for i in 0..<recentSearchWords.count - 1 {
                if recentSearchWords[i] == text {
                    return
                }
            }
        }

        if recentSearchWords.count > 4 {
            recentSearchWords.removeFirst()
        }
        
        recentSearchWords.append(text)
        defaults.set(recentSearchWords, forKey: userDefault_RecentSearchWords)
    }
    
    func getRecentSearchWordList() -> Array<String>{
        let defaults = UserDefaults.standard
        let recentSearchWords = defaults.stringArray(forKey: userDefault_RecentSearchWords) ?? [String]()
        return recentSearchWords
    }
    
    func removeRecentSearchWordAt(_ index:Int) {
        let defaults = UserDefaults.standard
        var recentSearchWords = defaults.stringArray(forKey: userDefault_RecentSearchWords) ?? [String]()
        if recentSearchWords.count > 0 { recentSearchWords.remove(at: index) }
        defaults.set(recentSearchWords, forKey: userDefault_RecentSearchWords)
    }

}
