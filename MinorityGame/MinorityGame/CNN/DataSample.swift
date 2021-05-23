//
//  DataSample.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/20.
//

import Foundation

struct Dataset {
    var items: [DataSample]
}

struct DataSample {
    var input: DataPiece
    var output: DataPiece
}

struct DataPiece {
    var size: DataSize
    var body: [Float]
    
    func get(x: Int) -> Float {
        return body[x]
    }
    
    func get(x: Int, y: Int) -> Float {
        return body[x + y * size.width]
    }
    
    func get(x: Int, y: Int, z: Int) -> Float {
        return body[z + (x + y * size.width) * size.depth!]
    }
}

struct DataSize {
    var type: DataSizeType
    var width: Int
    var height: Int?
    var depth: Int?
    
    init(width: Int) {
        type = .oneD
        self.width = width
    }
    
    init(width: Int, height: Int) {
        type = .twoD
        self.width = width
        self.height = height
    }
    
    init(width: Int, height: Int, depth: Int) {
        type = .threeD
        self.width = width
        self.height = height
        self.depth = depth
    }
}

enum DataSizeType: Int {
    case oneD = 1
    case twoD
    case threeD
}
