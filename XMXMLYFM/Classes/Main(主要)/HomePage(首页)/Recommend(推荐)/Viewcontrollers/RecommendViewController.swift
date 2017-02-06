//
//  RecommendViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/14.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit



class RecommendViewController: UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshDataSource()
       
    }
    
    func refreshDataSource(){
        HomePageApi.requestTuiJian { (result, error) in
            print("\(result)")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

//extension RecommendViewController {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        if (self.hotAndGuess != nil) {
//            return (self.hotAndGuess.hotRecommends?.list?.count)! + 1
//        }
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier:"RecommendCell", for: indexPath) as! RecommendCell
//       
//        
//        if indexPath.section == 0 {
//            if (self.recommends != nil) {
//                cell.editorRecommendAlbums = self.recommends.editorRecommendAlbums
//            }
//        }else{
//            if self.hotAndGuess != nil {
//                cell.hotList = self.hotAndGuess.hotRecommends?.list?[indexPath.section - 1]
//            }
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return (XMScreenWidth - 10*4) / CGFloat(3) + 110
//    }
//}
//
//




