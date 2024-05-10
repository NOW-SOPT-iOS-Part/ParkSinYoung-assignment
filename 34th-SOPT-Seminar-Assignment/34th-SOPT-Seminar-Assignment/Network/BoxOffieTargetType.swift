//
//  BoxOffieTargetType.swift
//  34th-SOPT-Seminar-Assignment
//
//  Created by 박신영 on 5/10/24.
//

import Foundation
import Moya


enum BoxOffieTargetType {
   case getMovieInfo(date: String)
}

extension BoxOffieTargetType: TargetType {
   var baseURL: URL {
      return URL(string: Config.baseURL)!
   }
   
   var path: String {
      switch self {
      case .getMovieInfo:
         return "/searchDailyBoxOfficeList.json"
      }
   }
   
   var method: Moya.Method {
      switch self {
      case .getMovieInfo:
         return .get
      }
   }
   
   var task: Moya.Task {
      switch self {
      case .getMovieInfo(let date):
         let parameters: [String: Any] = [
            "key": Config.movieAPIKey,
            "targetDt": date
         ]
         return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
      }
   }
   
   var headers: [String : String]? {
      switch self {
      case .getMovieInfo:
         return ["Content-Type": "application/json"]
      }
   }
}
