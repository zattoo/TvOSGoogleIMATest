//
//  YouthProtectedModel+DTO.swift
//  ZattooFoundation
//
//  Created by Abraham Tomas Diaz Abreu on 08.05.17.
//  Copyright © 2017 Zattoo, Inc. All rights reserved.
//

import Foundation

extension YouthProtectedModel: DTOConvertible {
    
    var DTO: YouthProtected {
        return YouthProtected(state: state, attemptsLeft: attemptsLeft, pinRequiredUntil: pinRequiredUntil, lockedUntil: lockedUntil)
    }
}
