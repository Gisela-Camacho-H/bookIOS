//
//  UIView++.swift
//  BookProyect
//
//  Created by GiselaCamacho on 22/02/22.
//

import Foundation
import UIKit

extension UIView{
//MARK: - Button
    class brownButton: UIButton {
        override init(frame: CGRect){
            super.init(frame: frame)
            backgroundColor = UIColor.brownColor
            layer.cornerRadius = 15
            setTitleColor(.white, for: .normal)
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
//MARK: - Finder labels
    class brownLabels: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
            widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
            textColor = UIColor.pinkColor
            textAlignment = .center
            backgroundColor = UIColor.brownColor
            font = UIFont(name: "Arial Bold", size: 20)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class clearLabels: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            numberOfLines = 0
            textColor = UIColor.brownColor
            backgroundColor = .clear
            font = UIFont(name: "Arial Bold", size: 17)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
//MARK: - Finder textField and mainlabel
    
    class findTextField: UITextField {
        override init(frame: CGRect){
            super.init(frame: frame)
            textAlignment = .center
            backgroundColor = .white
            layer.cornerRadius = 7
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 2
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    class findLabel: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            textAlignment = NSTextAlignment.center
            backgroundColor = .clear
            textColor = UIColor.brownColor
            font = UIFont(name: "Arial Bold", size: 22)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    
    class loginTextField: UITextField {
        override init(frame: CGRect){
            super.init(frame: frame)
            layer.borderColor = UIColor.brownColor.cgColor
            layer.cornerRadius = 7
            layer.borderWidth = 2
            backgroundColor = .clear
            textAlignment = NSTextAlignment.left
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: frame.height))
            keyboardType = UIKeyboardType.default
            autocorrectionType = UITextAutocorrectionType.no
            clearButtonMode = UITextField.ViewMode.whileEditing
            leftView = paddingView
            leftViewMode = UITextField.ViewMode.always
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}
