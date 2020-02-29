//
//  SimpraDB.swift
//  SimpraApp
//
//  Created by Mehmet Zeytin on 27.02.2020.
//  Copyright © 2020 Mehmet Zeytin. All rights reserved.
//

import Foundation
import RealmSwift

class SimpraDB {
    private let realm: Realm

    init() throws {
        self.realm = try Realm()
    }

//        func saveSection(_ section: Foo) throws {
//            try realm.write {
//                    realm.add(section, update: .all)
//                
//                
//       
//            }
//        }
//    
//        func updateSection(_ section: SectionResponse) throws {
//            try realm.write {
//                realm.add(section, update: .modified)
//            }
//        }
//        func getSection() -> Results<Group> {
//            return realm.objects(Group.self)
//          }
     
//
////    func removeFavorite(_ movie: Movie) throws {
////        try realm.write {
////            guard let realmObject = realm.objects(RealmMovie.self).first(where: { realmMovie in
////                return realmMovie.identifier == movie.identifier
////            }) else { return }
////            realm.delete(realmObject)
////        }
////    }
//
////    func getFavorites() -> [Movie] {
////        return realm.objects(RealmMovie.self).map(fromRealm)
////    }
////
//    private func toRealm(_ section: SectionResponseModel) -> Section {
//        let uSection = section.sections
//        
//
//        return uSection![0]
//    }
//
//    private func fromRealm(_ movie: RealmMovie) -> Movie {
//        return Movie(votes: movie.votes,
//                     identifier: movie.identifier,
//                     hasVideo: movie.hasVideo,
//                     averageRating: movie.averageRating,
//                     title: movie.title,
//                     popularity: movie.popularity,
//                     posterPath: movie.posterPath,
//                     originalTitle: movie.originalTitle,
//                     originalLanguage: movie.originalLanguage,
//                     isAdult: movie.isAdult,
//                     overview: movie.overview,
//                     releaseDate: movie.releaseDate,
//                     backdropPath: movie.backdropPath)
//    }
}
