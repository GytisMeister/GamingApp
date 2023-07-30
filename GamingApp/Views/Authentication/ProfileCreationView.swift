import SwiftUI

struct ProfileCreationView: View {
    @State private var username : String = ""
    @State private var errorMessage: String = ""
    @State private var navigateToHomeView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                SkipButton()
                VStack {
                    Text("Set up a username")
                        .font(.title2)
                        .bold()
                    TextField("username", text: $username)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding()
                }
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.trailing)
                }
                
                NavigationLink(destination: TabNavigationView().navigationBarBackButtonHidden(true),
                               isActive: $navigateToHomeView) {
                    Button(action: {
                        if username.isEmpty {
                            errorMessage = "Please enter username"
                        } else {
                            navigateToHomeView = true
                        }
                    }) {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                    }
                    .buttonStyle(.borderedProminent)
                    .clipShape(Capsule())
                    .padding()
                    .tint(Color(UIColor.systemBlue))
                }
                Spacer()
            }
        }
    }
}

struct ProfileCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreationView()
    }
}
