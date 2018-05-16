//
//  Clorse_ViewController.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/5/16.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import UIKit

class Clorse_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (result) in
            print("获取json信息\(result)")
        }
        //闭包表达式
        let names = ["s","b","c","e","t"]
        
        let result2 = names.sorted(by: <)
        print(result2)
        
        // Do any additional setup after loading the view.
    }
    func backWards(a1:String, a2: String) -> Bool {
        return a1<a2
    }
//    public func sorted(by areIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
    func loadData(completion: @escaping (_ result: [String]) -> ()) -> () {
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            Thread.sleep(forTimeInterval: 1.0)
            let json = ["12","13","16"]
            DispatchQueue.main.async(execute: {
                print("主线程\(Thread.current)")
                completion(json)
            })
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
