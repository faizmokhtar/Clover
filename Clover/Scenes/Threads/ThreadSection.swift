//
//  ThreadSection.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation
import UIKit
import RxDataSources

struct ThreadSection {
    var header: String
    var board: Board
    var items: [Item]
}

extension ThreadSection: SectionModelType {
    typealias Item = Post
    
    init(original: ThreadSection, items: [Item]) {
        self = original
        self.items = items
    }
}
