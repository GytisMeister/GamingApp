//
//  SignUpView.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        NavigationView {
            VStack{
                SkipButton()
                PhoneNumberTextField()
                SocialLogin()
                Spacer()
                AgreementLinks()
                HStack {
                    Text("Already a user? ") +
                    Text(" Log In")
                        .foregroundColor(.blue)
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct SocialLogin: View {
    var body: some View {
        VStack{
            LabelledDivider(label: "OR")
            HStack{
                Spacer()
                
                Button {
                    //
                } label: {
                    Image("googlelogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.all,5)
                }
                .buttonStyle(.borderedProminent)
                .clipShape(Circle())
                .tint(Color(UIColor.systemGray5))
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.all,5)
                        .foregroundColor(Color("iconColor"))
                    
                    
                }
                .clipShape(Circle())
                .buttonStyle(.borderedProminent)
                .clipShape(Circle())
                .tint(Color(UIColor.systemGray5))
                
                Spacer()
            }
        }
    }
}

struct PhoneNumberTextField: View {
    @State private var phoneNumber: String = ""
    @State private var errorMessage: String = ""
    @State private var navigateToOTPView: Bool = false
    var body: some View {
        VStack{
            TextField("Mobile Number", text: Binding(
                get: { self.phoneNumber },
                set: { newValue in
                    let isNumeric = newValue.allSatisfy { $0.isNumber || $0 == "+" } && newValue.filter { $0 == "+" }.count <= 1
                    if isNumeric {
                        self.phoneNumber = newValue
                    }
                }
            ))
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.trailing)
            }
            
            NavigationLink(destination: OTPView(phoneNumber: phoneNumber).navigationBarBackButtonHidden(true),
                           isActive: $navigateToOTPView) {
                Button {
                    if phoneNumber.isEmpty {
                        errorMessage = "Please enter phone number"
                    } else {
                        navigateToOTPView = true
                    }
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                }
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
                .padding()
                .tint(Color(UIColor.systemBlue))
            }
        }
    }
}

struct AgreementLinks: View {
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0) {
                Text("By continuing, you agree to our ") +
                Text("User Agreement")
                    .bold()
                    .foregroundColor(.blue) +
                Text(" and ") +
                Text("Privacy Policy")
                    .bold()
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
    }
}
