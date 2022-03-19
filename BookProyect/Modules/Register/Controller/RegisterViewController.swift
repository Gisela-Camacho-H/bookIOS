//
//  RegisterViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 21/01/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate  {

    // Buttons
    lazy var backButton : UIButton = UIButton()
    lazy var registerButton : UIButton = UIButton()
    
    lazy var topImageView: UIImageView = UIImageView()
    let db = Firestore.firestore()
    // TextField
    lazy var emailTextField : UITextField = UITextField()
    lazy var passwordTextField : UITextField = UITextField()
    lazy var userTextField : UITextField = UITextField()
    lazy var confirmTextField : UITextField = UITextField()
    
    // Labels
    lazy var registerInfoLabel : UILabel = UILabel()
    lazy var userLabel : UILabel = UILabel()
    lazy var emailLabel: UILabel = UILabel()
    lazy var passwordLabel: UILabel = UILabel()
    lazy var confirmLabel: UILabel = UILabel()
    
    lazy var contentform : UIView = UIView()
    lazy var textFieldStackView : UIStackView = UIStackView()
    lazy var labelStackView : UIStackView = UIStackView()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        

        initUI()
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.userTextField.delegate = self
        self.confirmTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func initUI(){
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: height/6 - 60, width: width, height: height/5))
        topImageView.image = UIImage(named: "topImage")
        view.addSubview(topImageView)
        
        backButton = UIButton(frame: CGRect(x: 25, y: height/7 - 40, width: 45, height: 45))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton)
        
        contentform = UIView(frame: CGRect(x: 20, y: height/3 - 20, width: width - 40, height: height/2))
        contentform.backgroundColor = .white
        contentform.layer.cornerRadius = 10
        view.addSubview(contentform)
        
        //MARK: - formulario de registro
        
        registerInfoLabel = UILabel(frame: CGRect(x: 20, y: 10, width: width - 60, height: 50))
        registerInfoLabel.text = "  Registration  "
        registerInfoLabel.font = .boldSystemFont(ofSize: 25)
        registerInfoLabel.textAlignment = .center
        registerInfoLabel.textColor = UIColor.brownColor
        contentform.addSubview(registerInfoLabel)
        
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(userTextField)
        self.view.addSubview(confirmTextField)
        passwordTextField.isSecureTextEntry = true
        confirmTextField.isSecureTextEntry = true
        
        let textFieldArray: [UITextField] = [userTextField, emailTextField, passwordTextField, confirmTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = Constants.height/25
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: registerInfoLabel.bottomAnchor, constant: 30),
            textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        textFieldArray.forEach {textFieldElement in
            textFieldElement.heightAnchor.constraint(equalToConstant: Constants.height/17).isActive = true
            textFieldElement.layer.cornerRadius = 7
            textFieldElement.layer.borderColor = UIColor.brownColor.cgColor
            textFieldElement.layer.borderWidth = 2
            textFieldElement.backgroundColor = .clear
            textFieldElement.textAlignment = NSTextAlignment.left
            textFieldElement.keyboardType = UIKeyboardType.default
            textFieldElement.autocorrectionType = UITextAutocorrectionType.no
            textFieldElement.clearButtonMode = UITextField.ViewMode.whileEditing
        }
        
        self.view.addSubview(userLabel)
        confirmLabel.text = "- Confirm -"
        passwordLabel.text = "Password"
        emailLabel.text = "--  Email  --"
        userLabel.text = "--  User  --"

        
        let labelArray: [UILabel] = [userLabel, emailLabel, passwordLabel, confirmLabel]
        
        labelStackView.axis = .vertical
        labelStackView.spacing = Constants.height/13
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelArray.forEach {label in
            labelStackView.addArrangedSubview(label)
        }
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: textFieldStackView.topAnchor, constant: -10),
            labelStackView.leftAnchor.constraint(equalTo: textFieldStackView.leftAnchor, constant: 20)
        ])
        labelArray.forEach {label in
            label.heightAnchor.constraint(equalToConstant: Constants.height/45).isActive = true
            label.widthAnchor.constraint(equalToConstant: 75).isActive = true
            label.backgroundColor = .white
            label.font = .boldSystemFont(ofSize: 12)
            label.textColor = UIColor.brownColor
            label.textAlignment = .center
        }
        
        registerButton = UIButton(frame: CGRect(x: 30, y: height - 120 , width: width - 60 , height: Constants.height/15))
        registerButton.backgroundColor = UIColor.brownColor
        registerButton.layer.cornerRadius = Constants.cornerRadius
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.setTitle("Register", for: .normal)
        registerButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        registerButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        
        view.addSubview(registerButton)
        
        
        
    }
    //MARK: - Funciones de regresar y registrar
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
    var alerta = ""
    @IBAction func goToLogin(_ sender: Any) {
        if (passwordTextField.text?.isEmpty)! || (emailTextField.text?.isEmpty)! || (userTextField.text?.isEmpty)! || (confirmTextField.text?.isEmpty)! {
            alerta = "Enter all the information"
            
        } else if passwordTextField.text != passwordTextField.text {
            alerta = "passwords should match"
            
        }else {
            UserDefaults.standard.set(userTextField.text, forKey: "user")
            UserDefaults.standard.set(emailTextField.text, forKey: "UserLog")
           
            if let password = passwordTextField.text, let email = emailTextField.text {
              Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        print(e)
                    } else {
                        let register = TabBarViewController()
                        register.modalPresentationStyle = .fullScreen
                        self.present(register , animated: true, completion: nil)
                   
                  if let user = self.userTextField.text {
                       self.db.collection("UserInfo").addDocument(data: ["User": user]) { (error) in
                           if let e = error {
                               print("There was a issue saving data to firestore, \(e)")
                           } else {
                               print("Successfully saved data.")
                           }
                       }
                   }
                    }
                }
           }
       }
        if alerta != "" {
                let alertView = UIAlertController(title: "Error", message: alerta, preferredStyle: .alert)
                let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                alertView.addAction(aceptar)
                self.present(alertView, animated: true, completion: nil)
            }
    }
    
}
