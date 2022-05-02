import Foundation
import RealmSwift

protocol RealmDataProviderProtocol {
    
    func addDataObject(leftWord: String, rightWord: String)
    func deleteObject(id: String)
    func obtainResults() -> [RealmDataModel]
    func updateObject(id: String, leftWord: String, rightWord: String)
}

struct RealmDataProvider: RealmDataProviderProtocol {
    
    func addDataObject(leftWord: String, rightWord: String) {
        
        let realm = try! Realm(configuration: .defaultConfiguration)
        
        let object = RealmDataModel.init()
        object.leftWord = leftWord
        object.rightWord = rightWord
        object._id = UUID().uuidString
        try! realm.write {
            realm.add(object)
        }
    }
    
    func deleteObject(id: String) {
        
        let realm = try! Realm(configuration: .defaultConfiguration)
        
        guard let object = realm.object(ofType: RealmDataModel.self, forPrimaryKey: id) else {
            print("Realm can't finde object id = \(id)")
            return
        }
        try! realm.write({
            realm.delete(object)
        })
    }
    
    func obtainResults() -> [RealmDataModel] {
        
        let realm = try! Realm(configuration: .defaultConfiguration)
        
        let objects = realm.objects(RealmDataModel.self)
        return Array(objects)
    }
    
    func updateObject(id: String, leftWord: String, rightWord: String) {
        
        let realm = try! Realm(configuration: .defaultConfiguration)
        
        guard let objectToUpdate = realm.object(ofType: RealmDataModel.self, forPrimaryKey: id) else {
            print("Realm can't find object id = \(id)")
            return
        }
        try! realm.write({
            objectToUpdate.leftWord = leftWord
            objectToUpdate.rightWord = rightWord
        })
    }
}
