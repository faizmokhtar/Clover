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
}
