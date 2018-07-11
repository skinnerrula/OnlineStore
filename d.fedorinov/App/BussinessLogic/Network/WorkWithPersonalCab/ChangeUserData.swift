//
//  ChangeUserData.swift
//  d.fedorinov
//
//  Created by Дмитрий Федоринов on 05.07.2018.
//  Copyright © 2018 Дмитрий Федоринов. All rights reserved.
//

import Foundation
import Alamofire

extension RequestToPersonalAccount{
    func changeUserData(user:User,
                        completionHandler: @escaping (DataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeData(baseUrl: baseUrl,
                                      user:user)
        self.request(reques: requestModel, completionHandler: completionHandler)
    }
    
    
    
}

