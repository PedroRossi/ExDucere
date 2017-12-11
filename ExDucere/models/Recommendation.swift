//
//  Recommendation.swift
//  ExDucere
//
//  Created by Pedro Gonçalves Rossi Rodrigues on 10/12/17.
//  Copyright © 2017 Pedro Gonçalves Rossi Rodrigues. All rights reserved.
//

import FirebaseDatabase

class Recommendation {
    
    var id: String
    var type: Int
    var subject: String
    var topic: String
    var ageRange: (Int, Int)
    var description: String
    var guide: String
    
    init(id: String, type: Int, subject: String, topic: String, ageRange: (Int, Int), description: String, guide: String) {
        self.id = id
        self.type = type
        self.subject = subject
        self.topic = topic
        self.ageRange = ageRange
        self.description = description
        self.guide = guide
        
        return
    }

}
