//
//  InboxView.swift
//  GamingApp
//
//  Created by Gytis Ptašinskas on 2023-07-30.
//

import SwiftUI

struct InboxView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var searchText : String = ""
    @State private var isMessageViewPresented: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Message direct message", text: $searchText)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding()
                    
                    ForEach(0..<5, id: \.self) { user in
                        Button(action: {
                            isMessageViewPresented.toggle()
                        }) {
                            HStack {
                                Image("person_1")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)

                                VStack(alignment: .leading) {
                                    Spacer()
                                    Text("Iamcallous")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(.label))
                                    Spacer()
                                    Text("Down to play?")
                                        .foregroundColor(Color(.label))
                                    Spacer()
                                }
                                Spacer()
                                Text("10:59 am")
                                    .foregroundColor(Color(.systemGray))
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }

                }
                .navigationTitle("")
                .fullScreenCover(isPresented: $isMessageViewPresented) {
                               MessageView(isPresented: $isMessageViewPresented)
                           }
            }
        }
    }
}



struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
            .environmentObject(ViewRouter())
    }
}
