//
//  Game.swift
//  LearningEnglish
//
//  Created by test on 21.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

class Game {
    
    /// dictionary of the game
    let dictionary: LanguageDictionary
    /// count of answer variants
    let countOfWrongAnswers: Int
    
    init(dictionary: LanguageDictionary, countOfAnswerVariants: Int) {
        self.dictionary = dictionary
        self.countOfWrongAnswers = countOfAnswerVariants
    }

    func generateRandomQuestion() -> (Article, [Article]) {
        
        let questionArticle = dictionary.articles.randomElement()!
        
        var answerVariants = [Article]()
        answerVariants.append(questionArticle)
        
        for _ in 1...countOfWrongAnswers {
            let randomArticle = dictionary.articles.randomElement()!
            answerVariants.append(randomArticle)
        }
        
        answerVariants.shuffle()
        
        return (questionArticle, answerVariants)
    }
    
    
}
