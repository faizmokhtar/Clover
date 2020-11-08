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

    private let service: APIServiceable
    private let board: String
    
    private let bag: DisposeBag = DisposeBag()

    init(service: APIServiceable = APIService(),
         board: String) {
        self.service = service
        self.board = board
    }
    
    func fetchThreads(page: Int = 1) {
        service.fetchThreads(board: board, page: page)
            .map({ $0.threads })
            .reduce([ThreadSection](), accumulator: { section, threads in
                section + [ThreadSection(header: "", items: threads)]
            })
            .subscribe(onNext: { [weak self] threads in
                guard let self = self else { return }
                self.sections.accept(threads)
            })
            .disposed(by: bag)
    }
}