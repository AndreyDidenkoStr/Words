import Foundation
import RealmSwift

final class RealmData: Object {
    @objc dynamic var identifier: String = ""
    @objc dynamic var leftWord: String = ""
    @objc dynamic var rightWord: String = ""
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
}

extension RealmData {
    func toWords() -> Words {
        return Words(
            identifier: identifier,
            leftWord: leftWord,
            rightWord: rightWord)
    }
}
