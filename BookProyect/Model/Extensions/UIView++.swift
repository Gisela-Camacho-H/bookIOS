//
//  UIView++.swift
//  BookProyect
//
//  Created by GiselaCamacho on 22/02/22.
//

import Foundation
import UIKit

extension UIView{
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
}
