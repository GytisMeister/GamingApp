//
//  ChatBubbleCell.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-08-11.
//

import SwiftUI

struct ChatBubbleCell: View {
    var isCurrentUser : Bool = false
    var body: some View {
        if isCurrentUser {
            Text("Down to play?")
                .foregroundColor(Color(.white))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .frame(maxWidth: .infinity ,alignment: .trailing)
                .padding(.trailing)
        } else {
            Text("Yea for sure!")
                .foregroundColor(Color(.white))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(.label))
                .cornerRadius(10)
                .frame(maxWidth: .infinity ,alignment: .leading)
                .padding(.leading)
        }
    }
}

struct ChatBubbleCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleCell()
    }
}
