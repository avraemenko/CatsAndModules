//
//  Cat.swift
//  Networking
//
//  Created by Kate Avramenko on 25.06.2022.
//

import Foundation

public struct Cat : Codable, Identifiable {
    public let url : String
    public let id : String
    public let height : Int
    public let width : Int
}
