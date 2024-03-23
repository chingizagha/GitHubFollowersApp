//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Chingiz on 18.03.24.
//

import Foundation

enum GFError: String, Error{
    
    case invalidUsername = "This username created an invalid request."
    case unabelToComplete = "Unabel to complete your request."
    case invalidResponse = "Invalid response from the server."
    case invalidData = "The data received was invalid."
    case unableToFavorite = "There was an error favoriting this user. Plase try again."
    case alreadyFavorites = "You've already favorited this user. You must really like them!"
}
