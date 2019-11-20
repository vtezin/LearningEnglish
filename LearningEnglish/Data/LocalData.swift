//
//  LocalData.swift
//  LearningEnglish
//
//  Created by test on 20.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

class LocalData {
    
    func loadData() -> [Article] {
        
        var articles = [Article]()
        
        var examples = [Article]()
        
        articles.append(Article("above", "выше"))
        articles.append(Article("accordingly", "соответственно"))
        articles.append(Article("addition", "сложение"))
        articles.append(Article("affect", "влияние, эффект"))
        articles.append(Article("affine", "родственный, подобный"))
        articles.append(Article("afford", "быть в состоянии"))
        articles.append(Article("ahold", "захват"))
        articles.append(Article("almost", "почти"))
        articles.append(Article("also", "также"))
        
        examples.removeAll()
        examples.append(Article("almost always", "почти всегда"))
        
        articles.append(Article("always", "почти", examples: examples))
        
        return articles
        
    }
    
}
