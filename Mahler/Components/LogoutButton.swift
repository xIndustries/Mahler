import SwiftUI

struct LogoutButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text("Logout")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(8)
        }
        .padding(.horizontal)
    }
}

// ✅ Fixed Preview with Default Action
#Preview {
    LogoutButton {
        print("Logout button tapped (Preview)")
    }
}
