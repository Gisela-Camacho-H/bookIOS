//
//  ViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 20/01/22.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var logoView: logoView?
//MARK: - Image
    private lazy var topImageView: UIImageView = UIImageView()
    private lazy var topImageView1: UIImageView = UIImageView()
    private lazy var imageBook : UIImageView = UIImageView()
    private lazy var imageBook1 : UIImageView = UIImageView()
    
//MARK: - Labels
    private lazy var welcomeLabel : UILabel = UILabel()
    private lazy var welcomeLabel1 : UILabel = UILabel()
    private lazy var emailLabel: UILabel = UILabel()
    private lazy var passwordLabel: UILabel = UILabel()
    private lazy var accountLabel : UILabel = UILabel()
    private lazy var userLabel: UILabel = UILabel()
    private lazy var continueLabel: UILabel = UILabel()
    
//MARK: - TextField
    private lazy var emailTextField : UITextField = UITextField()
    private lazy var passwordTextField : UITextField = UITextField()
    
//MARK: - Button
    private lazy var loginButton : UIView.brownButton = {
        loginButton = UIView.brownButton()
        return loginButton
    }()
    
    private lazy var signUpButton: UIButton = UIButton()
    lazy var exitButton: UIButton = UIButton()
    lazy var nextButton: UIButton = UIButton()
    var passwordButton: UIButton?
    
//MARK: - StackViews
    private lazy var textFieldStackView: UIStackView = UIStackView()
    private lazy var accounStackView: UIStackView = UIStackView()
    private lazy var labelsStackView: UIStackView = UIStackView()
    
