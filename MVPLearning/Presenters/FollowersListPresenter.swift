//
//  FollowersListPresenter.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 05/02/21.
//

import Foundation


public enum AssetGroupViewUpdateEvent: Equatable {
    case reloadData
    case showAnimation
    case stopAnimation
    case noResultFoundForSearch(String)
    case unknownError
    case hideAccessoryView
}

protocol  FollowListPresenterContract:FollowListPresenterViewContract {
    
    func fetchUsers()
}

protocol  FollowListPresenterViewContract {
    
    var viewUpdate: ((AssetGroupViewUpdateEvent) -> Void)? { get set }
    
    func showSpinner();
    func reloadData();
    func hideSpinner();
}


class FollowListPresenter:FollowListPresenterContract {
    
    var viewUpdate: ((AssetGroupViewUpdateEvent) -> Void)?
    var webService :WebServiceContract?
    
    func showSpinner() {
        
    }
    
    func reloadData() {
        
    }
    
    func hideSpinner() {
        
    }
    
    
    var followPresenter:FollowListPresenterViewContract?
    
    init() {
        webService = WebService()
    }
    
    init(presenter:FollowListPresenterViewContract){
        followPresenter = presenter
    }
    
    func fetchUsers() {
        
        viewUpdate?(.reloadData)
        
        webService?.processService(endPoint: Constant.followers, completion: { response in
            
           // print("response is \(response)")
            
            switch response {
               case .success(let data):
                do {
                  let followers =   try JSONDecoder().decode([FollowersModel].self, from: data!)
                    print("followers -----> \(followers)")
                } catch (let error) {
                    print("catch -----> \(error.localizedDescription)")
                    print(String(data: data!, encoding: .utf8) ?? "nothing received")
                }
                
                
               case .failure(let error):
                   print(error.localizedDescription)
               }
            

            
            
        })
        
        //show spinner
        //api request
        //hidespinner
        followPresenter?.showSpinner()
        followPresenter?.reloadData()
        followPresenter?.hideSpinner()

        
    }
    
    
}
