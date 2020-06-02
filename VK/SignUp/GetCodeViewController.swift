//
//  PhoneConfirmViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 27.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit
import FirebaseAuth
import FlagPhoneNumber

class PhoneConfirmViewController: UIViewController {
    
    
    var phoneNumber: String?
    var listController: FPNCountryListViewController!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var printNumber: FPNTextField!
    
    @IBOutlet weak var getCodeOutlet: UIButton! {
        didSet {
            getCodeOutlet.layer.cornerRadius = 10
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupConfig()
    }
    
    private func setupConfig() {
        
        getCodeOutlet.alpha = 0.5
        getCodeOutlet.isEnabled = false
        
        printNumber.displayMode = .list
        printNumber.delegate = self
        
        listController = FPNCountryListViewController(style: .grouped)
        listController?.setup(repository: printNumber.countryRepository)
        listController.didSelect = {
            country in self.printNumber.setFlag(countryCode: country.code)
        }
    }

    
    @IBAction func getCodeButton(_ sender: UIButton) {
        print("try")
    }
    
}

extension PhoneConfirmViewController: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        //
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            getCodeOutlet.alpha = 1
            getCodeOutlet.isEnabled = true
            
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            getCodeOutlet.alpha = 0.5
            getCodeOutlet.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        listController.title = "Countries"
        printNumber.text = ""
        self.present(navigationController, animated: true)
    }
    
    
    
    
}
