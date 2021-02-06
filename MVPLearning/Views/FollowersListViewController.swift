//
//  ViewController.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    func showSpinner() {
    //self.activity indicator show spinner
    }
    
    func reloadData() {
        //self.activity indicator show spinner
    }
    
    func hideSpinner() {
        //self.activity hide show spinner
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let presenter =  FollowListPresenter()
       
        presenter.viewUpdate =  { event in
            switch  event{
            case .reloadData:
                NSLog("reloadData reload data")
            default:
                NSLog("default")
            }
        }
        
        presenter.fetchUsers()
        
        
    }


}

