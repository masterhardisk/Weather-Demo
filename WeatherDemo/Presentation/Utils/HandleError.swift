//
//  HandleError.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//


import SwiftUI

@Observable
class HandleError {
    var errorShow = false
    var errorMessage = ""
    
    internal func showError(message: String) {
        errorShow.toggle()
        errorMessage = message
    }
}