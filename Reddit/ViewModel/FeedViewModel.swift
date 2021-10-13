//
//  FeedViewModel.swift
//  Reddit
//
//  Created by Naveen Sudireddy on 10/13/21.
//  Copyright © 2021 Naveen Sudireddy. All rights reserved.
//

import Foundation

struct FeedViewModel {
    
    weak var delegate: FeedViewControllerDelegate?
    
    func fetchFeedData() {
        let feedData = FeedData()
        feedData.getFeedData { result in
            switch result {
            case .success(let data):
                getChildrenData(data: data)
            case .failure(_):
                delegate?.errorLoadingData()
            }
        }
    }
    
    func getChildrenData(data: FeedResponse) {
        
        let response = data.data.children
        
        let childrenData = response.compactMap({$0.data})
        print(childrenData)
        DispatchQueue.main.async {
            delegate?.loadData(list: childrenData)
        }

    }
    
}
