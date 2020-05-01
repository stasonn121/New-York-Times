//
//  Sections.swift
//  New York Times
//
//  Created by user on 28.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

struct Sections {
    
    private let sections = ["Africa", "Americas", "ArtandDesign", "Arts", "AsiaPacific", "Automobile", "Baseball", "Books", "Business", "Climate", "CollegeBasketball", "CollegeFootball", "Dance", "Dealbook", "DiningandWine", "Economy", "Education", "EnergyEnvironment", "Europe", "FashionandStyle", "Golf", "Health", "Hockey", "HomePage", "Jobs", "Lens", "MediaandAdvertising", "MiddleEast", "MostEmailed", "MostShared", "MostViewed", "Movies", "Music", "NYRegion", "Obituaries", "PersonalTech", "Politics", "ProBasketball", "ProFootball", "RealEstate", "Science", "SmallBusiness", "Soccer", "Space", "Sports", "SundayBookReview", "Sunday-Review", "Technology", "Television", "Tennis", "Theater", "TMagazine", "Travel", "Upshot", "US", "Weddings", "Well", "YourMoney"]
    
    func getSections() -> [String] {
        return sections
    }
}
