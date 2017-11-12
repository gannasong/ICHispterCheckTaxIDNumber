//: Playground - noun: a place where people can play

import Foundation

var testTaxIDNumber = "16012473"

func checkTaxIDNumber(taxID: String) -> Bool {
  var total = 0
  var index = 0
  var isNumSeven: Bool = false

  for i in taxID {
    guard let num = Int(String(i)) else { return false }

    switch index {
    case 0, 2, 4, 7:
      total += verifyNumbers(num: num * 1)
    case 1, 3, 5:
      total += verifyNumbers(num: num * 2)
    case 6:
      if num == 7 {
        isNumSeven = true
      }
      total += verifyNumbers(num: num * 4)
    default:
      break
    }
    index += 1
  }

  if isNumSeven {
    return (total - 1) % 10 == 0 || total % 10 == 0
  } else {
    return total % 10 == 0
  }
}

func verifyNumbers(num: Int) -> Int {
  var total = Int()

  guard num >= 10 else { return num }

  for i in String(num) {
    if let strToNum = Int(String(i)) {
      total += strToNum
    }
  }

  guard total != 10 else { return 1 }
  return total
}

checkTaxIDNumber(taxID: testTaxIDNumber)








