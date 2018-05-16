//
//  TvViewController.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/5/10.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import UIKit
import SwiftyJSON
class TvViewController: UIViewController,UITableViewDataSource {
    lazy var tableV: UITableView = {
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: AppWidth, height: AppHeight), style: .plain)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    var dataSourse  = [String]()
    var channels: Array<JSON> = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dog  = Dog(name: "xiaohei", birthPlace: "中国")
        dog.playWith()
        dog.fed(food: "骨头")
        let car = Cat(name: "mimi", birthPlace: "巴黎")
        car.playWith()
        car.fed(food: "老鼠")
        // Do any additional setup after loading the view.
        for i in 0...20 {
            dataSourse.append("wangfazu  \(i)")
        }
        self.view.addSubview(tableV)
        //使用我们的provider进行网络请求（获取频道列表数据）
        DouBanProvider.request(.channels) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                self.channels = json["channels"].arrayValue
                
                //刷新表格数据
                DispatchQueue.main.async{
                    self.tableV.reloadData()
                }
            }
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


extension TvViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell?.accessoryType = .disclosureIndicator
        
        cell?.textLabel?.text = channels[indexPath.row]["name"].stringValue
        
//        //
//        let headV = UIImageView()
//        let leftV = UIImageView()
//        let rightV = UIImageView()
//        //
//        cell?.addSubview(headV)
//        cell?.addSubview(leftV)
//        cell?.addSubview(rightV)
//        //
//        headV.snp.makeConstraints { (make) in
//            make.size.equalTo(AppWidth/2)
//            make.center.equalTo(AppWidth/4-10)
//        }
//        leftV.snp.makeConstraints { (make) in
//            make.width.equalTo(AppWidth/2)
//            make.height.equalTo(AppWidth/4)
//            make.centerX.equalTo(AppWidth * 0.75)
//            make.centerY.equalTo(30)
//        }
//        rightV.snp.makeConstraints { (make) in
//            make.centerX.equalTo(leftV)
//            make.centerY.equalTo(AppWidth/4 + 40)
//            make.size.equalTo(leftV)
//        }
//        headV.backgroundColor = .red
//        leftV.backgroundColor = .green
//        rightV.backgroundColor = .purple

        
        
        
        return cell!
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "豆瓣歌曲列表"
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //获取选中项信息
        let channelName = channels[indexPath.row]["name"].stringValue
        let channelId = channels[indexPath.row]["channel_id"].stringValue
        
        //使用我们的provider进行网络请求（根据频道ID获取下面的歌曲）
        DouBanProvider.request(.playlist(channelId)) { result in
            if case let .success(response) = result {
                //解析数据，获取歌曲信息
                let data = try? response.mapJSON()
                let json = JSON(data!)
                let music = json["song"].arrayValue[0]
                let artist = music["artist"].stringValue
                let title = music["title"].stringValue
                let message = "歌手：\(artist)\n歌曲：\(title)"
                
                //将歌曲信息弹出显示
                self.showAlert(title: channelName, message: message)
            }
        }
        
    
        
        
        
    }
    //显示消息
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return AppWidth/2
//    }
    
}
