import Foundation

final class MatchStore: ObservableObject {
    @Published private(set) var matches: [Match] = [] {
        didSet {
            save()
        }
    }

    private let userDefaultsKey = "volleyball_matches"

    init() {
        load()
    }

    func add(_ match: Match) {
        matches.insert(match, at: 0)
    }

    func delete(at offsets: IndexSet) {
        matches.remove(atOffsets: offsets)
    }

    var wins: Int {
        matches.filter { $0.teamSetsWon > $0.opponentSetsWon }.count
    }

    var losses: Int {
        matches.count - wins
    }

    var winRate: Double {
        guard !matches.isEmpty else { return 0 }
        return Double(wins) / Double(matches.count)
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: userDefaultsKey) else {
            matches = []
            return
        }

        do {
            let decoded = try JSONDecoder().decode([Match].self, from: data)
            matches = decoded
        } catch {
            matches = []
            print("Failed to decode saved matches: \(error)")
        }
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(matches)
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        } catch {
            print("Failed to save matches: \(error)")
        }
    }
}
