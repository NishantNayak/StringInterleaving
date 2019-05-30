import UIKit
import Foundation

//String interleaving

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

func isInterleavedString(s1: String, s2: String, resultString: String) -> Bool{
    var resultArray = [[Int]]()
    for i in 0...s1.count{
        var rowArray = [Int]()
        for j in 0...s2.count{
            if (i == 0 && j == 0){
                rowArray.append(1)
            }
            else if (i == 0){
                if (s2[j-1] == resultString[j-1]){
                    rowArray.append(rowArray[j-1])
                }
                else{
                    rowArray.append(0)
                }
            }
            else if (j == 0){
                if (s1[i-1] == resultString[i-1]){
                    rowArray.append(resultArray[i-1][j])
                }
                else{
                    rowArray.append(0)
                }
            }
            else if (s1[i-1] == resultString[i+j-1] || s2[j-1] == resultString[i+j-1]){
                if (s1[i-1] == resultString[i+j-1]){
                    rowArray.append(resultArray[i-1][j])
                }
                else if (s2[j-1] == resultString[i+j-1]){
                    rowArray.append(rowArray[j-1])
                }
                else{
                    rowArray.append(0)
                }
            }
            else{
                rowArray.append(0)
            }
        }
        resultArray.append(rowArray)
        print(resultArray)
    }
    if (resultArray.last?.last == 1){
        return true
    }
    return false
}


let s1 = "ABC"
let s2 = "XYZ"
let s3 = "AXBYZC"
let result = isInterleavedString(s1: s1, s2: s2, resultString: s3)
print(result)
