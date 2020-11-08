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
    typealias Item = Post
    
    init(original: ThreadSection, items: [Item]) {
        self = original
        self.items = items
    }
}

let dataSource = RxTableViewSectionedReloadDataSource<ThreadSection>(
    configureCell: { dataSource, tableView, indexPath, item in
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let viewModel = PostCellViewModel(post: item)
        cell.setup(viewModel: viewModel)
        return cell
    },titleForHeaderInSection: { dataSource, index in
        return dataSource.sectionModels[index].header
    }
)
