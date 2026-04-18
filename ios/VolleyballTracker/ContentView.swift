import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: MatchStore
    @State private var showingAdd = false

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()

    var body: some View {
        NavigationStack {
            List {
                Section("Season Summary") {
                    HStack {
                        Label("Matches", systemImage: "sportscourt")
                        Spacer()
                        Text("\(store.matches.count)")
                    }

                    HStack {
                        Label("Record", systemImage: "chart.bar")
                        Spacer()
                        Text("\(store.wins)-\(store.losses)")
                    }

                    HStack {
                        Label("Win Rate", systemImage: "percent")
                        Spacer()
                        Text(store.winRate, format: .percent.precision(.fractionLength(0)))
                    }
                }

                Section("Matches") {
                    if store.matches.isEmpty {
                        ContentUnavailableView(
                            "No Matches Yet",
                            systemImage: "list.bullet.rectangle",
                            description: Text("Tap + to log your first volleyball match.")
                        )
                    } else {
                        ForEach(store.matches) { match in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(match.opponent)
                                        .font(.headline)
                                    Spacer()
                                    Text(match.resultLabel)
                                        .font(.subheadline.bold())
                                        .foregroundStyle(match.resultLabel == "Win" ? .green : .red)
                                }

                                Text("Score: \(match.scoreLabel)")
                                    .font(.subheadline)

                                Text("\(dateFormatter.string(from: match.date)) • \(match.location)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)

                                if !match.notes.isEmpty {
                                    Text(match.notes)
                                        .font(.caption)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: store.delete)
                    }
                }
            }
            .navigationTitle("Volleyball Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAdd = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Add Match")
                }
            }
            .sheet(isPresented: $showingAdd) {
                AddMatchView()
                    .environmentObject(store)
            }
        }
    }
}
