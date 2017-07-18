//
//  CViewController.swift
//  SWSample
//
//  Created by Leo on 2017/7/18.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(_ sender: UIButton) {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let ncc = sb.instantiateViewController(withIdentifier: "NavigationControllerA") as! UINavigationController
        let vc = sb.instantiateViewController(withIdentifier: "AViewController");
        
        ncc.setViewControllers([vc], animated: false)
        self.revealViewController().setFront(ncc, animated: true)
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
