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
    
    @IBOutlet weak var searhBar: UISearchBar!
    var articlesFoundedBySearch = [Article]()
    
    
    //tied controller with model
    let dataController = LocalData()
    let cellController = CellController()
    
    /// dictionary
    let dictionary = LanguageDictionary(language: "English", articles: [Article]())
        
}

// MARK: - UIViewController
extension DictionaryViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionary.articles = dataController.loadData()
        articlesList.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension DictionaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articlesFoundedBySearch.count > 0
            ? articlesFoundedBySearch.count
            : dictionary.articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = articlesList.dequeueReusableCell(withIdentifier: "ArticleCell")!
        
        let article = articlesFoundedBySearch.count > 0
            ? articlesFoundedBySearch[indexPath.row]
            : dictionary.articles[indexPath.row]
        
        cellController.configureCell(cell, with: article)
        return cell
    }
    
}

// MARK: - Navigation
extension DictionaryViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showArticleSegue" else {return}
        guard let articleViewController = segue.destination as? ArticleViewController else { return }
        guard let indexOfSelectedCell = articlesList.indexPathForSelectedRow else {return}
        
        let article = articlesFoundedBySearch.count > 0
            ? articlesFoundedBySearch[indexOfSelectedCell.row]
            : dictionary.articles[indexOfSelectedCell.row]
        
        articleViewController.article = article
        
    }
    
}

// MARK: - Searching
extension DictionaryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        articlesFoundedBySearch = dictionary.articles.filter({$0.expression.prefix(searchText.count).capitalized == searchText.capitalized})
        articlesList.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        articlesFoundedBySearch.removeAll()
        articlesList.reloadData()
        view.endEditing(true)
    }
}
