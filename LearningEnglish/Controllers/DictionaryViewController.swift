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
    let DataController = LocalData()
    
    var articles = [Article]()
    
    
}

// MARK: - UIViewController
extension DictionaryViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articles = DataController.loadData()
    }
    
}
