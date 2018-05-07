//
//  MyTableViewController.swift
//  RxSwift-Demo
//
//  Created by 王发祖 on 2018/4/29.
//  Copyright © 2018年 王发祖. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
       
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            let imageV = UIImageView()
            imageV.tag = 100

        
        
        
        imageV.backgroundColor = .blue
        cell.addSubview(imageV)
//        imageV?.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.size.equalTo(50)
//        }
        
        
        cell.backgroundColor = .blue

        return cell
    }
 

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //设置cell的显示动画
    func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!,
                   forRowAtIndexPath indexPath: NSIndexPath!){
        //设置cell的显示动画为3D缩放
        //xy方向缩放的初始值为0.1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        //设置动画时间为0.25秒，xy方向缩放的最终值为1
        UIView.animate(withDuration: 1, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //设置cell的显示动画为3D缩放
        //xy方向缩放的初始值为0.1
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        //设置动画时间为0.25秒，xy方向缩放的最终值为1
        UIView.animate(withDuration: 0.5, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

 /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
