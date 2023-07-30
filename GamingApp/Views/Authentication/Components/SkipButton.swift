//
//  SkipButton.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-29.
//

import SwiftUI

struct SkipButton: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                // Later
            } label: {
                Text("Skip")
                    .foregroundColor(Color(UIColor.systemBlue))
            }
            .padding(.trailing,20)
        }
    }
}
