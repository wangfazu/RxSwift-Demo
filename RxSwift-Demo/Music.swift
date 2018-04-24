//
//  Music.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/4/21.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import Foundation
import UIKit

var  AppWidth = UIScreen.main.bounds.size.width
var  AppHeight = UIScreen.main.bounds.size.height
//歌曲结构体
struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
    
}
//实现CustomstringConvertible 协议，方便输出
extension Music: CustomStringConvertible{
    var description: String {
        return "name:\(name) singer:\(singer)"
    }
}
