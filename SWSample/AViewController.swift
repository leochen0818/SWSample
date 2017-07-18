//
//  AViewController.swift
//  SWSample
//
//  Created by Leo on 2017/7/18.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class AViewController: UIViewController, BVCDelegate {

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
    
    func getViewControllerWith(sbId: String) -> UIViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: sbId)
    }
    
    // delegate
    func doSomething() {
        changeToC()
    }
    
    func changeToC() {
        let vc = getViewControllerWith(sbId: "CViewController")
        self.revealViewController().setFront(vc, animated: true)
    }
    
    @IBAction func btnDidClick(_ sender: UIButton) {
        let vc = getViewControllerWith(sbId: "BViewController") as! BViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btn2DidClick(_ sender: UIButton) {
        changeToC()
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
