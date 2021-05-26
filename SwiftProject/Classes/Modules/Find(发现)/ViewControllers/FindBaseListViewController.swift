//
//  FindBaseListViewController.swift
//  SwiftProject
//
//  Created by Charles on 2021/4/22.
//

import UIKit
import JXSegmentedView

class FindBaseListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


extension FindBaseListViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
