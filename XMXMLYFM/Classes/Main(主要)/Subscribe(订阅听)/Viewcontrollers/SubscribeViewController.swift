//
//  SubscribeViewController.swift
//  XMXMLYFM
//
//  Created by 任长平 on 2016/12/7.
//  Copyright © 2016年 任长平. All rights reserved.
//

import UIKit

class SubscribeViewController:
XMBaseViewController ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton(show: false)
        
//        
        
        
        
        var colView: UICollectionView?;   // 创建一个列表
        let layout = UICollectionViewFlowLayout();
        
        colView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.view.bounds.height), collectionViewLayout: layout);
        
        colView?.register(XMFindToolBarCell.self, forCellWithReuseIdentifier: "XMFindToolBarCell")
        
        colView?.delegate = self;
        colView?.dataSource = self;
        colView?.backgroundColor = UIColor.white;
        
        layout.itemSize = CGSize(width: 60, height: 49);
        
        self.view.addSubview(colView!);
        
        
//        var leftBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add,
//                                      target: self, action: "onAdd")
        
    
        
        

        self.navigationItem.setHidesBackButton(false, animated: true)
        
    }
    
    
    func pop (){
        
    }
    
    // Cell 数量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    // Cell 具体内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "XMFindToolBarCell", for: indexPath) as! XMFindToolBarCell;
//        cell.title!.text = "这里是内容：\(indexPath.row)";
        cell.backgroundColor = UIColor.red
        return cell;
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
