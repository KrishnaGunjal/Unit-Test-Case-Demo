//
//  Data.swift
//  UnitTestCaseDemo
//
//  Created by Krishna Gunjal on 03/06/22.
//

import SwiftUI

struct Album: Codable, Hashable{
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
