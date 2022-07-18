//
//  ImageDownloadService.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import UIKit

protocol ImageDownloadService {
    func runDownload(link: String, completion: @escaping (UIImage?) -> Void)
}
