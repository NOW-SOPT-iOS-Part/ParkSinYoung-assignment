//
//  Config.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 5/10/24.
//

import Foundation

enum Config {
   
   enum Keys {
      enum Plist {
         static let baseURL = "BASE_URL"
         static let movieAPIKey = "MOVIEAPI_KEY"
      }
   }
   
   private static let infoDictionary: [String: Any] = {
      guard let dict = Bundle.main.infoDictionary else {
         fatalError("plist cannot found.")
      }
      return dict
   }()
}

extension Config {
   
   static let baseURL: String = {
      guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
         fatalError("Base URL is not set in plist for this configuration.")
      }
      return key
   }()
   
   static let movieAPIKey: String = {
      guard let key = Config.infoDictionary[Keys.Plist.movieAPIKey] as? String else {
         fatalError("Api key is not set in plist for this configuration.")
      }
      return key
   }()
}
