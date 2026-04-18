import Foundation

struct Match: Identifiable, Codable {
    let id: UUID
    var date: Date
    var opponent: String
    var location: String
    var teamSetsWon: Int
    var opponentSetsWon: Int
    var notes: String

    var resultLabel: String {
        teamSetsWon > opponentSetsWon ? "Win" : "Loss"
    }

    var scoreLabel: String {
        "\(teamSetsWon)-\(opponentSetsWon)"
    }

    init(
        id: UUID = UUID(),
        date: Date,
        opponent: String,
        location: String,
        teamSetsWon: Int,
        opponentSetsWon: Int,
        notes: String
    ) {
        self.id = id
        self.date = date
        self.opponent = opponent
        self.location = location
        self.teamSetsWon = teamSetsWon
        self.opponentSetsWon = opponentSetsWon
        self.notes = notes
    }
}
