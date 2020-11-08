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
    var items: [Item]
}

extension ThreadSection: SectionModelType {
    typealias Item = Thread
    
    init(original: ThreadSection, items: [Item]) {
        self = original
        self.items = items
    }
}

let dataSource = RxTableViewSectionedReloadDataSource<ThreadSection>(
    configureCell: { dataSource, tableView, indexPath, item in
        guard let post = item.posts.item(at: indexPath.row) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let viewModel = PostCellViewModel(post: post)
        cell.setup(viewModel: viewModel)
        return cell
    }
)
