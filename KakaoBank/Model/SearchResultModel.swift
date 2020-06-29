//
//  SearchResultModel.swift
//  KakaoBank
//
//  Created by Yong Seok Kim on 2020/06/29.
//  Copyright © 2020 Yong Seok Kim. All rights reserved.
//

import UIKit

class SearchResultModel: Codable {

    let ipadScreenshotUrls: [String]
    let appletvScreenshotUrls: [String]
    let artworkUrl60: String
    let artworkUrl512: String
    let artworkUrl100: String
    let artistViewUrl: String
    let screenshotUrls: [String]
    let supportedDevices: [String]
    let advisories: [String]
    let isGameCenterEnabled: Bool
    let features: [String]
    let kind: String
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewUrl: String
    let trackContentRating: String
    let trackId: Int
    let trackName: String
    let releaseDate: String
    let genreIds: [String]
    let formattedPrice: String?
    let primaryGenreName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let minimumOsVersion: String
    let sellerName: String
    let currentVersionReleaseDate: String
    let releaseNotes: String?
    let primaryGenreId: Int
    let currency: String
    let description: String
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Double
    let bundleId: String
    let version: String
    let wrapperType: String
    let userRatingCount: Int
}
