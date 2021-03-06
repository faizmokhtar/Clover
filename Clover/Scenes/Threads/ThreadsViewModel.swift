//
//  ThreadsViewModel.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation
import RxSwift
import RxCocoa

class ThreadsViewModel {
    
    var threads: BehaviorRelay<[Thread]> = BehaviorRelay<[Thread]>(value: [])
    var sections: BehaviorRelay<[ThreadSection]> = BehaviorRelay<[ThreadSection]>(value: [])

    var title: String {
        return "/\(board.board)/"
    }
    
    private let service: APIServiceable
    private let board: Board
    
    private let bag: DisposeBag = DisposeBag()

    init(service: APIServiceable = APIService(),
         board: Board) {
        self.service = service
        self.board = board
    }
    
    func fetchThreads(page: Int = 1) {
        service.fetchThreads(board: board.board, page: page)
            .map({ $0.threads })
            .flatMap({ Observable.from($0) })
            .map({ $0.posts })
            .reduce([ThreadSection](), accumulator: { section, posts in
                section + [ThreadSection(header: "\(posts.first?.name ?? "") \(posts.first?.now ?? "") )", board: self.board, items: posts)]
            })
            .subscribe(onNext: { [weak self] threads in
                guard let self = self else { return }
                print(threads)
                self.sections.accept(threads)
            })
            .disposed(by: bag)
    }
}
