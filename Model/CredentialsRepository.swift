//
//  CredentialsRepository.swift
//  ParkUI-FinalProject
//
//  Created by Marko Milardic on 09/12/2020.
//  Copyright © 2020 Marko Milardic. All rights reserved.
//

import Foundation

struct CredentialsRepository {
    static let shared = CredentialsRepository()
    
    private init() {}

    func setValue(value: String, for key: RepositoryKeys){
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    func getValue(for key: RepositoryKeys) -> String{
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    enum RepositoryKeys: String {
        case email = "milardic.parkUI.repository.email"
        case password = "milardic.parkUI.repository.password"
    }
}

