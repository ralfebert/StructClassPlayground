import UIKit

// class: pass by reference

class TimerModel {
    var startTime: Date?
    var endTime: Date?

    init() {
        self.startTime = Date()
    }
}

let timer1 = TimerModel()
let timer2 = timer1

// struct: pass by value

struct MoneyAmount: CustomStringConvertible {
    var amount: Decimal
    var currency: String

    mutating func round(digits: Int = 2) {
        var result = self.amount
        NSDecimalRound(&result, &self.amount, digits, .bankers)
        self.amount = result
    }

    func rounded(digits: Int = 2) -> MoneyAmount {
        var newValue = self
        newValue.round(digits: digits)
        return newValue
    }

    var description: String {
        "\(self.amount) \(self.currency)"
    }
}

var amount1 = MoneyAmount(amount: 50.1234, currency: "€")
var amount2 = amount1

amount1.round()
amount2.rounded()

