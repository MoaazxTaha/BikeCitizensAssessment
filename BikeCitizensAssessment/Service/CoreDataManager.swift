//
//  CoreDataManager.swift
//  BikeCitizensAssessment
//
//  Created by Moaaz Ahmed Fawzy Taha on 06/02/2022.
//

import UIKit
import CoreData

protocol CoreDataInterface {
    func retrieveAddresses(completion:@escaping (([Address]) -> Void))
    func insert(address: Address)
    func deleteSingleEntry(address:Address)
}

class CoreDataManager: NSObject {
    static let shared = CoreDataManager()
    private override init() {}
    
}

extension CoreDataManager: CoreDataInterface {
    
    func retrieveAddresses(completion:@escaping (([Address]) -> Void)) {
        DispatchQueue.main.async {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteCD")
                request.returnsObjectsAsFaults = false
                var retrievedFavourites: [Address] = []
                do {
                    let results = try context.fetch(request)
                    if !results.isEmpty {
                        for result in results as! [NSManagedObject] {
                            let address = Address()
                            address.id = result.value(forKey: "id") as? String ?? ""
                            address.lon = result.value(forKey: "lon") as? Double ?? 0.0
                            address.lat = result.value(forKey: "lat") as? Double ?? 0.0
                            address.iconUrl = result.value(forKey: "iconUrl") as? String ?? ""
                            address.name = result.value(forKey: "name") as? String ?? ""
                            address.summary = result.value(forKey: "summary") as? String  ?? ""
                            address.isFavourite = result.value(forKey: "isFavourite") as? Bool ?? false
                            retrievedFavourites.append(address)
                        }
                        completion(retrievedFavourites)
                    } else {
                        completion([])
                    }
                } catch {
                    print("Error retrieving: \(error)")
                    completion([])
                }
                
            }
        }
        
    }
    
    func insert(address: Address) {
        DispatchQueue.main.async {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                
                let newTask = NSEntityDescription.insertNewObject(forEntityName: "FavouriteCD", into: context)
                newTask.setValue(address.id, forKey: "id")
                newTask.setValue(address.lon, forKey: "lon")
                newTask.setValue(address.lat, forKey: "lat")
                newTask.setValue(address.name, forKey: "name")
                newTask.setValue(address.iconUrl, forKey: "iconUrl")
                newTask.setValue(address.summary, forKey: "summary")
                newTask.setValue(address.isFavourite, forKey: "isFavourite")
                
                do {
                    try context.save()
                    NotificationCenter.default.post(name: .updateDB, object: nil)
                    print("Saved Successfully to internal DB")
                } catch {
                    print("Error saving: \(error)")
                }
            }
        }
    }
    
    func deleteSingleEntry(address:Address) {
        DispatchQueue.main.async {
            if let dataAppDelegatde = UIApplication.shared.delegate as? AppDelegate {
                let context = dataAppDelegatde.persistentContainer.viewContext
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteCD")
                let predicate = NSPredicate(format: "id = %@",  address.id)
                fetchRequest.predicate = predicate
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
                do{
                    
                    try context.execute(deleteRequest)
                    try context.save()
                    NotificationCenter.default.post(name: .updateDB, object: nil)
                    
                }catch let error{
                    print("an error occured while fetch, error:\(error)")
                }
            }
        }
    }
    
}


