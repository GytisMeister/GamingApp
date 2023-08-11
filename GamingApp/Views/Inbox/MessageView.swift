//
//  MessageView.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-08-11.
//

import SwiftUI

struct MessageView: View {
    let randomBools: [Bool] = (0..<20).map {_ in Bool.random() }
    @State private var messageText: String = ""
    var isCurrentUser : Bool = false
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(.label))
                }

                Image("person_1")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                Text("Iamcallous")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.label))
                Spacer()
                Button {
                    //
                } label: {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color(.label))
                }
                
            }
            .padding(.horizontal)
            ScrollView {
                
                VStack {
                    ForEach(randomBools, id: \.self) { isCurrentUser in
                        ChatBubbleCell(isCurrentUser: isCurrentUser)
                    }
                }
            }
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "photo")
                        .foregroundColor(Color(.label))
                }
                TextField("Start Message", text: $messageText)
                    .padding(.trailing, 20)
                Button {
                    //
                } label: {
                    Image(systemName: "mic")
                        .foregroundColor(Color(.label))
                }
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding()
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    @State static private var isPreviewPresented: Bool = true

    static var previews: some View {
        MessageView(isPresented: $isPreviewPresented)
    }
}
