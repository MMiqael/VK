//
//  AlertService.swift
//  One Time Code
//
//  Created by Kyle Lee on 5/25/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    static let shared = AlertService()
    
    func successMessage(with code: String) -> UIAlertController {
        let alert = UIAlertController(title: "Success", message: "You have successfully logged in with code: \(code)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(action)
        return alert
    }
}
