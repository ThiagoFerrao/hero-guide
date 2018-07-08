//
//  DateExtension.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

extension Date {
    func getTimeStamp() -> String {
        return String(Int64(self.timeIntervalSince1970 * 1000))
    }
}
