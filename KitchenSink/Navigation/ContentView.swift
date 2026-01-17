import SwiftUI

struct ContentView: View {
    @State private var selectedItem: NavigationItem?
    
    var body: some View {
        NavigationSplitView {
            List(navigationItems, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                }
            }
            .navigationTitle("Components")
        } detail: {
            if let selectedItem {
                selectedItem.destination
            } else {
                ContentUnavailableView(
                    "Wähle ein Element",
                    systemImage: "sidebar.left",
                    description: Text("Wähle einen Eintrag aus der Sidebar")
                )
            }
        }
    }
}
