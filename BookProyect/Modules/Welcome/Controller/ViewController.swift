//
//  ViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 20/01/22.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logoView: logoView!
    //MARK: - Image
    private lazy var topImageView: UIImageView = UIImageView()
    private lazy var imageBook : UIImageView = UIImageView()
//MARK: - Labels
    private lazy var bienvenidosLabel : UILabel = UILabel()
    private lazy var correoLabel: UILabel = UILabel()
    private lazy var contrasenaLabel: UILabel = UILabel()
    private lazy var cuentaLabel : UILabel = UILabel()
//MARK: - TextField
    private lazy var correoTextField : UITextField = UITextField()
    private lazy var contrasenaTextField : UITextField = UITextField()
//MARK: - Button
    private lazy var loginButton : UIButton = UIButton()
    private lazy var registrateButton: UIButton = UIButton()
    var passwordButton: UIButton?
//MARK: - StackViews
    private lazy var textFieldStackView: UIStackView = UIStackView()
    private lazy var cuentaStackView: UIStackView = UIStackView()
    private lazy var labelsStackView: UIStackView = UIStackView()
//MARK: - View
    private lazy var bienvenidoView : UIView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //llamar función initUI
        initUI()
        self.correoTextField.delegate = self
        self.contrasenaTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: height/6 - 60, width: width, height: height/5))
        topImageView.image = UIImage(named: "topImage")
        view.addSubview(topImageView)
        
        bienvenidoView = UIView(frame: CGRect(x: 20, y: height/4 + 60, width: width - 40, height: 160))
        bienvenidoView.backgroundColor = .white
        bienvenidoView.layer.cornerRadius = 20
        view.addSubview(bienvenidoView)
        
        logoView.backgroundColor = .clear
        logoView.layer.cornerRadius = 20
        view.addSubview(logoView)

        imageBook = UIImageView(frame: CGRect(x: width/2, y: 0, width: 90, height: 90))
        imageBook.image = UIImage(named: "icon")
        bienvenidoView.addSubview(imageBook)
        
        bienvenidosLabel = UILabel(frame: CGRect(x: 70, y: 100, width: width - 60, height: 50))
        bienvenidosLabel.text = ""
        var charIndex = 0
       let titleText = "   Welcome   "
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: Double(charIndex) * 0.3, repeats: false){
                (timer) in
                self.bienvenidosLabel.text?.append(letter)
            }
            charIndex += 1
        }
        bienvenidosLabel.font = .boldSystemFont(ofSize: 30)
        bienvenidosLabel.textAlignment = .center
        bienvenidosLabel.textColor = UIColor.brownColor
        bienvenidoView.addSubview(bienvenidosLabel)
        
        // MARK: - formulario de log in
        
        self.view.addSubview(correoTextField)
        contrasenaTextField.isSecureTextEntry = true
        self.view.addSubview(contrasenaTextField)
        
        let textFieldArray: [UITextField] = [correoTextField, contrasenaTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 30
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: bienvenidoView.topAnchor, constant: 200),
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


        correoLabel = UILabel(frame: CGRect(x: 20, y: -10, width: 50, height: 20))
        correoLabel.text = "Email"
        correoLabel.backgroundColor = UIColor.backgroundColor
        correoLabel.font = .boldSystemFont(ofSize: 13)
        correoLabel.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        correoLabel.textAlignment = .center
        textFieldStackView.addSubview(correoLabel)
        
        contrasenaLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 80, height: 20))
        contrasenaLabel.text = "Password"
        contrasenaLabel.backgroundColor = UIColor.backgroundColor
        contrasenaLabel.font = .boldSystemFont(ofSize: 13)
        contrasenaLabel.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        contrasenaLabel.textAlignment = .center
        textFieldStackView.addSubview(contrasenaLabel)
        
        loginButton = UIButton(frame: CGRect(x: 30, y:  height - 160 , width: width - 60  , height: 60))
        loginButton.backgroundColor = UIColor.brownColor
        loginButton.layer.cornerRadius = 23
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        loginButton.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        view.addSubview(loginButton)
        
        passwordButton = UIButton()
        view.addSubview(passwordButton!)
        passwordButton?.addAnchorsAndSize(width: 50, height: 50, left: nil, top: -50, right: nil, bottom: nil, withAnchor: .top, relativeToView: contrasenaTextField)
        passwordButton?.addAnchors(left: -50, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: contrasenaTextField)
        passwordButton?.setImage(UIImage(systemName: "eye.fill" ), for: .normal)
        passwordButton?.tintColor = .black
        passwordButton?.addTarget(self, action: #selector(verpass), for: .touchUpInside)
        
        // MARK: - Registro
        
        cuentaLabel.text = "No account?  "
        cuentaLabel.font = .boldSystemFont(ofSize: 18)
        cuentaLabel.textColor = UIColor.brownColor
        self.view.addSubview(cuentaLabel)
        
        registrateButton.setTitleColor(.coralColor, for: .normal)
        registrateButton.setTitle("Sign-up", for: .normal)
        registrateButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        registrateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(registrateButton)
//MARK: - cuentaStackView
        let cuentaArray: [AnyObject] = [cuentaLabel, registrateButton]
        
        cuentaStackView.axis = .horizontal
        cuentaStackView.spacing = 1
        cuentaStackView.alignment = .fill
        cuentaStackView.distribution = .equalSpacing
            cuentaArray.forEach {element in
                cuentaStackView.addArrangedSubview(element as! UIView)
        }
        self.view.addSubview(cuentaStackView)
        cuentaStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([cuentaStackView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            cuentaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        cuentaArray.forEach {element in
            element.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
        
    }
// MARK: - Función de botones
    @objc func verpass(){
        contrasenaTextField.isSecureTextEntry.toggle()
    }
    //funcion log in y verificación de campos vacios
    @IBAction func goToBooks(_ sender: Any) {
        var alerta = ""
        if (contrasenaTextField.text?.isEmpty)! || (correoTextField.text?.isEmpty)!  {
            alerta = "Ingrese todos los datos requeridos"
       } else {
           if let password = contrasenaTextField.text, let email = correoTextField.text {
               Auth.auth().signIn(withEmail: email, password: password) {
                   [weak self] authResult, error in
                   if let e = error {
                       print(e)
                   }else {
                       print("books")
                        let gotoBooks = TabBarViewController()
                       gotoBooks.modalPresentationStyle = .fullScreen
                       self?.present(gotoBooks, animated: true, completion: nil)
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
    
    //funcion de ir al registro
    @objc func register (){
        print("go to register")
         let register = RegisterViewController()
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
}

