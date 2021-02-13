//
//  FollowersListPresenter.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import Foundation
import RxSwift
import RxCocoa

class FollowListPresenter:FollowListPresenterContract {

    var dataSource: BehaviorRelay<[FollowersModel]> = BehaviorRelay(value: [])
//    var dataSource: [FollowersModel]?
    var viewUpdate: ((FollowerListViewUpdateEvent) -> Void)?
    var webService :WebServiceContract?
    
    var followPresenter:FollowListPresenterViewContract?
    
    init() {
        webService = WebService()
    }
    
    func fetchUsers() {
        
        webService?.processService(endPoint: Constant.followers, completion: { response in
                        
            switch response {
               case .success(let data):
                do {
                  let followers =   try JSONDecoder().decode([FollowersModel].self, from: data!)
//                    self.dataSource = followers
                    self.dataSource.accept(followers) //Adding Data to Data source
//                    self.viewUpdate?(.reloadData)
                    print("followers -----> \(followers)")
                } catch (let error) {
                    print("catch -----> \(error.localizedDescription)")
                    print(String(data: data!, encoding: .utf8) ?? "nothing received")
                    
                }
                
               case .failure(let error):
                   print(error.localizedDescription)
               }
                        
        })
        
    }
    
    
}

extension FollowListPresenter {

    func HandleActionEvent(eventType: FollowerListHandleEvent) {
        switch eventType {
        case .backButton: break
        case .selectedFollower: break
          //  let model = dataSource.
           // viewUpdate?(.selectedFollower(model?.login ?? ""))
        }
    }
}
