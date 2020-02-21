//
//  SnowShoeRequest.swift
//  Pods
//
//  Created by Jesse Stewart on 2/18/20.
//

import Foundation

public struct SnowShoeRequest : Codable {
    public var data: [[Double]]
    
    init(_ data: [[Double]]) {
        self.data = data
    }
}
