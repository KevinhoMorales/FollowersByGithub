//
//  FollowersApi.swift
//  FollowersByGithub
//
//  Created by Kevinho Morales on 5/1/22.
//

import Foundation

class FollowersApi {
    
    fileprivate var url: String!
    fileprivate var followersArray = [Followers]()
    
    static let shared: FollowersApi = {
        return FollowersApi()
    }()
    
    internal func getFollowersByUser(user: User, completion: @escaping([Followers]) -> ()) {
        let session = URLSession.shared
        url = "https://api.github.com/users/\(user.username!)/followers"
        let urlRequest = NSMutableURLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: urlRequest as URLRequest) { [self] (data, response, error) -> Void in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    followersArray = try decoder.decode([Followers].self, from: data!)
                } catch {
                    print("Not parse object -> \(error.localizedDescription)")
                }
                completion(followersArray)
            }
        }
        task.resume()
    }
    
    internal func getFollowingByUser(user: User, completion: @escaping([Followers]) -> ()) {
        let session = URLSession.shared
        url = "https://api.github.com/users/\(user.username!)/following"
        let urlRequest = NSMutableURLRequest(url: URL(string: url)!)
        let task = session.dataTask(with: urlRequest as URLRequest) { [self] (data, response, error) -> Void in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    followersArray = try decoder.decode([Followers].self, from: data!)
                } catch {
                    print("Not parse object -> \(error.localizedDescription)")
                }
                completion(followersArray)
            }
        }
        task.resume()
    }
}
