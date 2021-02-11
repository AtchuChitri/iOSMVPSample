//
//  ViewController.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import UIKit

class FollowersListViewController: UIViewController {
    @IBOutlet weak var followerTbl: UITableView!

    let presenter =  FollowListPresenter()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        presenter.viewUpdate =  { event in
            switch  event{
            case .reloadData:
                NSLog("reloadData reload data")
                self.followerTbl.reloadData()
            case .selectedFollower(let name):
                print(name)
            default:
                NSLog("default")
            }
        }
        
        presenter.fetchUsers()
        
    }


}

extension FollowersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cellReuseIdentifier: String = "FollowersIdentifier"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
          if (cell == nil) {
            cell = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier:cellReuseIdentifier)
          }
        if let followerModel = presenter.dataSource?[indexPath.row] {
        
        cell?.textLabel?.text = followerModel.login
        }
        return cell!
    }
    
    
}

extension FollowersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.HandleActionEvent(eventType: .selectedFollower(indexPath.row))

    }
}
