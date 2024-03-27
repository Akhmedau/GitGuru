//
//  NSNotificationName.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 12/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    
    // MARK: - Static Properties
    
    static let sessionExpired = NSNotification.Name(rawValue:"sessionExpiredNotification")
    static let receivedNotification = NSNotification.Name(rawValue:"receivedNotification")
}
