import Foundation
import RealmSwift

final class RealmDataModel: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var leftWord: String
    @Persisted var rightWord: String
}
