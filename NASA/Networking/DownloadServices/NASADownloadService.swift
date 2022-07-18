//
//  NASADownloadService.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class NASADownloadService : DataDownloadService {
    private var urlFactory: URLFactory!
    private var urlSessionValidator: URLSessionValidator!
    
    init() {
        urlFactory = URLFactoryImpl()
        urlSessionValidator = URLSessionValidatorImpl()
    }
    
    internal func runDownload(date: Date, queryType: QueryType, completion: @escaping (Data) -> Void) {
        let requestURL = getRequestURL(date: date, queryType: queryType)

        DispatchQueue.global(qos: .userInteractive).async {
            URLSession.shared.dataTask(with: requestURL) { data, response, error in
                self.urlSessionValidator.validate(error: error)
                _ = self.urlSessionValidator.validate(urlReponse: response)
                let data = self.urlSessionValidator.validate(data: data)
                DispatchQueue.main.async {
                    completion(data)
                }
            }.resume()
        }
    }
    
    private func getRequestURL(date: Date, queryType: QueryType) -> URL {
        return urlFactory.createRequest(queryType: queryType, date: date)
    }
}
