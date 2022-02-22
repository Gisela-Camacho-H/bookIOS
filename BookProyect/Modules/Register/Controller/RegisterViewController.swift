//
//  RegisterViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 21/01/22.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate  {

    var backButton : UIButton?
    var topImageView: UIImageView?
    var RegistraInfoLabel : UILabel?
    var correoTextField : UITextField?
    var contrasenaTextField : UITextField?
    var usuarioTextField : UITextField?
    var confirmarTextField : UITextField?
    var usuarioLabel : UILabel?
    var correoLabel: UILabel?
    var contrasenaLabel: UILabel?
    var confirmarLabel: UILabel?
    var loginButton : UIButton?
    var EstasAPuntoLabel : UILabel?
    var contentform : UIView?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imagen de fonfo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        initUI()
        self.correoTextField?.delegate = self
        self.contrasenaTextField?.delegate = self
        self.usuarioTextField?.delegate = self
        self.confirmarTextField?.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func initUI(){
    
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: height/6 - 60, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topImage")
        view.addSubview(topImageView!)
        
        backButton = UIButton(frame: CGRect(x: 25, y: height/7 - 40, width: 45, height: 45))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        
        EstasAPuntoLabel = UILabel(frame: CGRect(x: 25, y: height/3 - 10, width: width - 50, height: 50))
        EstasAPuntoLabel?.text = "You are so close from living the best experience"
        EstasAPuntoLabel?.numberOfLines = 0
        EstasAPuntoLabel?.textAlignment = .center
        EstasAPuntoLabel?.font = .boldSystemFont(ofSize: 20)
        EstasAPuntoLabel?.textColor = UIColor.coralColor
        view.addSubview(EstasAPuntoLabel!)
        
        
        contentform = UIView(frame: CGRect(x: 20, y: height/2 - 90, width: width - 40, height: height/3 + 70))
        contentform?.backgroundColor = .white
        contentform?.layer.cornerRadius = 10
        view.addSubview(contentform!)
        
        //MARK: - formulario de registro
        
        RegistraInfoLabel = UILabel(frame: CGRect(x: 30, y: 0, width: width - 60, height: 50))
        RegistraInfoLabel?.text = "  Registration  "
        RegistraInfoLabel?.font = .boldSystemFont(ofSize: 22)
        RegistraInfoLabel?.textAlignment = .center
        RegistraInfoLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        contentform?.addSubview(RegistraInfoLabel!)
        
        usuarioTextField = UITextField(frame: CGRect(x:10, y:60, width: width - 60, height: 50))
        usuarioTextField?.backgroundColor = .clear
        usuarioTextField?.layer.cornerRadius = 7
        usuarioTextField?.layer.borderColor = UIColor.brownColor.cgColor
        usuarioTextField?.layer.borderWidth = 2
        usuarioTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(usuarioTextField!)
        
        correoTextField = UITextField(frame: CGRect(x:10, y:130, width: width - 60, height: 50))
        correoTextField?.backgroundColor = .clear
        correoTextField?.layer.cornerRadius = 7
        correoTextField?.layer.borderColor = UIColor.brownColor.cgColor
        correoTextField?.layer.borderWidth = 2
        correoTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(correoTextField!)
        
        contrasenaTextField = UITextField(frame: CGRect(x:10, y:200, width: width - 60, height: 50))
        contrasenaTextField?.backgroundColor = .clear
        contrasenaTextField?.layer.cornerRadius = 7
        contrasenaTextField?.layer.borderColor = UIColor.brownColor.cgColor
        contrasenaTextField?.layer.borderWidth = 2
        contrasenaTextField?.isSecureTextEntry = true
        contrasenaTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(contrasenaTextField!)
        
        confirmarTextField = UITextField(frame: CGRect(x:10, y:270, width: width - 60, height: 50))
        confirmarTextField?.backgroundColor = .clear
        confirmarTextField?.layer.cornerRadius = 7
        confirmarTextField?.layer.borderColor = UIColor.brownColor.cgColor
        confirmarTextField?.layer.borderWidth = 2
        confirmarTextField?.isSecureTextEntry = true
        confirmarTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(confirmarTextField!)

        usuarioLabel = UILabel(frame: CGRect(x: 25, y: 50, width: 50, height: 20))
        usuarioLabel?.text = "User"
        usuarioLabel?.backgroundColor = .white
        usuarioLabel?.font = .boldSystemFont(ofSize: 12)
        usuarioLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        usuarioLabel?.textAlignment = .center
        contentform?.addSubview(usuarioLabel!)
        
        correoLabel = UILabel(frame: CGRect(x: 25, y: 120, width: 50, height: 20))
        correoLabel?.text = "Email"
        correoLabel?.backgroundColor = .white
        correoLabel?.font = .boldSystemFont(ofSize: 12)
        correoLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        correoLabel?.textAlignment = .center
        contentform?.addSubview(correoLabel!)
        
        contrasenaLabel = UILabel(frame: CGRect(x: 25, y: 190, width: 75, height: 20))
        contrasenaLabel?.text = "Password"
        contrasenaLabel?.backgroundColor = .white
        contrasenaLabel?.font = .boldSystemFont(ofSize: 12)
        contrasenaLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        contrasenaLabel?.textAlignment = .center
        contentform?.addSubview(contrasenaLabel!)
        
        confirmarLabel = UILabel(frame: CGRect(x: 25, y: 260, width: 130, height: 20))
        confirmarLabel?.text = "Confirm Password"
        confirmarLabel?.backgroundColor = .white
        confirmarLabel?.font = .boldSystemFont(ofSize: 12)
        confirmarLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        confirmarLabel?.textAlignment = .center
        contentform?.addSubview(confirmarLabel!)
        
        loginButton = UIButton(frame: CGRect(x: 30, y: height - 140 , width: width - 60 , height: 50))
        loginButton?.backgroundColor = UIColor.brownColor
        loginButton?.layer.cornerRadius = 18
        loginButton?.setTitleColor(.white, for: .normal)
        loginButton?.setTitle("Register", for: .normal)
        loginButton?.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        
        view.addSubview(loginButton!)
        
        
    }
    //MARK: - Funciones de regresar y registrar
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
    
    @IBAction func goToLogin(_ sender: Any) {
        if (contrasenaTextField?.text?.isEmpty)! || (correoTextField?.text?.isEmpty)! || (usuarioTextField?.text?.isEmpty)! || (confirmarTextField?.text?.isEmpty)!  {
          print("Text field is empty")
       } else {
           print("go to books")
           dismiss(animated: true)
       }
    }
    
}
