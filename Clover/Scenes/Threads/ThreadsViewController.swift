//
//  ThreadsViewController.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ThreadsViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        return tableView
    }()
    
    let dataSource = RxTableViewSectionedReloadDataSource<ThreadSection>(
        configureCell: { dataSource, tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
            let board = dataSource.sectionModels[indexPath.row].board
            let viewModel = PostCellViewModel(post: item, board: board)
            cell.setup(viewModel: viewModel)
            return cell
        },titleForHeaderInSection: { dataSource, index in
            return dataSource.sectionModels[index].header
        }
    )

    private let bag: DisposeBag = DisposeBag()

    private let viewModel: ThreadsViewModel
    
    init(viewModel: ThreadsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchThreads(page: 1)
    }
    
    private func setupBindings() {
            self.viewModel.sections
                .bind(to: self.tableView.rx.items(dataSource: dataSource))
                .disposed(by: self.bag)
    }
    
    private func setupUI() {
        title = viewModel.title

        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
