
import Foundation

struct ItemModel : Identifiable, Equatable, Codable{
    let id : String = UUID().uuidString
    let title : String
    let isCompleted : Bool
}
