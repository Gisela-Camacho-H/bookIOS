//
//  RegisterViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 21/01/22.
//

import UIKit

class RegisterViewController: UIViewController {

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
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var backgroundColor = UIColor(displayP3Red: 255/255, green: 242/255, blue: 223/255, alpha: 1) //rgba(220,218,220,255)
    var blueColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
    var lightBlueColor = UIColor(displayP3Red: 283/255, green: 162/255, blue: 129/255, alpha: 1)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        initUI()
        
    }
    func initUI(){
    
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: height/6 - 60, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topImage")
        view.addSubview(topImageView!)
        
        backButton = UIButton(frame: CGRect(x: 25, y: height/7 - 40, width: 45, height: 45))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        
        EstasAPuntoLabel = UILabel(frame: CGRect(x: 25, y: height/3 - 20, width: width - 50, height: 50))
        EstasAPuntoLabel?.text = "Estas a unos cuantos pasos de vivir la mejor experiencia"
        EstasAPuntoLabel?.numberOfLines = 0
        EstasAPuntoLabel?.font = .boldSystemFont(ofSize: 16)
        EstasAPuntoLabel?.textColor = lightBlueColor
        view.addSubview(EstasAPuntoLabel!)
        
        
        contentform = UIView(frame: CGRect(x: 20, y: height/2 - 90, width: width - 40, height: height/3 + 70))
        contentform?.backgroundColor = .white
        contentform?.layer.cornerRadius = 10
        view.addSubview(contentform!)
        
        
        RegistraInfoLabel = UILabel(frame: CGRect(x: 30, y: 0, width: width - 60, height: 50))
        RegistraInfoLabel?.text = "Registra tu información"
        RegistraInfoLabel?.font = .boldSystemFont(ofSize: 20)
        RegistraInfoLabel?.textAlignment = .center
        RegistraInfoLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        contentform?.addSubview(RegistraInfoLabel!)
        
        usuarioTextField = UITextField(frame: CGRect(x:10, y:60, width: width - 60, height: 50))
        usuarioTextField?.backgroundColor = .clear
        usuarioTextField?.layer.cornerRadius = 7
        usuarioTextField?.layer.borderColor = blueColor.cgColor
        usuarioTextField?.layer.borderWidth = 2
        usuarioTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(usuarioTextField!)
        
        correoTextField = UITextField(frame: CGRect(x:10, y:130, width: width - 60, height: 50))
        correoTextField?.backgroundColor = .clear
        correoTextField?.layer.cornerRadius = 7
        correoTextField?.layer.borderColor = blueColor.cgColor
        correoTextField?.layer.borderWidth = 2
        correoTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(correoTextField!)
        
        contrasenaTextField = UITextField(frame: CGRect(x:10, y:200, width: width - 60, height: 50))
        contrasenaTextField?.backgroundColor = .clear
        contrasenaTextField?.layer.cornerRadius = 7
        contrasenaTextField?.layer.borderColor = blueColor.cgColor
        contrasenaTextField?.layer.borderWidth = 2
        contrasenaTextField?.isSecureTextEntry = true
        contrasenaTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(contrasenaTextField!)
        
        confirmarTextField = UITextField(frame: CGRect(x:10, y:270, width: width - 60, height: 50))
        confirmarTextField?.backgroundColor = .clear
        confirmarTextField?.layer.cornerRadius = 7
        confirmarTextField?.layer.borderColor = blueColor.cgColor
        confirmarTextField?.layer.borderWidth = 2
        confirmarTextField?.isSecureTextEntry = true
        confirmarTextField?.textAlignment = NSTextAlignment.left
        contentform?.addSubview(confirmarTextField!)

        usuarioLabel = UILabel(frame: CGRect(x: 25, y: 50, width: 55, height: 20))
        usuarioLabel?.text = "Usuario"
        usuarioLabel?.backgroundColor = .white
        usuarioLabel?.font = .boldSystemFont(ofSize: 12)
        usuarioLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        usuarioLabel?.textAlignment = .center
        contentform?.addSubview(usuarioLabel!)
        
        correoLabel = UILabel(frame: CGRect(x: 25, y: 120, width: 55, height: 20))
        correoLabel?.text = "Correo"
        correoLabel?.backgroundColor = .white
        correoLabel?.font = .boldSystemFont(ofSize: 12)
        correoLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        correoLabel?.textAlignment = .center
        contentform?.addSubview(correoLabel!)
        
        contrasenaLabel = UILabel(frame: CGRect(x: 25, y: 190, width: 75, height: 20))
        contrasenaLabel?.text = "Contraseña"
        contrasenaLabel?.backgroundColor = .white
        contrasenaLabel?.font = .boldSystemFont(ofSize: 12)
        contrasenaLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        contrasenaLabel?.textAlignment = .center
        contentform?.addSubview(contrasenaLabel!)
        
        confirmarLabel = UILabel(frame: CGRect(x: 25, y: 260, width: 140, height: 20))
        confirmarLabel?.text = "Confirmar Contraseña"
        confirmarLabel?.backgroundColor = .white
        confirmarLabel?.font = .boldSystemFont(ofSize: 12)
        confirmarLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        confirmarLabel?.textAlignment = .center
        contentform?.addSubview(confirmarLabel!)
        
        loginButton = UIButton(frame: CGRect(x: 30, y: height - 140 , width: width - 60 , height: 50))
        loginButton?.backgroundColor = blueColor
        loginButton?.layer.cornerRadius = 18
        loginButton?.setTitleColor(.white, for: .normal)
        loginButton?.setTitle("CREAR CUENTA", for: .normal)
        loginButton?.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        
        view.addSubview(loginButton!)
        
        
    }
    
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
