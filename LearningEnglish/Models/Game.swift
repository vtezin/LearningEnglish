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
    let countOfAdditionalAnswersVariants: Int
    private(set) var result: Result
    private(set) var currentQuestion: Article?
    
    
    init(dictionary: LanguageDictionary, countOfAnswerVariants: Int) {
        self.dictionary = dictionary
        self.countOfAdditionalAnswersVariants = countOfAnswerVariants
        self.result = Result(countOfRightAnswers: 0, countOfWrongAnswers: 0, articlesOfWrongAnswers: [Article]())
    }
    
    struct Result {
        var countOfRightAnswers: Int
        var countOfWrongAnswers: Int
        var articlesOfWrongAnswers: [Article]
    }
    
    func generateCurrentQuestion() -> [Article] {
        
        let currentQuestion = dictionary.articles.randomElement()!
        
        var answerVariants = [Article]()
        answerVariants.append(currentQuestion)
        
        for _ in 1...countOfAdditionalAnswersVariants {
            let randomArticle = dictionary.articles.randomElement()!
            answerVariants.append(randomArticle)
        }
        
        answerVariants.shuffle()
        
        return answerVariants
        
    }
    
    func checkAnswerAndUpdateResult(answer: Article) -> Bool {

        if answer == currentQuestion {
            result.countOfRightAnswers += 1
            return true
        } else {
            result.countOfWrongAnswers += 1
            result.articlesOfWrongAnswers.append(answer)
            return false
        }

    }
    
}
