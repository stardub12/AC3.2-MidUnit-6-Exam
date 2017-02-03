//
//  DoubleVideoViewController.swift
//  AC3.2-MidUnit-6-Exam
//
//  Created by Jason Gresh on 2/3/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit

class DoubleVideoViewController: UIViewController, CellTitled {
    var titleForCell: String = "Double Video"

    @IBOutlet weak var videoContainerTop: UIView!
    @IBOutlet weak var videoContainerBottom: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }

    @IBAction func loadVideo(_ sender: UIButton) {
    
    }
}
