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
    var countdownTimer: Timer?
    
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
        
        cryptexPickerView.delegate = self
        cryptexPickerView.dataSource = self
        
        updateViews()

    }
    
    func updateViews () {
        
        guard let hint = cryptexController.currentCryptex?.hint else { return }
        hintLabel.text = hint // set hint label
        
        
        cryptexPickerView.reloadAllComponents()
    }
    
    func hasMatchingPassword() -> Bool {
        guard let currentCryptex = cryptexController.currentCryptex else { return false }
        var letter: [String] = []
        
        for i in 0..<currentCryptex.password.count {
            let row = cryptexPickerView.selectedRow(inComponent: i)
            
            guard let title = pickerView(cryptexPickerView, titleForRow: row, forComponent: i) else { continue }
            letter.append(title)
        }
        
        let response = letter.joined()
        
        if response == currentCryptex.password {
            
            return true
            
        } else {
            
            return false
            
        }
    }
    
    
    // timer reset
    func reset() {
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { timer in
            self.presentNoTimeRemainingAlert()
        }
    }
    
    func newCryptexAndRest() {
        cryptexController.randomCryptex()
        updateViews()
        reset()
    }
    
    // corrected password
    func presentCorrectPasswordAlert() {
        let alert = UIAlertController(title: "Congragulations!", message: "Password You have entered is correct", preferredStyle: .alert)
        
        // alert respond
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {(action) in self.newCryptexAndRest() }))
        present(alert, animated: true, completion: nil)
    }
    
    
    // Password is wrong
    func presentIncorrectPasswordAlert() {
        let alert = UIAlertController(title: "Sorry", message: "You have entered a wrong password.", preferredStyle: .alert)
        
        // alert respond
        alert.addAction(UIAlertAction(title: "Try Again", style: .default))
        alert.addAction(UIAlertAction(title: "Next", style: .default, handler: {(action) in self.newCryptexAndRest() }))
        present(alert, animated: true, completion: nil)
    }
    
    // Times up
    func presentNoTimeRemainingAlert() {
        
        let alert = UIAlertController(title: "Times up", message: "Please reset timer or try a new one.", preferredStyle: .alert)
        
        // alert respond
        alert.addAction(UIAlertAction(title: "Reset Timer", style: .default, handler: {(action) in self.reset() }))
        alert.addAction(UIAlertAction(title: "New Challenge", style: .default, handler: {(action) in self.newCryptexAndRest() }))
        present(alert, animated: true, completion: nil)
    }
    
    // Unlock action
    @IBAction func unlockButtonTapped(_ sender: Any) {
        
        if hasMatchingPassword() == true {
            
            presentCorrectPasswordAlert()
            
        } else {
            
            presentIncorrectPasswordAlert()
        }
        
    }
    

}

extension CryptexViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // For the number of components, think about how you can figure out how many characters are in the `currentCryptex`'s password.
        guard let currentCryptex = cryptexController.currentCryptex else { return 0 }
        return currentCryptex.password.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // For the number of rows, we want to show as many rows as there are letters.
        
        return letters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // For the title of each row, we want to show the letter that corresponds to the row. i.e. row 0 should show "A", row 1 should show "B", etc.
        return letters[row]
    }
    
}

extension CryptexViewController: UIPickerViewDelegate {
    
    
}
