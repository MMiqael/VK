//
//  ViewController.swift
//  VK
//
//  Created by Микаэл Мартиросян on 08.05.2020.
//  Copyright © 2020 Микаэл Мартиросян. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView:    UIScrollView!
    
    @IBOutlet weak var itemVK:        UIImageView!
    
    @IBOutlet weak var loginInput:    UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var enterButton:   UIButton! {
        didSet {
            enterButton.layer.cornerRadius = 10
            enterButton.setTitle("Log In", for: .normal)
            
            // Задать кнопке кастомный цвет
            //            enterButton.setTitleColor(.white, for: .normal)
            //            enterButton.backgroundColor = .init(red: 58, green: 112, blue: 192, alpha: 1)
            //            enterButton.backgroundColor = UIColor(red: 58, green: 112, blue: 192, alpha: 1)
            //            enterButton.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 73, green: 133, blue: 203, alpha: 1))
            //            enterButton.addTarget(self, action: #selector(), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var forgotPassword: UIButton! {
        didSet {
            forgotPassword.tintColor = UIColor(red: 58, green: 112, blue: 192, alpha: 1)
        }
    }
    
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            signUpButton.layer.cornerRadius = 10
            //            signUpButton.setTitleColor(UIColor(red: 58, green: 112, blue: 192, alpha: 1), for: .normal)
            
            
            // РАЗОБРАТЬСЯ С ЭТИМ!!!!!!!!!!!!!!!!!!!!!!!!!
            NSLayoutConstraint.activate([
                signUpButton.centerXAnchor.constraint (equalTo: scrollView.centerXAnchor),
                signUpButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),
                signUpButton.leadingAnchor.constraint (equalTo: scrollView.leadingAnchor, constant: 20),
                signUpButton.trailingAnchor.constraint(equalTo: forgotPassword.trailingAnchor),
                signUpButton.leadingAnchor.constraint (equalTo: forgotPassword.leadingAnchor),
                signUpButton.bottomAnchor.constraint  (equalTo: scrollView.bottomAnchor, constant: 21),
                signUpButton.topAnchor.constraint     (equalTo: scrollView.topAnchor, constant: 668),
                signUpButton.heightAnchor.constraint  (equalToConstant: 45),
                signUpButton.topAnchor.constraint     (equalTo: itemVK.bottomAnchor, constant: 520),
                signUpButton.topAnchor.constraint     (equalTo: loginInput.bottomAnchor, constant: 375),
                signUpButton.topAnchor.constraint     (equalTo: passwordInput.bottomAnchor, constant: 331),
                signUpButton.topAnchor.constraint     (equalTo: enterButton.bottomAnchor, constant: 253),
                signUpButton.topAnchor.constraint     (equalTo: forgotPassword.bottomAnchor, constant: 200)
            ])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        //  Блокировка кнопки
        //        setupConfig()
        
        // Пример для задания Курса 3, урок 1
//        let example = Session.singleton
//        example.token = "aoksjd3oijqoe9as"
//        example.userID = 23
    }

    
    @IBAction func enterButton(_ sender: UIButton) {
        // Получаем текст логина
        //        let login = loginInput.text!
        //        // Получаем текст-пароль
        //        let password = passwordInput.text!
        //
        //        // Проверяем, верны ли они
        //        if (login == "admin@vk.com" || login == "89991234567") && password == "123456" {
        //            print("successful authorization")
        ////            prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
        //        } else {
        ////            print("authorisation error")
        //            let alertController = UIAlertController(title: "Authorisation Error:", message: "username or password is incorrect", preferredStyle: .alert)
        //            let defaultAction = UIAlertAction(title: "Try again", style: .cancel, handler: nil)
        //                        
        //            alertController.addAction(defaultAction)
        //            self.present(alertController, animated: true, completion: nil)
        //        }
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
    }
    
    @IBAction func exitFromGetCode(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "exitFromGetCode" {
            guard unwindSegue.source is GetCodeViewController else { return }
        }
    }
    
    // Выход из аккаунта
    //    @IBAction func logOutSegue(_ sender: UIStoryboardSegue) {
    //        performSegue(withIdentifier: "logOutSegue:", sender: self)
    //    }
    
    // Блокировка кнопки
    //    private func setupConfig() {
    //
    //        enterButton.alpha = 0.5
    //        enterButton.isEnabled = false
    //    }
    
    
    
    
    //Проверить что это!!!!!!!!!
    
    //        let navigationBar = navigationController!.navigationBar
    //        navigationBar.setBackgroundImage(#imageLiteral(resourceName: "BarBackground"),
    //                                                                for: .default)
    //        navigationBar.shadowImage = UIImage()
    
    //Выход из аккаунта
    //        DispatchQueue.main.async {
    //            if Auth.auth().currentUser?.uid != nil {
    //                let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //                let dvc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    //                self.present(dvc, animated: true)
    //            }
    //        }
    
}


extension ViewController {
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info          = notification.userInfo! as NSDictionary
        let kbSize        = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset     = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets        = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
}
