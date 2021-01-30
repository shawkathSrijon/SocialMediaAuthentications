//
//  ContentView.swift
//  SocialMediaAuths
//
//  Created by Simec Sys Ltd. on 30/1/21.
//

import SwiftUI

struct ContentView: View {
    var socialMediaLogos: [String] = ["FacebookLogo", "GoogleLogo","TweeterLogo","LinkedInLogo"]
    
    @ObservedObject var authViewModel = AuthenticationViewModel()
    
    var body: some View {
        HStack {
            ForEach(socialMediaLogos, id: \.self) { logo in
                Button(action: {
                    if logo == "FacebookLogo" {
                        authViewModel.facebookLogin()
                    }
                }) {
                    Image(logo)
                }
                if socialMediaLogos.last != logo { Spacer(minLength: 0) }
            }
        }
        .padding(.horizontal, 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
