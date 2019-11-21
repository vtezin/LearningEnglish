//
//  File.swift
//  LearningEnglish
//
//  Created by test on 21.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

class LanguageDictionary {
    
    let language: String
    var articles: [Article]
    
    init(language: String, articles: [Article]) {
        self.language = language
        self.articles = articles
    }
    
}
