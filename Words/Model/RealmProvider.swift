import Foundation
import RealmSwift

protocol DataProviderProtocol {
    func addWords(leftWord: String, rightWord: String)
    func deleteWords(id: String)
    func editWords(_ words: Words)
    func getWord(id: String) -> Words
    func getWords() -> [Words]
}

struct DataProvider: DataProviderProtocol {
    func addWords(leftWord: String, rightWord: String) {
        let realm = try! Realm.init()
        
        let words = RealmData.init()
        let id = UUID().uuidString
        words.leftWord = leftWord
        words.rightWord = rightWord
        words.identifier = id
        
        try! realm.write {
            realm.add(words)
        }
    }
    
    func deleteWords(id: String) {
        let realm = try! Realm.init()
        
        guard let words = realm.object(ofType: RealmData.self, forPrimaryKey: id) else {
            print("REALM can't find words id \(id)")
            return
        }
        try! realm.write {
            realm.delete(words)
        }
    }
    
    func editWords(_ words: Words) {
        let realm = try! Realm.init()
        guard let realmWords = realm.object(ofType: RealmData.self, forPrimaryKey: words.identifier) else {
            fatalError("REALM can't find words id \(words.identifier)")
        }
        try! realm.write {
            realmWords.leftWord = words.leftWord
            realmWords.rightWord = words.rightWord
        }
    }
    
    func getWord(id: String) -> Words {
        let realm = try! Realm.init()
        guard let realmWords = realm.object(ofType: RealmData.self, forPrimaryKey: id) else {
            fatalError("REALM can't find words id \(id)")
        }
        return realmWords.toWords()
    }
    
    func getWords() -> [Words] {
        let realm = try! Realm.init()
        let results = realm.objects(RealmData.self)
        return results.map { $0.toWords() }
    }
    
}
