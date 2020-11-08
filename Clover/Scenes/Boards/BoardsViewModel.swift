//
//  BoardsViewModel.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation
import RxSwift
import RxCocoa

class BoardsViewModel {
    
    let service: APIServiceable
    
    var boards: BehaviorRelay<[Board]>
    
    private let bag: DisposeBag = DisposeBag()

    init(
        service: APIServiceable = APIService(),
        boards: BehaviorRelay<[Board]> = BehaviorRelay<[Board]>(value: [])
         ) {
        self.service = service
        self.boards = boards
    }

    func fetchBoards() {
        service.fetchBoards()
            .subscribe(onNext: { [weak self] boards in
                guard let self = self else { return }
                self.boards.accept(boards.boards)
            })
            .disposed(by: bag)
    }
}
