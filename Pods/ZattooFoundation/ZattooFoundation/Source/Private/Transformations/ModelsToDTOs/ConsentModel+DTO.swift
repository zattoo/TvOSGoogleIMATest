//
//  ConsentModel+DTO.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 29.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ConsentModel: DTOConvertible {

    var DTO: Consent {
        return Consent(id: id,
                       value: value,
                       confirmationOnly: confirmationOnly,
                       title: title,
                       linkTitle: linkTitle,
                       infoText: infoText,
                       redirectUrl: redirectUrl,
                       embedUrl: embedUrl,
                       plainTextUrl: plainTextUrl)
    }
}
