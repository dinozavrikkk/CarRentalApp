
import Foundation

struct Joke: Codable {
    
    let error: Bool
    let category, type, setup, delivery: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
    
}


struct Flags: Codable {
    
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
    
}

// MARK: - Kino
struct Kino: Codable {
    let pagesCount: Int
    let films: [Film]
}

// MARK: - Film
struct Film: Codable {
    let filmID: Int
    let nameRu: String
    let nameEn: String?
    let year, filmLength: String
    let countries: [Country]
    let genres: [Genre]
    let rating: String
    let ratingVoteCount: Int
    let posterURL, posterURLPreview: String
    let ratingChange: JSONNull?

    enum CodingKeys: String, CodingKey {
        case filmID = "filmId"
        case nameRu, nameEn, year, filmLength, countries, genres, rating, ratingVoteCount
        case posterURL = "posterUrl"
        case posterURLPreview = "posterUrlPreview"
        case ratingChange
    }
}

// MARK: - Country
struct Country: Codable {
    let country: String
}

// MARK: - Genre
struct Genre: Codable {
    let genre: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

