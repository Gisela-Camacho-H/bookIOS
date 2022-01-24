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
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var backgroundColor = UIColor(displayP3Red: 220/255, green: 218/255, blue: 220/255, alpha: 1) //rgba(220,218,220,255)
    var blueColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        initUI()
    }
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topImage")
        view.addSubview(topImageView!)
        
        imageBook = UIImageView(frame: CGRect(x: width/2 - 64, y: height/5, width: width/3, height: height/6))
        imageBook?.image = UIImage(named: "imageBook")
        view.addSubview(imageBook!)
        
        bienvenidosLabel = UILabel(frame: CGRect(x: width/4, y: 320, width: width, height: 50))
        bienvenidosLabel?.text = "¡Bienvenido!"
        bienvenidosLabel?.font = .boldSystemFont(ofSize: 35)
        bienvenidosLabel?.textColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
        view.addSubview(bienvenidosLabel!)
        
        correoTextField = UITextField(frame: CGRect(x:20, y:420, width: width - 40, height: 60))
        correoTextField?.backgroundColor = .clear
        correoTextField?.layer.cornerRadius = 7
        correoTextField?.layer.borderColor = blueColor.cgColor
        correoTextField?.layer.borderWidth = 2
        correoTextField?.textAlignment = NSTextAlignment.left
        view.addSubview(correoTextField!)
        
        contrasenaTextField = UITextField(frame: CGRect(x:20, y:500, width: width - 40, height: 60))
        contrasenaTextField?.backgroundColor = .clear
        contrasenaTextField?.layer.cornerRadius = 7
        contrasenaTextField?.layer.borderColor = blueColor.cgColor
        contrasenaTextField?.layer.borderWidth = 2
        contrasenaTextField?.isSecureTextEntry = true
        contrasenaTextField?.textAlignment = NSTextAlignment.left
        view.addSubview(contrasenaTextField!)

        correoLabel = UILabel(frame: CGRect(x: 40, y: 395, width: 50, height: 50))
        correoLabel?.text = "Correo"
        correoLabel?.backgroundColor = backgroundColor
        correoLabel?.font = .boldSystemFont(ofSize: 12)
        correoLabel?.textColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
        correoLabel?.textAlignment = .center
        view.addSubview(correoLabel!)
        
        contrasenaLabel = UILabel(frame: CGRect(x: 40, y: 490, width: 80, height: 20))
        contrasenaLabel?.text = "Contraseña"
        contrasenaLabel?.backgroundColor = backgroundColor
        contrasenaLabel?.font = .boldSystemFont(ofSize: 12)
        contrasenaLabel?.textColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
        contrasenaLabel?.textAlignment = .center
        view.addSubview(contrasenaLabel!)
        
        loginButton = UIButton(frame: CGRect(x: 30, y: 650 , width: width - 60 , height: 50))
        loginButton?.backgroundColor = blueColor
        loginButton?.layer.cornerRadius = 20
        loginButton?.setTitleColor(.white, for: .normal)
        loginButton?.setTitle("INICIAR SESIÓN", for: .normal)
        loginButton?.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        
        view.addSubview(loginButton!)
        
        cuentaLabel = UILabel(frame: CGRect(x: 45, y: 690, width: width - 40, height: 50))
        cuentaLabel?.text = "¿Todavía no tienes una cuenta?"
        cuentaLabel?.font = .boldSystemFont(ofSize: 13)
        cuentaLabel?.textColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
        view.addSubview(cuentaLabel!)
        
        registrateButton = UIButton(frame: CGRect(x: width - 150, y: 685 , width: 100, height: 60))
        registrateButton?.setTitleColor(UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1), for: .normal)
        registrateButton?.setTitle("Registrate", for: .normal)
        registrateButton?.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.addSubview(registrateButton!)
    }
    //@objc func goToBooks (){
        //print("go to books")
         //let gotoBooks = BooksViewController()
        //gotoBooks.modalPresentationStyle = .fullScreen
        //present(gotoBooks, animated: true, completion: nil)
    //}
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
    
    @objc func register (){
        print("go to register")
         let register = RegisterViewController()
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
}



//rgba(21,39,112,255) button color
//https://imagecolorpicker.com/
//rgba(121,168,243,255) light blue
//https://appicon.co/
