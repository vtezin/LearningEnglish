//
//  CellController.swift
//  LearningEnglish
//
//  Created by test on 20.11.2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class CellController {
    
    func configureCell(_ cell: UITableViewCell, with article: Article) {
        cell.textLabel?.text = article.expression
        cell.detailTextLabel?.text = article.translation
    }
    
}
