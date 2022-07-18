//
//  FavouriteListVC.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import UIKit

class FavouriteListVC: UIViewController {
    @IBOutlet private weak var favouriteTableView: UITableView!
    let viewModel = FavouriteListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getFavouriteList { _ in
            DispatchQueue.main.async {
                self.favouriteTableView.reloadData()
            }
        }
    }
    
    // MARK: Opening Favourite screen logic
    func openFavouriteScene(selectedPicture: DailyPicture) {
        guard let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FavouriteVC") as? FavouriteVC else {
            return
        }
        controller.viewModel.selectedPicture = selectedPicture
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
// MARK: - UITableview Extention for its delegates and DataSource Implementation
extension FavouriteListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.favoritesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesCell", for: indexPath) as? FavouritesCell else {
            return UITableViewCell()
        }
        cell.configureFavouriteCell(dailyPicture: viewModel.favoritesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openFavouriteScene(selectedPicture: viewModel.favoritesArray[indexPath.row])
    }
}
