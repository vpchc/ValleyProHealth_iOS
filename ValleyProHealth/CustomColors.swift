//
//  CustomColors.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/12/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//
import UIKit

class CustomColors {
    
    static func vpchcColors(color: String){
        if(color == "blue"){
            UIColorFromRGB(0x3a4e8c)
        }else if(color == "green"){
            UIColorFromRGB(0x70b244)
        }else if(color == "accent"){
            UIColorFromRGB(0x258f71)
        }
    }
    
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}