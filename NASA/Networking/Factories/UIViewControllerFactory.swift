//
//  UIViewControllerFactory.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import UIKit

protocol UIViewControllerFactory {
    func create(name: String) -> UIViewController
}
