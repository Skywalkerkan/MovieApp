//
//  ErrorType.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import Foundation

enum ErrorTypes: String, Error{
    case invalidData = "Invalid data"
    case invalidUrl = "Invalid Url"
    case generalError = "Error Occured"
}

