import SwiftUI

struct OTPView: View {
    @State private var otp: [String] = Array(repeating: "", count: 6)
    let phoneNumber: String
    @State private var remainingTime = 120
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    // navigation flag
    @State private var navigateToProfileCreation = false

    var obscuredPhoneNumber: String {
        guard phoneNumber.count > 4 else { return phoneNumber }
        let prefixString = phoneNumber.prefix(4)
        let suffixString = phoneNumber.suffix(3)
        let obscuredPart = String(repeating: "*", count: phoneNumber.count - 7)
        return "\(prefixString)\(obscuredPart)\(suffixString)"
    }

    var timeFormatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }

    var isOTPValid: Bool {
        return !otp.contains { $0.isEmpty }
    }

    var body: some View {
        NavigationView {
            VStack(spacing:20){
                SkipButton()
                Rectangle()
                    .fill(Color(UIColor.systemBackground))
                    .frame(height: 50)
                Text("Verify your mobile number")
                    .font(.title2)
                    .bold()
                Text("Enter the 6 digit code sent to")
                    .bold()
                Text(obscuredPhoneNumber)
                    .bold()
                HStack {
                    ForEach(0..<6) { index in
                        TextField("", text: $otp[index])
                            .keyboardType(.numberPad)
                            .frame(width: 40, height: 45)
                            .cornerRadius(5)
                            .border(Color.gray, width: 1)
                            .multilineTextAlignment(.center)
                            .onReceive(otp[index].publisher.collect()) {
                                self.otp[index] = String($0.prefix(1))
                            }
                    }
                }

                NavigationLink(destination: ProfileCreationView()
                                .navigationBarBackButtonHidden(true),
                               isActive: $navigateToProfileCreation) {
                    EmptyView()
                }

                Button {
                    if isOTPValid {
                        navigateToProfileCreation = true
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

                if remainingTime > 0 {
                    HStack {
                        Text("Resend code in ") +
                        Text("\(timeFormatter.string(from: TimeInterval(remainingTime)) ?? "00:00")")
                            .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                    .onReceive(timer) { _ in
                        if remainingTime > 0 {
                            remainingTime -= 1
                        }
                    }
                } else {
                    HStack {
                        Text("Code has expired")
                        Button("Resend code") {
                            remainingTime = 120 // reset timer
                        }
                        .bold()
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView(phoneNumber: "+37062738690")
    }
}
