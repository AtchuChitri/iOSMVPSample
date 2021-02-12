//
//  FollowersListPresenterContract.swift
//  MVPLearning
//
//  Created by Chithri Atchibabu (BLR GSS) on 09/02/21.
//

import Foundation
import RxCocoa
import RxSwift


public enum FollowerListViewUpdateEvent: Equatable {
    case reloadData
    case showAnimation
    case stopAnimation
    case noResultFoundForSearch(String)
    case unknownError
    case hideAccessoryView
    case selectedFollower(String)
}

enum FollowerListHandleEvent: Equatable {
    case backButton
    case selectedFollower(Int)
}

typealias FollowListPresenterContract = FollowListPresenterViewContract & FollowersListRenderContract & FollowerListActionEventContract

/// FollowersListRenderContract
protocol FollowersListRenderContract {
//    var dataSource:[FollowersModel]? { get set }
//    var dataSource:BehaviorRelay<[FollowersModel]?> { get set }
    var dataSource:BehaviorRelay<FollowersModelArray> { get set }


}

/// FollowerListActionEventContract
protocol FollowerListActionEventContract {
    
    /// HnadleAction Events
    /// - Parameter eventType: FollowerListHandleEvent
    func HandleActionEvent( eventType : FollowerListHandleEvent)
    /// get list of Followers
    func fetchUsers()

    
}

/// FollowListPresenterViewContract
protocol  FollowListPresenterViewContract {
    
    /// View update Events
    var viewUpdate: ((FollowerListViewUpdateEvent) -> Void)? { get set }
}
