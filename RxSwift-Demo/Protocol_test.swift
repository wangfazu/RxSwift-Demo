//
//  Protocol_test.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/5/16.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import Foundation
public protocol Pet {
    func playWith()
    func fed(food: String)
}
public class Animal{
    
    var name: String = ""
    var birthPlace: String = ""
    init(name: String, birthPlace: String) {
        self.name = name
        self.birthPlace = birthPlace
    }
    
    
}
public class Dog: Animal,Pet{
    public func playWith() {
        print("狗狗在玩!")
    }
    
    public func fed(food: String) {
        if food == "骨头" {
            print("狗狗很开心！")
        }else{
            print("狗狗很伤心！")
        }
    }
    
    
}
public class Cat: Animal,Pet{
   public func playWith() {
        print("猫咪在玩耍！")
    }
    
    public func fed(food: String) {
        if food == "老鼠" {
            print("猫咪很开心")
        }else{
            
            print("妈咪很伤心！")
        }
    }
    
    
}


