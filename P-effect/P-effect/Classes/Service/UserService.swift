//
//  UserService.swift
//  P-effect
//
//  Created by Jack Lapin on 16.02.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import Foundation

typealias LoadingUserCompletion = (object: User?, error: NSError?) -> ()

private let messageDataSuccessfullyUpdated = "User data has been updated!"
private let messageDataNotUpdated = "Troubles with the update! Check it out later"

class UserService {
    
    func uploadUserChanges(user: User, avatar: PFFile, nickname: String, completion: (Bool?, String?) -> ()) {
        user.avatar = avatar
        user.username = nickname
        user.saveInBackgroundWithBlock { succeeded, error in
            if succeeded {
                completion(true, nil)
                AlertService.simpleAlert(messageDataSuccessfullyUpdated)
            } else {
                AlertService.simpleAlert(messageDataNotUpdated)
                if let error = error?.localizedDescription {
                    completion(false, error)
                }
            }
        }
    }
    
}
