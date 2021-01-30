//
//  AuthenticationViewModel.swift
//  SocialMediaAuths
//
//  Created by Simec Sys Ltd. on 30/1/21.
//

import Foundation
import SwiftUI
import FBSDKLoginKit
import Firebase

class AuthenticationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var isActive: Bool = false
    
    @Published var fbLoginManager = LoginManager()

    
    // MARK:- Social Media Logins
    func facebookLogin() {
        fbLoginManager.logIn(permissions: ["email"], from: nil) { (result, error) in
            guard result != nil else {
                print(error!.localizedDescription)
                return
            }
            guard let accessToken = AccessToken.current else { return }
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { (result, error) in
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }
                print("Successful.")
                self.isActive = true
            }
        }
    }
}
