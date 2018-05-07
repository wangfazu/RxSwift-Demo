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
import StarWars
import NVActivityIndicatorView
let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
class RxViewController: UIViewController,UIViewControllerTransitioningDelegate{


    //
    var width: CGFloat = 50
    var padding: CGFloat = 6
    var backgrounds = [UIView]()
    
    
    
    //
    var vcNavAnimation: NVActivityIndicatorView!

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
        
        //guochang过场动画
//         vcNavAnimation = NVActivityIndicatorView(frame: CGRect(x: 20, y: 50, width: 200, height: 300), type: .pacman, color: .white, padding: 10)
//        vcNavAnimation.startAnimating()
//        self.view.addSubview(vcNavAnimation)
//        vcNavAnimation.snp.makeConstraints { (make) in
//            make.centerX.equalToSuperview()
//        }
        //        let observable = Observable.of("A", "B", "C")
        
//        observable.subscribe { event in
//            print(event)
//        }

        setupGameMap()
        
        let observable = Observable.of("a","b","c")
//        observable.subscribe{ event in
//            print(event.element)
//
//        }
//        observable.subscribe(onNext: { (element) in
//            print(element)
//        }, onError: { (error) in
//            print(error)
//        }, onCompleted: {
//            print("completed")
//        }) {
//            print("disposed")
//        }
//        observable.do(onNext: { (element) in
//            print("intercepted Next:", element)
//        }, onError: { (erroe) in
//            print(erroe)
//        }, onCompleted: {
//            print("complted")
//        }, onSubscribe: {
//            print("subscribe")
//        }, onSubscribed: {
//            print("subscred")
//        }) {
//            print("last")
//        }
        //shi
//        let subscription = observable.subscribe({event in
//            print(event)
//        })
//        //diaoyong调用这个订阅的dispose()方法
//        subscription.dispose()
        
        //DisposeBag
//        let disposeBag = DisposeBag()
        
        //first book
//        let obser1 = Observable.of("a","b","c")
//        obser1.subscribe {event in
//            print(event)
//
//        }.disposed(by: disposeBag)
//
//        //second book
//        let obser2 = Observable.of("1","1","3")
//        obser2.subscribe {event in
//            print(event)
//        }.disposed(by: disposeBag)
        
//        let obser3 = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//        obser3.map { "当前索引数：\($0 )"}
//            .bind { [weak self](text) in
//                //收到发出的索引数后显示到label上
//                self?.changeImgBtn.setTitle(text, for: .normal)
//            }
//            .disposed(by: disposeBag)
        
//        let observ4 : Binder<String> = Binder(changeImgBtn) { (btn,text) in
//            btn.setTitle(text, for: .normal)
//        }
//        let observable5 = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//            observable5
//                .map{"当前索引为：\($0)"}
//                .bind(to: observ4)
//                .disposed(by: disposeBag)
        let observable7 = Observable<Int>.interval(1, scheduler:MainScheduler.instance)
        observable7
            .map{ $0 % 2 == 0}
            .bind(to: changeImgBtn.rx.isEnabled)
            .disposed(by: disposeBag)
            
        
        
        
        
        
        
        
        
        

        
   
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let secondVC = SecondViewController()
        secondVC.transitioningDelegate = self
        
//        present(secondVC, animated: false) {
//            return StarWarsGLAnimator()
//        }
//        if vcNavAnimation.isAnimating == true{
//
//            vcNavAnimation.stopAnimating()
//
//        }else{
//            vcNavAnimation.startAnimating()
//        }
        playAnimation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupGameMap()
    {
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for i in 0..<4
        {
            print(i)
            y = 150
            for _ in 0..<4
            {
                //初始化视图
                let background = UIView(frame:CGRect(x:x, y:y,
                                                     width:width, height:width))
                background.backgroundColor = .darkGray
                self.view.addSubview(background)
                //将视图保存起来，以备后用
//                backgrounds.append(background)
                backgrounds.append(background)
                y += padding + width
            }
            x += padding+width
        }
    }
    func playAnimation()
    {
        for tile in backgrounds{
            //先将数字块大小置为原始尺寸的 1/10
            tile.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1,y: 0.1))
            
            //设置动画效果，动画时间长度 1 秒。
            UIView.animate(withDuration: 1, delay:0.01, options: [], animations: {
                ()-> Void in
                //在动画中，数字块有一个角度的旋转。
                tile.layer.setAffineTransform(CGAffineTransform(rotationAngle: 90))
            },
                           completion:{
                            (finished:Bool) -> Void in
                            UIView.animate(withDuration: 1, animations:{
                                ()-> Void in
                                //完成动画时，数字块复原
                                tile.layer.setAffineTransform(CGAffineTransform.identity)
                            })
            })
        }
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
extension Reactive where Base: UIControl{
    public var isEnabled: Binder<Bool>{
        return Binder(self.base) { control, value in
            control.isEnabled = value
            
        }
    }
}
    
