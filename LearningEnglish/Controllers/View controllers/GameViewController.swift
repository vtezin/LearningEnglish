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
    
    private let dataController = LocalData()
    let cellController = CellController()
    
    private var game: Game!
    private var currentQuestion: Article!
    private var answerVariants = [Article]()
    
    
    func updateUIFromModel() {
        questionLabel.text = game.currentQuestion?.expression
        answersTableView.reloadData()
    }
    
    @IBAction func nextQuestionTouched(_ sender: UIButton) {
        answerVariants = game.generateCurrentQuestion()
        updateUIFromModel()
    }
    
    
}

// MARK: - UIViewController
extension GameViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answersTableView.dataSource = self
        
        let dictionary = LanguageDictionary(language: "English", articles: [Article]())
        dictionary.articles = dataController.loadData()
        
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
        return cell
    }
    
}
