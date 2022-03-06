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
    lazy var correoTextField : UITextField = UITextField()
    lazy var contrasenaTextField : UITextField = UITextField()
    lazy var usuarioTextField : UITextField = UITextField()
    lazy var confirmarTextField : UITextField = UITextField()
    
    // Labels
    lazy var RegistraInfoLabel : UILabel = UILabel()
    lazy var usuarioLabel : UILabel = UILabel()
    lazy var correoLabel: UILabel = UILabel()
    lazy var contrasenaLabel: UILabel = UILabel()
    lazy var confirmarLabel: UILabel = UILabel()
    
    lazy var contentform : UIView = UIView()
    lazy var textFieldStackView : UIStackView = UIStackView()
    lazy var labelStackView : UIStackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        initUI()
        self.correoTextField.delegate = self
        self.contrasenaTextField.delegate = self
        self.usuarioTextField.delegate = self
        self.confirmarTextField.delegate = self
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
        
        RegistraInfoLabel = UILabel(frame: CGRect(x: 30, y: 0, width: width - 60, height: 50))
        RegistraInfoLabel.text = "  Registration  "
        RegistraInfoLabel.font = .boldSystemFont(ofSize: 22)
        RegistraInfoLabel.textAlignment = .center
        RegistraInfoLabel.textColor = UIColor.brownColor
        contentform.addSubview(RegistraInfoLabel)
        
        self.view.addSubview(correoTextField)
        self.view.addSubview(contrasenaTextField)
        self.view.addSubview(usuarioTextField)
        self.view.addSubview(confirmarTextField)
        contrasenaTextField.isSecureTextEntry = true
        confirmarTextField.isSecureTextEntry = true
        
        let textFieldArray: [UITextField] = [usuarioTextField, correoTextField, contrasenaTextField, confirmarTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 45
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: RegistraInfoLabel.bottomAnchor, constant: 5),
            textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        textFieldArray.forEach {textFieldElement in
            textFieldElement.heightAnchor.constraint(equalToConstant: 50).isActive = true
            textFieldElement.layer.cornerRadius = 25
            textFieldElement.layer.borderColor = UIColor.brownColor.cgColor
            textFieldElement.layer.cornerRadius = 7
            textFieldElement.layer.borderWidth = 2
            textFieldElement.backgroundColor = .clear
            textFieldElement.textAlignment = NSTextAlignment.left
        }
        
        self.view.addSubview(correoLabel)
        self.view.addSubview(contrasenaLabel)
        self.view.addSubview(usuarioLabel)
        self.view.addSubview(confirmarLabel)
        confirmarLabel.text = "- Confirm -"
        contrasenaLabel.text = "Password"
        correoLabel.text = "--  Email  --"
        usuarioLabel.text = "--  User  --"
        
        let labelArray: [UILabel] = [usuarioLabel, correoLabel, contrasenaLabel, confirmarLabel]
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 75
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelArray.forEach {label in
            labelStackView.addArrangedSubview(label)
        }
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: textFieldStackView.topAnchor, constant: -10 ),
            labelStackView.leftAnchor.constraint(equalTo: textFieldStackView.leftAnchor, constant: 20)
        ])
        labelArray.forEach {label in
            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
            label.widthAnchor.constraint(equalToConstant: 75).isActive = true
            label.backgroundColor = .white
            label.font = .boldSystemFont(ofSize: 12)
            label.textColor = UIColor.brownColor
            label.textAlignment = .center
        }
        
        registerButton = UIButton(frame: CGRect(x: 30, y: height - 140 , width: width - 60 , height: 50))
        registerButton.backgroundColor = UIColor.brownColor
        registerButton.layer.cornerRadius = 18
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
    
    @IBAction func goToLogin(_ sender: Any) {
        if (contrasenaTextField.text?.isEmpty)! || (correoTextField.text?.isEmpty)! || (usuarioTextField.text?.isEmpty)! || (confirmarTextField.text?.isEmpty)!  {
          print("Text field is empty")
       } else {
           
           if let password = contrasenaTextField.text, let email = correoTextField.text {
           Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
               if let e = error {
                   print(e)
               } else {
                        let register = TabBarViewController()
                        register.modalPresentationStyle = .fullScreen
                        self.present(register , animated: true, completion: nil)
                    }
                }
           }
           if let user = usuarioTextField.text {
               db.collection("UserInfo").addDocument(data: ["User": user]) { (error) in
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
