//
//  GameViewController.swift
//  LearningEnglish
//
//  Created by test on 20.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersTableView: UITableView!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let dataController = LocalData()
    let cellController = CellController()
    
    private var game: Game!
    private var currentQuestion: Article!
    private var answerVariants = [Article]()
    private var markCorrectAnswer = false
    private var selectedAnswer: Article!
    
    func updateUIFromModel() {
        questionLabel.text = game.currentQuestion?.expression
        answersTableView.reloadData()
        resultLabel.text = game.result.byString
    }
    
    @IBAction func nextQuestionTouched(_ sender: UIButton) {
        answerVariants = game.generateCurrentQuestion()
        markCorrectAnswer = false
        selectedAnswer = nil
        updateUIFromModel()
    }
    
    
}

// MARK: - UIViewController
extension GameViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersTableView.dataSource = self
        answersTableView.delegate = self
        
        let dictionary = LanguageDictionary(language: "English", articles: [Article]())
        dictionary.articles = dataController.loadData()
        
        selectedAnswer = nil
        
        game = Game(dictionary: dictionary, countOfAnswerVariants: 4)
        answerVariants = game.generateCurrentQuestion()
        updateUIFromModel()
    }
}

// MARK: - UITableViewDataSource
extension GameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        answerVariants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = answersTableView.dequeueReusableCell(withIdentifier: "AnswerCell")!
        
        let article = answerVariants[indexPath.row]
        cellController.configureAnswerCell(cell, with: article)
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        if let selectedAnswer = selectedAnswer,
            article == selectedAnswer,
            selectedAnswer != game.currentQuestion{
            cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        
        if markCorrectAnswer, article == game.currentQuestion {
            cell.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
        
        return cell
    }
    
}

extension GameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedAnswer = answerVariants[indexPath.row]
        
        game.checkAnswerAndUpdateResult(answer: selectedAnswer)
        
        markCorrectAnswer = true
        
        updateUIFromModel()
        
    }
    
}
