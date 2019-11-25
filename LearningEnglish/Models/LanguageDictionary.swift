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
    var articles: [Article] { didSet{
        self.articles.sort()
        }
    }
    
    init(language: String, articles: [Article]) {
        self.language = language
        self.articles = articles
    }
    
}

/// article with a translation of an English word or expression to Russian
struct Article: Equatable, Comparable {
    
    static func < (lhs: Article, rhs: Article) -> Bool {
        return lhs.expression < rhs.expression
    }
    
    /// expression for translating
    let expression: String
    /// translation to Russian
    let translation: String
    /// examples of using
    let examples: [Article]?
    
    init(_ expression: String, _ translation: String) {
        self.expression = expression
        self.translation = translation
        self.examples = nil
    }
    
    init(_ expression: String, _ translation: String, examples: [Article]) {
        self.expression = expression
        self.translation = translation
        self.examples = examples
    }
    
}
