//
//  URLRequest + Extension.swift
//  NewsApp using rx transforming operators
//
//  Created by kairzhan on 2/26/21.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    
    static func load<T>(resourse: Resource<T>) -> Observable<T?> {
        return Observable.from([resourse.url])
            .flatMap { (url) -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { (data) -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
}
