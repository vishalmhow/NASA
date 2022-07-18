//
//  URLSessionValidator.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol URLSessionValidator {
    func validate(error: Error?)
    func validate(urlReponse: URLResponse?) -> URLResponse
    func validate(data: Data?) -> Data
}
