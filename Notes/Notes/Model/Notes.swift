//
//  Notes.swift
//  Notes
//
//  Created by Michael Duong on 1/19/18.
//  Copyright © 2018 Turnt Labs. All rights reserved.
//

import Foundation

class Notes: Equatable, Codable {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    static func ==(lhs: Notes, rhs: Notes) -> Bool {
        return lhs.text == rhs.text
        }
}

