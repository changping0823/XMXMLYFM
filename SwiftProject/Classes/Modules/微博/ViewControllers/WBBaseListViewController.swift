//
//  WBBaseListViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/5/13.
//

import UIKit
import JXSegmentedView

class WBBaseListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}


extension WBBaseListViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
