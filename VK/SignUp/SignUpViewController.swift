//
//  SignUpViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 26.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let picker = UIDatePicker()

    @IBOutlet weak var scrollViewSignUp: UIScrollView!
    
    @IBOutlet weak var signUpLable: UILabel!
    
    @IBOutlet weak var firstNameInput: UITextField!
    
    @IBOutlet weak var lastNameInput: UITextField!
    
    @IBOutlet weak var yourGenderLable: UILabel!
    
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var birthdayLable: UILabel!
    
    @IBOutlet weak var birthdayInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createDataPicker()
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    
    func createDataPicker() {
            
//      birthdayInput.textAlignment = .center
            
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
            
        // bar button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolbar.setItems([doneButton], animated: true)
            
        //assign toolbar
        birthdayInput.inputAccessoryView = toolbar
            
        //assign date picker to the text field
        birthdayInput.inputView = picker
            
        //date picker mode
        picker.datePickerMode = .date
    }
    
    @objc func donePressed() {
        
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
          
          birthdayInput.text = formatter.string(from: picker.date)
          self.view.endEditing(true)
          
          
          
      }
    

}
