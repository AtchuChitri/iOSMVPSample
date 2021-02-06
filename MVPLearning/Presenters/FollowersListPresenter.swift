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
    
    
    func showSpinner() {
        
    }
    
    func reloadData() {
        
    }
    
    func hideSpinner() {
        
    }
    
    
    var followPresenter:FollowListPresenterViewContract?
    
    init() {
        
    }
    
    init(presenter:FollowListPresenterViewContract){
        followPresenter = presenter
    }
    
    func fetchUsers() {
        
        viewUpdate?(.reloadData)
        
        //show spinner
        //api request
        //hidespinner
        followPresenter?.showSpinner()
        followPresenter?.reloadData()
        followPresenter?.hideSpinner()

        
    }
    
    
}
