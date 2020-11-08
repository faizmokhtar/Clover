//
//  APIService.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

protocol APIServiceable {
    func fetchBoards() -> Observable<Boards>
    
    func fetchThreads(board: String, page: Int) -> Observable<Threads>
}

class APIService: APIServiceable {
    
    private let session = Session.default
    private let baseURL = "https://a.4cdn.org/"

    func fetchBoards() -> Observable<Boards> {
        let url = "\(baseURL)boards.json"
        
        return session.rx.request(.get, url)
            .debug()
            .responseData()
            .map { _, data in
                return try JSONDecoder().decode(Boards.self, from: data)
            }
            .asObservable()
    }
    
    func fetchThreads(board: String, page: Int) -> Observable<Threads> {
        let url = "\(baseURL)\(board)/\(page).json"
        
        return session.rx.request(.get, url)
            .debug()
            .responseData()
            .map { _, data in
                return try JSONDecoder().decode(Threads.self, from: data)
            }
            .asObservable()
    }
}
