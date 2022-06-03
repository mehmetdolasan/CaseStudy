//
//  ShoesDetailScreenViewController.swift
//  CaseStudy
//
//  Created by Mehmet Dolasan on 2.06.2022.
//

import UIKit

class ShoesDetailScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        
        
        //Status bar color
        if #available(iOS 13, *) {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            let statusBar = UIView(frame: (keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = .init(_colorLiteralRed: 0.965, green: 0.965, blue: 0.965, alpha: 100)
            keyWindow?.addSubview(statusBar)
        }
        //
        
        
        
    }
    

    

}
