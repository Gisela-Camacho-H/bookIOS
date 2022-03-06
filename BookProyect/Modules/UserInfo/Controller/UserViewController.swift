//
//  UserViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/03/22.
//

import UIKit

class UserViewController: UIViewController {
    
    lazy var userInfoLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        userInfoLabel = UILabel(frame: CGRect(x: 0, y: 100, width: width, height: 50))
        userInfoLabel.text = "User Information "
        userInfoLabel.font = .boldSystemFont(ofSize: 35)
        userInfoLabel.textAlignment = .center
        userInfoLabel.textColor = UIColor.brownColor
        view.addSubview(userInfoLabel)
        
    }
    
    @IBDesignable
    class logoView: UIView {
        
        override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setNeedsDisplay()
        }
        
        @IBInspectable
        public var lineColor: UIColor = .black {
            didSet {
                self.setNeedsDisplay()
            }
        }
        
        @IBInspectable
        public var lineWidth: CGFloat = 7.0 {
            didSet {
                self.setNeedsDisplay()
            }
        }
        
       
        override func draw(_ rect: CGRect) {
            //Call super.draw
            //Create path object
            //Set attributes
            //Set starting points
            //Define path
            //Set stroke or fill colors.
            //*Get context and save state
            //*Position the shape
            //Render
            //*Restore graphic context
            
            //Call super.draw
            super.draw(rect)
            //Create path object
            let path = UIBezierPath()
            //Set attributes
            path.lineWidth = lineWidth
            let factorX = rect.width * 0.9
            let factorY = rect.height * 0.90
            
            //Set starting points
            path.move(to: CGPoint(
                x:logoConstant.scalePointA.x * factorX,
                y:logoConstant.scalePointA.y * factorY
            ))
            //Define path
            path.addLine(to: CGPoint(
                x:logoConstant.scalePointB.x * factorX,
                y:logoConstant.scalePointB.y * factorY
            ))
            path.addLine(to: CGPoint(
                x:logoConstant.scalePointC.x * factorX ,
                y:logoConstant.scalePointC.y * factorY
            ))
            path.addLine(to: CGPoint(
                x:logoConstant.scalePointD.x * factorX,
                y:logoConstant.scalePointD.y * factorY
            ))
            path.addLine(to: CGPoint(
                x:logoConstant.scalePointE.x * factorX,
                y:logoConstant.scalePointE.y * factorY
            ))
            path.addLine(to: CGPoint(
                x:logoConstant.scalePointF.x * factorX,
                y:logoConstant.scalePointF.y * factorY
            ))
            
            //Set stroke or fill colors.
             lineColor.setStroke()
            //Render
            
            //*Get context and save state
            if let context = UIGraphicsGetCurrentContext() {
                context.saveGState()
                //*Position the shape
                context.translateBy(x: rect.width * 0.05 , y: rect.height * 0.05)
                //Render
                path.stroke()
                
                //*Restore graphic context
                context.restoreGState()
            }
            
        
            
        }
        
    }

}

