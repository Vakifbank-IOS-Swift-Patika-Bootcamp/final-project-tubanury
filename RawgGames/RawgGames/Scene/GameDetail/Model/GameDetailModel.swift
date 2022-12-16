//
//  GameDetailModel.swift
//  RawgGames
//
//  Created by Tuba N. Yıldız on 8.12.2022.
//

import Foundation


// MARK: - GameDetailModel
struct GameDetailModel: Codable {
    let id: Int
    let slug, name, nameOriginal, gameDetailModelDescription: String
    let metacritic: Int
    let metacriticPlatforms: [MetacriticPlatform]
    let released: String
    let tba: Bool
    let updated: String
    let backgroundImage, backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let ratings: [Rating]
    let reactions: [String: Int]
    let added: Int
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount, parentAchievementsCount: Int
    let redditURL: String
    let redditName, redditDescription, redditLogo: String
    let redditCount, twitchCount, youtubeCount, reviewsTextCount: Int
    let ratingsCount, suggestionsCount: Int
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount: Int
    
    let reviewsCount: Int
    let saturatedColor, dominantColor: String
    let developers, genres, tags, publishers: [Developer]
    let descriptionRaw: String

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case gameDetailModelDescription = "description"
        case metacritic
        case metacriticPlatforms = "metacritic_platforms"
        case released, tba, updated
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case ratings, reactions, added
        case playtime
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
       
        case reviewsCount = "reviews_count"
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case developers, genres, tags, publishers
       
        case descriptionRaw = "description_raw"
    }
}



// MARK: - Developer
struct Developer: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain
    }
}


// MARK: - MetacriticPlatform
struct MetacriticPlatform: Codable {
    let metascore: Int
    let url: String
    let platform: MetacriticPlatformPlatform
}


// MARK: - MetacriticPlatformPlatform
struct MetacriticPlatformPlatform: Codable {
    let platform: Int
    let name, slug: String
}


