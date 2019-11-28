//
//  Account.swift
//  NTV Project
//
//  Created by Oktay on 13.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import Foundation

struct Account {
    let userName: String?
    let userLastName: String?
    let userInterests: String?
    let photoUrl: String?
    
    func fullName() -> String {
        return (userName ?? "") + " " + (userLastName ?? "")
    }
}
