//: Playground - noun: a place where people can play

import UIKit

// [Dictionary<String, Any>]
// --------------------------------------------
typealias ArrayType = [Dictionary<String, Any>]

extension Collection {
    
    func removeDuplicates(bykey: String) -> ArrayType? {
        
        var result = ArrayType()
        let array = self as? ArrayType
        
        if let array = array, array.count > 0 {
            for i in 0 ..< array.count {
                if let id = array[i][bykey] as? Int {
                    if i == 0 { result = ArrayType() }
                    let duplicated = result.filter({ $0[bykey] as? Int == id }).count > 0
                    if !duplicated { result.append(array[i]) }
                }else if let id = array[i][bykey] as? String {
                    if i == 0 { result = ArrayType() }
                    let duplicated = result.filter({ $0[bykey] as? String == id }).count > 0
                    if !duplicated { result.append(array[i]) }
                }else {
                    break
                }
            }
        }
        
        if result.count > 0 {
            return result
        }
        
        return nil
    }
}

let array: ArrayType = [
    ["id": 1, "name": "Nome 1", "age": 27],
    ["id": 4, "name": "Nome 2", "age": 20],
    ["id": 4, "name": "Nome 3", "age": 25],
    ["id": 4, "name": "Nome 4", "age": 325],
    ["id": 4, "name": "Nome 5", "age": 1025]
]

let unique = array.removeDuplicates(bykey: "id")

// [Int]
// --------------------------------------------
var numbers = [1,2,3,4,5,6,5,4,3,2,1,0]
numbers = Array(Set(numbers))

// [String]
// --------------------------------------------
var names = ["1", "2", "1", "3", "1", "4"]
names = Array(Set(names))
