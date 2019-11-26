//
//  ViewController.swift
//  MyExtensions
//
//  Created by osanai on 2019/06/04.
//  Copyright © 2019 osanai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapped(_ sender: Any) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "ほげほげ"
        label.backgroundColor = .white
        let a = CommonDialogViewController.create(innerView: label)
        self.present(a, animated: true, completion: nil)
        view.viewController
    }


}

