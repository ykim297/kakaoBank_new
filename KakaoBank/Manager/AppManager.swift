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

    
    func addRecentSearchWord(text: String) {
        let defaults = UserDefaults.standard
        var recentSearchWords = defaults.stringArray(forKey: userDefault_RecentSearchWords) ?? [String]()
        recentSearchWords.insert(text, at: 0)
        let reorder = recentSearchWords.orderedSet
        defaults.set(reorder, forKey: userDefault_RecentSearchWords)
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

extension RangeReplaceableCollection where Element: Hashable {
    var orderedSet: Self {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
    mutating func removeDuplicates() {
        var set = Set<Element>()
        removeAll { !set.insert($0).inserted }
    }
}
