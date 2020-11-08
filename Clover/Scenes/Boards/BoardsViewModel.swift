//
//  BoardsViewModel.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation
import RxSwift

class BoardsViewModel {
    
    let service: APIServiceable
    
    private let bag: DisposeBag = DisposeBag()

    init(service: APIServiceable = APIService()) {
        self.service = service
    }

    func fetchBoards() {
        service.fetchBoards()
            .subscribe(onNext: { boards in
                print(boards)
            })
            .disposed(by: bag)
    }
}
