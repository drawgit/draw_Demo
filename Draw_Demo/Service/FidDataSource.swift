//
//  FidDataSource.swift
//  Draw_Demo
//
//  Created by 이성근 on 04/05/2020.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import Foundation

class FidDataSource {
    static let shared = FidDataSource()

    private init(){

    }

    var fid : FidVO?

    let fidGroup = DispatchGroup()
    let fetchQueue = DispatchQueue(label: "fidCall" , attributes: .concurrent)

    func fetch(completion : @escaping ()->()) {
        fidGroup.enter()
        fetchQueue.async {
            self.fidListCall {
                self.fidGroup.leave()
            }
        }

        fidGroup.notify(queue: .main){
            completion()
        }
    }

    private func fidListCall(completion : @escaping ()->() ) {
        let urlStr = ""
        guard let url = URL(string: urlStr) else{return}

        let session = URLSession.shared

        let dataTask = session.dataTask(with: url) { (data, response, error) in
            defer{
                DispatchQueue.main.async {
                    completion()
                }
            }

            if let error = error {
                print("error -> \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else{return}

            guard (200..<400).contains(httpResponse.statusCode) else { return }

            guard let data = data else{return}

            do{
                let decoder = JSONDecoder()
                self.fid = try decoder.decode(FidVO.self, from: data)

            }catch{
                print(error)
            }
        }
        dataTask.resume()
    }

}
