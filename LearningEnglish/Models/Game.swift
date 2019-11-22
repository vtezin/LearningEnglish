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
    /// struct whith result of the game
    private(set) var result: Result
    /// current (last generated) question
    private(set) var currentQuestion: Article?
    
    init(dictionary: LanguageDictionary, countOfAnswerVariants: Int) {
        self.dictionary = dictionary
        self.countOfAdditionalAnswersVariants = countOfAnswerVariants
        self.result = Result(articlesOfWrongAnswers: [Article](),
                             articlesOfRightAnswers: [Article]())
    }
    
    /// structure whith result of the game
    struct Result {
        var countOfRightAnswers: Int {return articlesOfRightAnswers.count}
        var countOfWrongAnswers: Int {return articlesOfWrongAnswers.count}
        var articlesOfWrongAnswers: [Article]
        var articlesOfRightAnswers: [Article]
    }
    
    /// generating next random question
    func generateCurrentQuestion() -> [Article] {
        
        if let currentQuestion = dictionary.articles.randomElement() {
            self.currentQuestion = currentQuestion
        } else {
            return [Article]()
        }
        
        var answerVariants = [Article]()
        answerVariants.append(self.currentQuestion!)
        
        for _ in 1...countOfAdditionalAnswersVariants {
            let randomArticle = dictionary.articles.randomElement()!
            answerVariants.append(randomArticle)
        }
        
        answerVariants.shuffle()
        
        return answerVariants
        
    }
    
    /// Checking answer & updating result
    /// - Parameter answer: answer given for current question
    func checkAnswerAndUpdateResult(answer: Article) -> Bool {

        if answer == currentQuestion {
            result.articlesOfRightAnswers.append(answer)
            return true
        } else {
            result.articlesOfWrongAnswers.append(answer)
            return false
        }

    }
    
}
