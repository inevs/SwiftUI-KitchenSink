import SwiftUI

struct ButtonsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Buttons")
                    .font(.largeTitle)
                Text("A button initiates an instantaneous action.")
                    .font(.subheadline)
            }
            .padding()
            List {
                Section(header: Text("System Button")) {
                    Button(action: tapMe) {
                        Text("Button with text")
                    }
                    Button(action: tapMe) {
                        Label("Button with Label", systemImage: "button.horizontal")
                    }
                    Button("Icon only", systemImage: "button.horizontal", action: tapMe)
                        .labelStyle(.iconOnly)
                }
                Text("In Context Menu")
                    .contextMenu {
                        Button("Cut", action: tapMe)
                        Button("Copy", action: tapMe)
                        Button("Paste", action: tapMe)
                    }
                Section(header: Text("Roles")) {
                    Button("Destructive", role: .destructive, action: tapMe)
                    Button("Cancel", role: .cancel, action: tapMe)
                    Button("Close", role: .close, action: tapMe)
                    Button("Confirm", role: .confirm, action: tapMe)
                }
                Section(header: Text("Styling")) {
                    Button("Plain", action: tapMe)
                        .buttonStyle(.plain)
                    Button("Bordered", action: tapMe)
                        .buttonStyle(.bordered)
                    Button("BorderedProminent", action: tapMe)
                        .buttonStyle(.borderedProminent)
                    Button("Borderless", action: tapMe)
                        .buttonStyle(.borderless)
                    Button("Glass", action: tapMe)
                        .buttonStyle(.glass)
                    Button("GlassProminent", action: tapMe)
                        .buttonStyle(.glassProminent)
                }
            }
            .listStyle(.grouped)
        }
    }
    
    func tapMe() {
        print("Button tapped")
    }
}

#Preview {
    NavigationStack {
        ButtonsView()
    }
}
