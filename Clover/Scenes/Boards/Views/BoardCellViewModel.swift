//
//  BoardCellViewModel.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation

class BoardCellViewModel {
    
    let title: String
    let subtitle: String
    
    init(board: Board) {
        self.title = "/\(board.board)/ - \(board.title)"
        self.subtitle = board.metaDescription
    }
}
