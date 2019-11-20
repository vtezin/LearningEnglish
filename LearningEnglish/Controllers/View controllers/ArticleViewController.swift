//
//  ArticleViewController.swift
//  LearningEnglish
//
//  Created by test on 20.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var examplesLabel: UILabel!
    
    var article: Article!

}

extension ArticleViewController {
    
    func updateUI() {
        expressionLabel.text = article.expression
        translationLabel.text = article.translation
        examplesLabel.text = ""
    }
    
}

// MARK: - UIViewController
extension ArticleViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
}
