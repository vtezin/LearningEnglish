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
    
    var gameIsFinished: Bool {
        return unusedArticles.count <= (countOfAdditionalAnswersVariants + 1)
    }
    
    init(dictionary: LanguageDictionary, countOfAnswerVariants: Int) {
        self.dictionary = dictionary
        self.countOfAdditionalAnswersVariants = countOfAnswerVariants
        self.result = Result(articlesOfWrongAnswers: [Article](),
                             articlesOfRightAnswers: [Article]())
    }
    
    var unusedArticles: [Article] {
        
        return dictionary.articles.filter{!result.articlesOfRightAnswers.contains($0)}
        
    }
    
    /// structure whith result of the game
    struct Result {
        
        var countOfRightAnswers: Int {return articlesOfRightAnswers.count}
        var countOfWrongAnswers: Int {return articlesOfWrongAnswers.count}
        var articlesOfWrongAnswers: [Article]
        var articlesOfRightAnswers: [Article]
        
    }
    
    /// generating next random question
    /// sets currentQuestion property of the Game & return array contains articles with variants for answer
    func generateCurrentQuestion() -> [Article] {
        
        guard !gameIsFinished else {return [Article]()}
        
        if let currentQuestion = unusedArticles.randomElement() {
            self.currentQuestion = currentQuestion
        } else {
            return [Article]()
        }
        
        var articlesWithoutCurrentQuestion = unusedArticles.filter{$0 != currentQuestion}
        
        var answerVariants = [Article]()
        answerVariants.append(self.currentQuestion!)
        
        for _ in 1...countOfAdditionalAnswersVariants {
            let randomArticle = articlesWithoutCurrentQuestion.randomElement()!
            answerVariants.append(articlesWithoutCurrentQuestion.remove(at: articlesWithoutCurrentQuestion.firstIndex(of: randomArticle)!))
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
