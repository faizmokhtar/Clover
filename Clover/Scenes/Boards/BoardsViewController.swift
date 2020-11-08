//
//  BoardsViewController.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import UIKit
import RxSwift
import RxCocoa

class BoardsViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BoardCell.self, forCellReuseIdentifier: "BoardCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        return tableView
    }()
    
    private let bag: DisposeBag = DisposeBag()

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
        setupUI()
        setupBindings()
        viewModel.fetchBoards()
    }
    
    func setupBindings() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.viewModel.boards
                .asDriver()
                .drive(self.tableView.rx.items) { tableView, index, element in
                    let cell: BoardCell = tableView.dequeueReusableCell(withIdentifier: "BoardCell") as! BoardCell
                    let viewModel = BoardCellViewModel(board: element)
                    cell.setup(viewModel: viewModel)
                    return cell
                }
                .disposed(by: self.bag)
        }
    
        tableView.rx.modelSelected(Board.self)
            .asDriver()
            .drive(onNext: { [weak self] element in
                print(element)
                let viewModel = ThreadsViewModel(board: element)
                let viewController = ThreadsViewController(viewModel: viewModel)
                self?.navigationController?.pushViewController(viewController, animated: true)
            })
            .disposed(by: bag)
    }
    
    func setupUI() {
        title = "Boards"

        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
