//
//  ViewController.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import UIKit
import RxSwift
import RxCocoa

class FollowersListViewController: UIViewController {
    @IBOutlet weak var followerTbl: UITableView!

    let presenter =  FollowListPresenter()
    private let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        followerTbl.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        setupRx()
        //MARK:- Fetch the Data from presenter
        presenter.fetchUsers()
    }
    
    func setupRx() {
        
        presenter.dataSource
            .bind(to: followerTbl.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (row, element, cell) in
                cell.textLabel?.text = "\(element.login)"
            }
            .disposed(by: disposeBag)
        
        followerTbl.rx.modelSelected(FollowersModel.self).subscribe { (model) in
            print(model.login)
        }.disposed(by: disposeBag)
    }

}
