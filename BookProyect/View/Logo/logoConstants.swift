//
//  logoConstants.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/03/22.
//

import Foundation

// Book logo, coordinates
public enum logoConstant {
    public static let pointA = (x:20.0, y:5.0)
    public static let pointB = (x:20.0, y:155.0)
    public static let pointC = (x:35.0, y:135.0)
    public static let pointD = (x:50.0, y:155.0)
    public static let pointE = (x:50.0, y:5.0)
    public static let pointF = (x:5.0, y:5.0)
    public static let pointG = (x:105.0, y:5.0)
    public static let pointH = (x:105.0, y:170.0)
    public static let pointI = (x:5.0, y:170.0)
    public static let pointJ = (x:5.0, y:2.0)
    

    private static let scaleXFactor = 100.0
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
    public static let scalePointG = (x:logoConstant.pointG.x/logoConstant.scaleXFactor,
    y:logoConstant.pointG.y/logoConstant.scaleYFactor)
    public static let scalePointH = (x:logoConstant.pointH.x/logoConstant.scaleXFactor,
    y:logoConstant.pointH.y/logoConstant.scaleYFactor)
    public static let scalePointI = (x:logoConstant.pointI.x/logoConstant.scaleXFactor,
    y:logoConstant.pointI.y/logoConstant.scaleYFactor)
    public static let scalePointJ = (x:logoConstant.pointJ.x/logoConstant.scaleXFactor,
    y:logoConstant.pointJ.y/logoConstant.scaleYFactor)

    
}
