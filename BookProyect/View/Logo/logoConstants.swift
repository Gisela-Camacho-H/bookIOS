//
//  logoConstants.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/03/22.
//

import Foundation

public enum logoConstant {
    public static let pointA = (x:0.0, y:0.0)
    public static let pointB = (x:0.0, y:150.0)
    public static let pointC = (x:20.0, y:130.0)
    public static let pointD = (x:40.0, y:150.0)
    public static let pointE = (x:40.0, y:0.0)
    public static let pointF = (x:-1.0, y:0.0)
    
    private static let scaleXFactor = 275.0
    private static let scaleYFactor = 160.0
    
    public static let scalePointA = (x:logoConstant.pointA.x/logoConstant.scaleXFactor,
        y:logoConstant.pointA.y/logoConstant.scaleYFactor)
    public static let scalePointB = (x:logoConstant.pointB.x/logoConstant.scaleXFactor,
         y:logoConstant.pointB.y/logoConstant.scaleYFactor)
    public static let scalePointC = (x:logoConstant.pointC.x/logoConstant.scaleXFactor,
        y:logoConstant.pointC.y/logoConstant.scaleYFactor)
    public static let scalePointD =  (x:logoConstant.pointD.x/logoConstant.scaleXFactor,
        y:logoConstant.pointD.y/logoConstant.scaleYFactor)
    public static let scalePointE = (x:logoConstant.pointE.x/logoConstant.scaleXFactor,
        y:logoConstant.pointE.y/logoConstant.scaleYFactor)
    public static let scalePointF = (x:logoConstant.pointF.x/logoConstant.scaleXFactor,
        y:logoConstant.pointF.y/logoConstant.scaleYFactor)
    
}
