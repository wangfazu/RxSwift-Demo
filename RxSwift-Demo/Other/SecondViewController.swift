//
//  SecondViewController.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/4/28.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import UIKit
import StarWars
import SnapKit
class SecondViewController: UIViewController,UIViewControllerTransitioningDelegate {

    lazy var fView  = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red

        let mView = UIView()
        self.view.addSubview(mView)
        self.view.addSubview(fView)
        mView.backgroundColor = .blue
        fView.backgroundColor = .orange
        mView.snp.makeConstraints { (make) in

            make.center.equalToSuperview()
            make.size.equalTo(300)
            
        }
        fView.snp.makeConstraints { (make) in
            make.size.equalTo(mView).offset(-100)
            make.center.equalTo(mView)
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        dismiss(animated: false, completion: nil)
        let vc = SecondViewController()
        vc.transitioningDelegate = self
        
        dismiss(animated: true) {
            StarWarsGLAnimator()
        }
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return StarWarsGLAnimator()
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
