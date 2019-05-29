//
//  CryptexViewController.swift
//  Cryptex
//
//  Created by Enayatullah Naseri on 5/28/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController {
    
    var cryptexController = CryptexController()
    
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var cryptexPickerView: UIPickerView!
    @IBOutlet weak var unlockButton: UIButton!
    
    var letters = ["A", "B", "C", "D",
                   "E", "F", "G", "H",
                   "I", "J", "K", "L",
                   "M", "N", "O", "P",
                   "Q", "R", "S", "T",
                   "U", "V", "W", "X",
                   "Y", "Z"]

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    func updateViews () {
        guard let hint = cryptexController.currentCryptex?.hint else { return }
        hintLabel.text = hint // set hind label
    }
    
    @IBAction func unlockButtonTapped(_ sender: Any) {
        
    }
    

}

extension CryptexViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // For the number of components, think about how you can figure out how many characters are in the `currentCryptex`'s password.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // For the number of rows, we want to show as many rows as there are letters.
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // For the title of each row, we want to show the letter that corresponds to the row. i.e. row 0 should show "A", row 1 should show "B", etc.
    }
    
}

extension CryptexViewController: UIPickerViewDelegate {
    
    
}
