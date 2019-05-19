//
//  ViewController.swift
//  DemoSignup
//
//  Created by Jamil on 5/19/19.
//  Copyright © 2019 Jamil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "MenuFormViewController") as! MenuFormViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

