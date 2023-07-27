import Foundation

struct Root : Codable{
    var products : [Product]
}

struct Product : Codable, Identifiable{
    var id : Int
    var title : String
    var description : String
    var price : Int
//    var discountPercentage : Double
//    var stock : Int
//    var rating : Double
//    var brand : String
//    var category : String
    var thumbnail : String
}
