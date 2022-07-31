//
//  CustomError.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 31.07.2022.
//

import Foundation

enum CustomError: String, Error {
    case invalidSection = "Section out of scope"
}
