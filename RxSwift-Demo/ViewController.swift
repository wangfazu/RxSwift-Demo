//
//  ViewController.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/4/21.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {
    
    var imgArr = [String]()
   
    //tableview对象
//    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableview: UITableView!
    
    //歌曲列表的数据源
    let musicListViewModel = MusicListViewModel()
    
    //负责对象销毁
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //将数据源绑定到tableview
        musicListViewModel.data
            .bind(to: tableview.rx.items(cellIdentifier: "MusicCell")) { _, music,cell in
                cell.textLabel?.text = music.name
                cell.detailTextLabel?.text = music.singer
        }.disposed(by: disposeBag)

        //tableView点击响应
        tableview.rx.modelSelected(Music.self).subscribe(onNext: { music in
            print("你选中的歌曲【\(music)】")
            
        }).disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //        // Do any additional setup after loading the view, typically from a nib.
        //        for _ in 0...2 {
        //            imgArr.append("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4251948844,1473065781&fm=27&gp=0.jpg")
        //            imgArr.append("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524296023690&di=68db79432b76c3777e7aa9248db573cc&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D4573e73727f5e0fefa15814234095edd%2F9825bc315c6034a8ebb350afc11349540923764f.jpg")
        //            imgArr.append("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=186700651,4000680280&fm=27&gp=0.jpg")
        //        }
        //
        //
        //
        //        for i in 0...2 {
        ////            let imgvH :CGFloat = CGFloat(i%3)
        //
        //            for y in 0...2{
        //                let imgv = UIImageView(frame: CGRect(x: AppWidth/3 * CGFloat(i), y: AppHeight/3 * CGFloat(y) ,  width: AppWidth/3, height: AppHeight / 3))
        //                imgv.kf.setImage(with: URL(string: imgArr[i]))
        //
        //                self.view.addSubview(imgv)
        //                print(i,y)
        //            }
        //
        ////            print("AppWidth/3 * (CGFloat(i)/3)",imgv.frame)
        //
        //        }

    }


}

