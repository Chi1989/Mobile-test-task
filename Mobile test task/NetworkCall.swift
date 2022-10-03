//
//  NetworkCall.swift
//  Mobile test task
//
//  Created by Mac on 30/09/2022.
//

import Foundation

//MARK: - API CALL
class ApiCall {
    static let shared = ApiCall()
    let session  = URLSession.shared
    public init() {}
    var dataRoutine = [Result]()
    
    func getData(completed: @escaping (Welcome) -> ()) {
        
        let url = URL(string: "https://randomuser.me/api/?results=2")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("\(error!)")
            } else if data != nil {
                do {
                    let result = try JSONDecoder().decode(Welcome.self, from: data!)
                    self.dataRoutine = result.results
                    DispatchQueue.main.async {
                        completed(result)
                        //print(self.dataRoutine.count)
                    }
                }
                catch {
                    print("\(error)")
                }
            }
        }
        task.resume()
    }
}
