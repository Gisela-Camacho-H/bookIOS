//
//  ViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 20/01/22.
//

import UIKit

class ViewController: UIViewController {

    var topImageView: UIImageView?
    var imageBook : UIImageView?
    var bienvenidosLabel : UILabel?
    var correoTextField : UITextField?
    var contrasenaTextField : UITextField?
    var correoLabel: UILabel?
    var contrasenaLabel: UILabel?
    var loginButton : UIButton?
    var cuentaLabel : UILabel?
    var registrateButton: UIButton?
    var bienvenidoView : UIView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var backgroundColor = UIColor(displayP3Red: 255/255, green: 242/255, blue: 223/255, alpha: 1)
    var brownColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //imagen de fondo
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        //llamar función initUI
        initUI()
    }
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: height/6 - 60, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topImage")
        view.addSubview(topImageView!)
        
        bienvenidoView = UIView(frame: CGRect(x: 20, y: height/4 + 60, width: width - 40, height: 140))
        bienvenidoView?.backgroundColor = .white
        bienvenidoView?.layer.cornerRadius = 20
        view.addSubview(bienvenidoView!)
        
        imageBook = UIImageView(frame: CGRect(x: width/3, y: 0, width: 90, height: 90))
        imageBook?.image = UIImage(named: "AppIcon")
        bienvenidoView?.addSubview(imageBook!)
        
        bienvenidosLabel = UILabel(frame: CGRect(x: 0, y: 80, width: width, height: 50))
        bienvenidosLabel?.text = "¡Bienvenido!"
        bienvenidosLabel?.font = .boldSystemFont(ofSize: 35)
        bienvenidosLabel?.textAlignment = .center
        bienvenidosLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        bienvenidoView?.addSubview(bienvenidosLabel!)
        
        // MARK: - formulario de log in
        
        correoTextField = UITextField(frame: CGRect(x:20, y:460, width: width - 40, height: 60))
        correoTextField?.backgroundColor = .clear
        correoTextField?.layer.cornerRadius = 7
        correoTextField?.layer.borderColor = brownColor.cgColor
        correoTextField?.layer.borderWidth = 2
        correoTextField?.textAlignment = NSTextAlignment.left
        view.addSubview(correoTextField!)
        
        contrasenaTextField = UITextField(frame: CGRect(x:20, y:540, width: width - 40, height: 60))
        contrasenaTextField?.backgroundColor = .clear
        contrasenaTextField?.layer.cornerRadius = 7
        contrasenaTextField?.layer.borderColor = brownColor.cgColor
        contrasenaTextField?.layer.borderWidth = 2
        contrasenaTextField?.isSecureTextEntry = true
        contrasenaTextField?.textAlignment = NSTextAlignment.left
        view.addSubview(contrasenaTextField!)

        correoLabel = UILabel(frame: CGRect(x: 40, y: 450, width: 50, height: 20))
        correoLabel?.text = "Correo"
        correoLabel?.backgroundColor = backgroundColor
        correoLabel?.font = .boldSystemFont(ofSize: 12)
        correoLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        correoLabel?.textAlignment = .center
        view.addSubview(correoLabel!)
        
        contrasenaLabel = UILabel(frame: CGRect(x: 40, y: 530, width: 80, height: 20))
        contrasenaLabel?.text = "Contraseña"
        contrasenaLabel?.backgroundColor = backgroundColor
        contrasenaLabel?.font = .boldSystemFont(ofSize: 12)
        contrasenaLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        contrasenaLabel?.textAlignment = .center
        view.addSubview(contrasenaLabel!)
        
        loginButton = UIButton(frame: CGRect(x: 30, y: 650 , width: width - 60 , height: 50))
        loginButton?.backgroundColor = brownColor
        loginButton?.layer.cornerRadius = 20
        loginButton?.setTitleColor(.white, for: .normal)
        loginButton?.setTitle("INICIAR SESIÓN", for: .normal)
        loginButton?.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        
        view.addSubview(loginButton!)
        
        // MARK: - Registro
        cuentaLabel = UILabel(frame: CGRect(x: 45, y: 690, width: width - 40, height: 50))
        cuentaLabel?.text = "¿Todavía no tienes una cuenta?"
        cuentaLabel?.font = .boldSystemFont(ofSize: 13)
        cuentaLabel?.textColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
        view.addSubview(cuentaLabel!)
        
        registrateButton = UIButton(frame: CGRect(x: width - 150, y: 685 , width: 100, height: 60))
        registrateButton?.setTitleColor(UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1), for: .normal)
        registrateButton?.setTitle("Registrate", for: .normal)
        registrateButton?.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.addSubview(registrateButton!)
    }
// MARK: - Función de botones
    
    //funcion log in y verificación de campos vacios
    @IBAction func goToBooks(_ sender: Any) {
        if (contrasenaTextField?.text?.isEmpty)! || (correoTextField?.text?.isEmpty)!  {
          print("Text field is empty")
       } else {
           print("go to books")
            let gotoBooks = BooksViewController()
           gotoBooks.modalPresentationStyle = .fullScreen
           present(gotoBooks, animated: true, completion: nil)
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

//tomas los colores de las fotos
//https://imagecolorpicker.com/
//obtener los tamaños para los iconos de la app
//https://appicon.co/