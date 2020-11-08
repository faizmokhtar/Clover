//
//  BoardsViewController.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit

class BoardsViewController: UIViewController {

    let viewModel: BoardsViewModel
    
    init(viewModel: BoardsViewModel = BoardsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchBoards()
    }
}
