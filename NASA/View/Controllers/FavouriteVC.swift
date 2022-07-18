//
//  FavouriteVC.swift
//  NASA
//
//  Created by Vishal22 Sharma on 18/07/22.
//

import UIKit

class FavouriteVC: UIViewController {
    let viewModel = FavouriteViewModel()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.selectedPicture?.date
        
        self.viewModel.setupImage(viewController: self) { status, error in
            DispatchQueue.main.async {
                self.imageView.image = self.viewModel.downloadImage
            }
        }
    }
    
    // MARK: Removing Pictures from Favourite list
    @IBAction internal func removeButtonTapped(_ sender: Any) {
        self.viewModel.removeFavourite { (status, error) in
            if status {
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: false)
                }
            }
        }
    }
}