//MARK: - View
    private lazy var welcomeView : UIView = UIView()
    private lazy var welcomeView1 : UIView = UIView()
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        validateUser()
        
    }
    
    func validateUser(){
        if let user = defaults.string(forKey: "UserLog"){
            print("books")
            let gotoBooks = TabBarViewController()
            gotoBooks.modalPresentationStyle = .fullScreen
            self.present(gotoBooks, animated: true, completion: nil)
            userLogged(name: user)
        }else {
            initUI()
        }
    }
    
    func userLogged(name: String){
        
        exitButton = UIButton(frame: CGRect(x: width - 60, y: height/8 - 40, width: 45, height: 45))
        exitButton.setImage(UIImage(named: "exit"), for: .normal)
        exitButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
        view.addSubview(exitButton)
        
        topImageView1 = UIImageView(frame: CGRect(x: 0, y: height/6 - 20, width: width, height: height/5))
        topImageView1.image = UIImage(named: "topImage")
        view.addSubview(topImageView1)
        
        welcomeView1 = UIView(frame: CGRect(x: 20, y: height/3 + 75, width: width - 40, height: 200))
        welcomeView1.backgroundColor = .white
        welcomeView1.layer.cornerRadius = 20
        view.addSubview(welcomeView1)

        imageBook1 = UIImageView(frame: CGRect(x: width/2 - 60, y: 0, width: 90, height: 90))
        imageBook1.image = UIImage(named: "icon")
        welcomeView1.addSubview(imageBook1)
        
        let userName = defaults.string(forKey: "user")
        userLabel = UILabel(frame: CGRect(x: 0, y: 150, width: width - 60, height: 50))
        userLabel.text = "    \(userName ?? "" )  "
        userLabel.textAlignment = .center
        userLabel.textColor = UIColor.coralColor
        userLabel.font = .boldSystemFont(ofSize: 30)
        welcomeView1.addSubview(userLabel)
        
        welcomeLabel1 = UILabel(frame: CGRect(x: -20, y: 100, width: width, height: 50))
        welcomeLabel1.text = ""
        var charIndex = 0
       let titleText = "Welcome Back!"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: Double(charIndex) * 0.3, repeats: false){
                (timer) in
                self.welcomeLabel1.text?.append(letter)
            }
            charIndex += 1
        }
        welcomeLabel1.font = .boldSystemFont(ofSize: 25)
        welcomeLabel1.textAlignment = .center
        welcomeLabel1.textColor = UIColor.brownColor
        welcomeView1.addSubview(welcomeLabel1)
        
        continueLabel = UILabel(frame: CGRect(x: width - 260, y: height - 150 , width: 200, height: 50))
        continueLabel.text = " Let's continue"
        continueLabel.textAlignment = .center
        continueLabel.textColor = UIColor.coralColor
        continueLabel.font = .boldSystemFont(ofSize: 25)
        view.addSubview(continueLabel)
        
        nextButton = UIButton(frame: CGRect(x: width - 60, y: height - 145 , width: 45, height: 45))
        nextButton.setImage(UIImage(named: "go"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        view.addSubview(nextButton)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func initUI(){
        
        // removing from superview
        userLabel.removeFromSuperview()
        exitButton.removeFromSuperview()
        nextButton.removeFromSuperview()
        topImageView1.removeFromSuperview()
        welcomeView1.removeFromSuperview()
        welcomeLabel1.removeFromSuperview()
        imageBook1.removeFromSuperview()
        
        
        self.view.addSubview(topImageView)
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        topImageView.image = UIImage(named: "topImage")
        NSLayoutConstraint.activate([topImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height / 10),
        topImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        topImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
        topImageView.heightAnchor.constraint(equalToConstant: Constants.height / 5),
        ])
        
        
        welcomeView = UIView(frame: CGRect(x: 20, y: height/4 + 60, width: width - 40, height: height/6))
        welcomeView.backgroundColor = .white
        welcomeView.layer.cornerRadius = Constants.cornerRadius
        view.addSubview(welcomeView)
        

        imageBook = UIImageView(frame: CGRect(x: width/2 - 45, y: 0, width: height/12, height: height/12))
        imageBook.image = UIImage(named: "icon")
        welcomeView.addSubview(imageBook)
        
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: height/10 , width: width, height: 50))
        welcomeLabel.text = ""
        var charIndex = 0
       let titleText = "   Welcome   "
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: Double(charIndex) * 0.3, repeats: false){
                (timer) in
                self.welcomeLabel.text?.append(letter)
            }
            charIndex += 1
        }
        welcomeLabel.font = .boldSystemFont(ofSize: 35)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor.brownColor
        welcomeView.addSubview(welcomeLabel)
        
        // MARK: - formulario de log in
        
        self.view.addSubview(emailTextField)
        passwordTextField.isSecureTextEntry = true
        self.view.addSubview(passwordTextField)
        
        let textFieldArray: [UITextField] = [emailTextField, passwordTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 30
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: welcomeView.bottomAnchor, constant:  Constants.height / 20 ),
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
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFieldElement.frame.height))
            textFieldElement.leftView = paddingView
            textFieldElement.leftViewMode = UITextField.ViewMode.always
        }


        emailLabel = UILabel(frame: CGRect(x: 20, y: -10, width: 50, height: 20))
        emailLabel.text = "Email"
        emailLabel.backgroundColor = UIColor.backgroundColor
        emailLabel.font = .boldSystemFont(ofSize: 13)
        emailLabel.textColor = UIColor.brownColor
        emailLabel.textAlignment = .center
        textFieldStackView.addSubview(emailLabel)
        
        passwordLabel = UILabel(frame: CGRect(x: 20, y: 70, width: 80, height: 20))
        passwordLabel.text = "Password"
        passwordLabel.backgroundColor = UIColor.backgroundColor
        passwordLabel.font = .boldSystemFont(ofSize: 13)
        passwordLabel.textColor = UIColor.brownColor
        passwordLabel.textAlignment = .center
        textFieldStackView.addSubview(passwordLabel)
        
        loginButton = UIView.brownButton(frame: CGRect(x: 30, y:  height - 160 , width: width - 60  , height: 60))
        loginButton.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        loginButton.setTitle("Log in", for: .normal)
        view.addSubview(loginButton)
        
        passwordButton = UIButton()
        view.addSubview(passwordButton!)
        passwordButton?.addAnchorsAndSize(width: 50, height: 50, left: nil, top: -50, right: nil, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
        passwordButton?.addAnchors(left: -50, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: passwordTextField)
        passwordButton?.setImage(UIImage(systemName: "eye.fill" ), for: .normal)
        passwordButton?.tintColor = .black
        passwordButton?.addTarget(self, action: #selector(verpass), for: .touchUpInside)
        
        // MARK: - Registro
        
        accountLabel.text = "No account?  "
        accountLabel.font = .boldSystemFont(ofSize: 18)
        accountLabel.textColor = UIColor.brownColor
        self.view.addSubview(accountLabel)
        
        signUpButton.setTitleColor(.coralColor, for: .normal)
        signUpButton.setTitle("Sign-up", for: .normal)
        signUpButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(signUpButton)
//MARK: - cuentaStackView
        let cuentaArray: [AnyObject] = [accountLabel, signUpButton]
        
        accounStackView.axis = .horizontal
        accounStackView.spacing = 1
        accounStackView.alignment = .fill
        accounStackView.distribution = .equalSpacing
            cuentaArray.forEach {element in
                accounStackView.addArrangedSubview(element as! UIView)
        }
        self.view.addSubview(accounStackView)
        accounStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([accounStackView.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
        accounStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        cuentaArray.forEach {element in
            element.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
// MARK: - Función de botones
    
    @objc func logout(){
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "UserLog")
            initUI()
        } catch let signOutError as NSError{
            print("Error signing out %@", signOutError)
        }
    }
    
    @objc func nextView(){
        let register = TabBarViewController()
       register.modalPresentationStyle = .fullScreen
       present(register, animated: true, completion: nil)
    }
    
    @objc func verpass(){
        passwordTextField.isSecureTextEntry.toggle()
    }
    //funcion log in y verificación de campos vacios
    @IBAction func goToBooks(_ sender: Any) {
        var alerta = ""
        if (passwordTextField.text?.isEmpty)! || (emailTextField.text?.isEmpty)!  {
            alerta = "Enter all the information"
       } else {
           if let password = passwordTextField.text, let email = emailTextField.text {
               Auth.auth().signIn(withEmail: email, password: password) {
                   [weak self] authResult, error in
                   if let e = error {
                       print(e)
                       alerta = "WRONG email or password"
                       let alertView = UIAlertController(title: "Error", message: alerta, preferredStyle: .alert)
                       let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                       alertView.addAction(aceptar)
                       self?.present(alertView, animated: true, completion: nil)
                       
                   }else {
                       UserDefaults.standard.set(self?.emailTextField.text, forKey: "UserLog")
                       self?.textFieldStackView.removeFromSuperview()
                       self?.emailLabel.removeFromSuperview()
                       self?.accountLabel.removeFromSuperview()
                       self?.loginButton.removeFromSuperview()
                       self?.accounStackView.removeFromSuperview()
                       if (self?.defaults.string(forKey: "UserLog")) != nil{
                           //userLogged(name: username)
                           let gotoBooks = TabBarViewController()
                           gotoBooks.modalPresentationStyle = .fullScreen
                           self?.present(gotoBooks, animated: true, completion: nil)}
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
