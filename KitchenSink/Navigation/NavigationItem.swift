import SwiftUI

struct NavigationItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
    private let viewBuilder: () -> AnyView
    
    init(title: String, icon: String, @ViewBuilder view: @escaping () -> some View) {
        self.title = title
        self.icon = icon
        self.viewBuilder = { AnyView(view()) }
    }
    
    var destination: some View {
        viewBuilder()
    }
    
    static func == (lhs: NavigationItem, rhs: NavigationItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let navigationItems: [NavigationItem] = [
    NavigationItem(title: "Buttons", icon: "button.horizontal") {
        ButtonsView()
    },
    NavigationItem(title: "Forms", icon: "list.bullet.rectangle") {
        FormsView()
    },
    NavigationItem(title: "Charts", icon: "chart.bar") {
        ChartsView()
    }
]

// MARK: - Mock Detail Views
struct ButtonsView: View {
    var body: some View {
        Text("Buttons")
            .font(.largeTitle)
            .navigationTitle("Buttons")
    }
}

struct FormsView: View {
    var body: some View {
        Text("Forms")
            .font(.largeTitle)
            .navigationTitle("Forms")
    }
}

struct ChartsView: View {
    var body: some View {
        Text("Charts")
            .font(.largeTitle)
            .navigationTitle("Charts")
    }
}
