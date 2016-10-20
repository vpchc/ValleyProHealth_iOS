//
//  CustomColors.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/12/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//
import UIKit
import SystemConfiguration

class CustomColors {
    
    static func vpchcColors(_ color: String) -> UIColor{
        if(color == "blue"){
           return UIColorFromRGB(0x3a4e8c)
        }else if(color == "green"){
           return UIColorFromRGB(0x70b244)
        }else{
           return UIColorFromRGB(0x258f71)
        }
    }
    
    static func UIColorFromRGB(_ rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
}

extension Date {
    
    func year() -> Int
    {
        //Get Year
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.year, from: self)
        let year = components.year

        return year!
    }
    
    func month() -> Int
    {
        //Get Month
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.month, from: self)
        let month = components.month
        
        return month!
    }
    
    func day() -> Int
    {
        //Get Day
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let day = components.day
        
        return day!
    }
    
    
    func hour() -> Int
    {
        //Get Hour
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.hour, from: self)
        let hour = components.hour
        
        return hour!
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.minute, from: self)
        let minute = components.minute
        
        return minute!
    }
    
    func seconds() -> Int
    {
        //Get Seconds
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.second, from: self)
        let seconds = components.second
        
        return seconds!
    }
    
    func milliseconds() -> Double
    {
        let milliseconds = (Double(hour())*3.6e6) + (Double(minute())*6e4) + (Double(seconds())*1e3)

        return milliseconds
    }
    
    func dateToString() -> String
    {
        //Date in X/XX/XXXX format
        let date = String(month()) + "/" + String(day()) + "/" + String(year())
        
        return date
    }
    
}
