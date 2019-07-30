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
        // Do any additional setup after loading the view, typically from a nib.

//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .green
//        view.addSubview(label)
//        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        label.layoutIfNeeded()
//
//        label.attributedText =
//        LabelCreator.create(with: [LabelCreator.LabelComponent(text: "hoge", font: .systemFont(ofSize: 10), textColor: .red),
//                                   LabelCreator.LabelComponent(text: "fuge", font: .systemFont(ofSize: 14), textColor: .blue),
//                                   LabelCreator.LabelComponent(text: "hage", font: .systemFont(ofSize: 17), textColor: .yellow),
//                                   LabelCreator.LabelComponent(text: "fugo", font: .systemFont(ofSize: 20), textColor: .black)])

        gradientView.gradientRYBAndWhite()
    }


}

