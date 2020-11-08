//
//  PostCellViewModel.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation

class PostCellViewModel {
    
    let text: String?
    
    init(post: Post) {
        self.text = post.com
    }
}
