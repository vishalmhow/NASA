//
//  ViewController.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import UIKit

class PictureOfTheDayVC: UIViewController {
    let viewModel = PictureOfTheDayViewModel()
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var explanationTextView: UITextView!
    @IBOutlet weak var addFavouriteButton: UIBarButtonItem!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    let picker : UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get Current day picture
        getDateByDate(date: self.viewModel.getCurrentDate())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.self.updateButtonsState()
    }
    
    // MARK: Get data from server on the basis of dates
    internal func getDateByDate(date: Date) {
        if Reachability.isConnectedToNetwork() == false {
            let alert = UIAlertController(title: "No internet Connection", message: "Check internet connection and run application again", preferredStyle: .alert)
            present(alert, animated: true)
        } else {
            self.viewModel.downloadJSONfromServer(viewController: self,date: date) { (_, _) in
                DispatchQueue.main.async {
                    self.dateLabel.text = self.viewModel.lastDownloadedPictureOfTheDay.date
                    self.titleTextView.text = self.viewModel.lastDownloadedPictureOfTheDay.title
                    self.explanationTextView.text = self.viewModel.lastDownloadedPictureOfTheDay.explanation
                    self.pictureImageView.image = self.viewModel.downloadImage
                    self.updateButtonsState()
                }
            }
        }
    }
    
    // MARK: Updating top button states on the basis of picture availability
    internal func updateButtonsState() {
        self.viewModel.getButtonStates { (isMarkAvailable, isMarked) in
            self.addFavouriteButton.isEnabled = isMarked
            self.favouriteButton.isEnabled = isMarkAvailable
        }
    }
    
    // MARK: Mark picture as favourite
    @IBAction internal func addToFavouriteTapped(_ sender: Any) {
        self.viewModel.markAsFavourite { status, error in
            if status {
                self.updateButtonsState()
            }
        }
    }
    
    // MARK: Date selection mechanism
    @IBAction internal func dateButtonTapped(_ sender: Any) {
        picker.datePickerMode = UIDatePicker.Mode.date
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(dateChanged(sender:)), for: UIControl.Event.valueChanged)
        picker.frame = CGRect(x:0.0, y:self.view.frame.size.height-250, width:self.view.frame.size.width, height:250)
        picker.backgroundColor = .gray
        picker.maximumDate = self.viewModel.getCurrentDate()
        self.view.addSubview(picker)
    }
    @objc func dateChanged(sender:UIDatePicker){
        getDateByDate(date: sender.date)
        picker.removeFromSuperview()
    }
    // MARK: Dark mode management
    @IBAction internal func onSwitchTapped(_ sender: UISwitch) {
        if #available(iOS 13, *) {
            if sender.isOn {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                }
                return
            }
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
        }
    }
}

