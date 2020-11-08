//
//  ThreadsViewController.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit
import RxSwift
import RxCocoa

class ThreadsViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BoardCell.self, forCellReuseIdentifier: "BoardCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        return tableView
    }()
    
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.viewModel.threads
                .asDriver()
                .drive(self.tableView.rx.items) { tableView, index, element in
                    let cell: PostCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
                    return cell
                }
                .disposed(by: self.bag)
        }
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
