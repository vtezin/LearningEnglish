//
//  DictionaryViewController.swift
//  LearningEnglish
//
//  Created by test on 20.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class DictionaryViewController: UIViewController {

    //tied controller with view
    @IBOutlet weak var articlesList: UITableView!
    
    //tied controller with model
    let dataController = LocalData()
    let cellController = CellController()
    
    /// articles of dictionary
    var articles = [Article]()
    
    
}

// MARK: - UIViewController
extension DictionaryViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = dataController.loadData()
        articlesList.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension DictionaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articlesList.dequeueReusableCell(withIdentifier: "ArticleCell")!
        
        let article = articles[indexPath.row]
        cellController.configureCell(cell, with: article)
        return cell
    }
    
}

extension DictionaryViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showArticleSegue" else {return}
        guard let articleViewController = segue.destination as? ArticleViewController else { return }
        guard let indexOfSelectedCell = articlesList.indexPathForSelectedRow else {return}
        
        articleViewController.article = articles[indexOfSelectedCell.row]
        
        
    }
    
}
