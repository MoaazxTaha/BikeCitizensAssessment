//
//  LocationsListRepository.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 03/02/2022.
//

import Foundation

protocol NetworkLayerInterface {
    func fetch<T: Decodable>(api:API, model:T.Type, compilation: @escaping (T?)->Void)
}

class NetworkLayer {
    static let shared = NetworkLayer()
    private init() { }
}

extension NetworkLayer:NetworkLayerInterface {
    
    func fetch<T: Decodable>(api:API, model:T.Type, compilation: @escaping (T?)->Void) {
        
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: api.request) { [weak self] data, URLResponse, Error in
            guard let self = self else {return}
            
            if let Error = Error {
                print (Error.localizedDescription)
            }
            if let data = data {
                let dataModel = self.decodeJson(Data: data, model:model)
                compilation(dataModel)
            }
        }
        task.resume()
    }
    
}

//MARK: - decoding jason data from api

extension NetworkLayer {
    
    private func decodeJson<T: Decodable>(Data:Data, model:T.Type)-> T? {
        
        let decoder = JSONDecoder()
        
        do {
            let dataDecoded = try decoder.decode(model, from: Data)
            return dataDecoded
            
        } catch let error {
            print(String(describing: error))
            return nil
        }
    }
}

