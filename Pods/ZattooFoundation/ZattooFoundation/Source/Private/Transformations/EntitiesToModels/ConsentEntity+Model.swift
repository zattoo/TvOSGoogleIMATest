//
//  ConsentEntity+Model.swift
//  ZattooFoundation
//
//  Created by Vitalij Dadaschjanz on 29.08.18.
//  Copyright © 2018 Zattoo, Inc. All rights reserved.
//

import Foundation


extension ConsentEntity: ModelConvertible {

    var model: ConsentModel {
        return ConsentModel(id: id,
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
