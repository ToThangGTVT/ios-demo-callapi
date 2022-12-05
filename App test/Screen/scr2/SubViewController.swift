//
//  SubViewController.swift
//  App test
//
//  Created by FABBI on 25/05/2022.
//

import UIKit

class SubViewController: UIViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
        let placeholder = self.view!
        Bundle.main.loadNibNamed("SubViewController", owner: self, options: nil)
        placeholder.superview?.insertSubview(self.view, aboveSubview: placeholder)
        placeholder.removeFromSuperview()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
