//
//  DatabaseHelper.swift
//  TravelBookApp
//
//  Created by Zeynep Sinoğlu on 4.06.2024.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper {
    static let sharedInstance = DatabaseHelper()
    
    // SAVE
    
    func save(title: String, shortdescription: String, image: Data) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let imageInstance = ImageEntity(context: managedContext)
        imageInstance.image = image
        imageInstance.title = title
        imageInstance.shortdescription = shortdescription
        
        do {
            try managedContext.save()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    // Fetch işlemi
    
    func fetchImage() -> [ImageEntity] {
        var fetchImage = [ImageEntity]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return fetchImage }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageEntity")
        
        do {
            fetchImage = try managedContext.fetch(fetchRequest) as! [ImageEntity]
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return fetchImage
    }
    
    // Delete
    func deleteData(title: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageEntity")
        fetchRequest.predicate = NSPredicate(format: "title = %@", title)
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            if let objectToDelete = test.first as? NSManagedObject {
                managedContext.delete(objectToDelete)
                
                do {
                    try managedContext.save()
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
