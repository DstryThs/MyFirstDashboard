import SwiftUI

struct AddMatchView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: MatchStore

    @State private var date = Date()
    @State private var opponent = ""
    @State private var location = ""
    @State private var teamSetsWon = 0
    @State private var opponentSetsWon = 0
    @State private var notes = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Match Details") {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Opponent", text: $opponent)
                    TextField("Location", text: $location)
                }

                Section("Score") {
                    Stepper("Your sets won: \(teamSetsWon)", value: $teamSetsWon, in: 0...5)
                    Stepper("Opponent sets won: \(opponentSetsWon)", value: $opponentSetsWon, in: 0...5)
                }

                Section("Notes") {
                    TextEditor(text: $notes)
                        .frame(minHeight: 90)
                }
            }
            .navigationTitle("New Match")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let match = Match(
                            date: date,
                            opponent: opponent.trimmingCharacters(in: .whitespacesAndNewlines),
                            location: location.trimmingCharacters(in: .whitespacesAndNewlines),
                            teamSetsWon: teamSetsWon,
                            opponentSetsWon: opponentSetsWon,
                            notes: notes.trimmingCharacters(in: .whitespacesAndNewlines)
                        )
                        store.add(match)
                        dismiss()
                    }
                    .disabled(opponent.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
