//
//  PostCellViewModel.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation
import UIKit

class PostCellViewModel {
    
    let text: String?
    let thumbnailName: Int?
    let board: String

    let thumbnailHeight: CGFloat
    let thumbnailWidth: CGFloat
        
    init(post: Post, board: Board) {
        self.text = post.com
        self.thumbnailName = post.tim
        self.board = board.board
        self.thumbnailHeight = CGFloat(post.tnH ?? 0)
        self.thumbnailWidth = CGFloat(post.tnW ?? 0)
    }
    
    func image() -> URL? {
        guard let thumbnail = thumbnailName else { return nil }
        return URL(string: "https://i.4cdn.org/\(board)/\(thumbnail)s.jpg")
    }
}
