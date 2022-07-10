//
//  BaseViewController.swift
//  App test
//
//  Created by ToThang on 10/07/2022.
//

import UIKit

class BaseViewController: UIViewController {
    let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    func showActivityIndicator() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }

    func hideActivityIndicator(){
        activityView.stopAnimating()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
