//
//  Article.swift
//  LearningEnglish
//
//  Created by test on 20.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

/// article with a translation of an English word or expression to Russian
struct Article: Equatable {
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
