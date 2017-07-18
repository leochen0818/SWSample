//
//  BViewController.swift
//  SWSample
//
//  Created by Leo on 2017/7/18.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

protocol BVCDelegate: class {
    func doSomething()
}

class BViewController: UIViewController {
    
    weak var delegate: BVCDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDidClick(_ sender: UIButton) {
        delegate?.doSomething()
        self.dismiss(animated: true, completion: nil)
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
