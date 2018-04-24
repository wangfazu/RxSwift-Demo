//
//  RxViewController.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/4/21.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Spring
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
class RxViewController: UIViewController {


    

//    var tableview: UITableView!
    
    //歌曲列表的数据源
    let musicListViewModel = MusicListViewModel()
    
    //负责对象销毁
    let disposeBag = DisposeBag()

    @IBOutlet weak var numLab: UILabel!
    
    @IBOutlet weak var myImageView: SpringImageView!
    @IBOutlet weak var changeImgBtn: UIButton!
    var isDeleteImageView = false
    
    @IBAction func changeImageView(_ sender: Any) {
        if isDeleteImageView == false {
//            myImageView.isHidden = true
            isDeleteImageView = true
            numLab.text = "+1"
            myImageView.frame.size.height = 500

        }else{
//            myImageView.isHidden = false
            isDeleteImageView = false
            numLab.text = "0"
            myImageView.frame.size.height = 300

            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
//        let observable = Observable<Int>.just(5)
//
//        let observable_2 = Observable.of("A","B","C")
//
//        let observable_3 = Observable.from(["A","B","C"])
//
//        let observable_4 = Observable<Int>.empty()
//
//        let observable_5 = Observable<Int>.never()
//
//        enum MyError: Error{
//            case A
//            case B
//        }
//        let observable_6 = Observable<Int>.error(MyError.A)
//
//        let ob_1 = Observable.range(start: 1, count: 5)
//        let ob_2 = Observable.of(1,2,3,4,5)
//
//        let ob_3 = Observable.repeatElement(1)
//
//        let ob_4 = Observable.generate(
//            initialState: 0,
//                    condition: { $0 <= 10 },
//
//                    iterate: { $0 + 2 }
//        )
//        let ob_5 = Observable.of(0,1,2,3,4,5,6,7,8,9,10)
        

        
        

        
   
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

    
