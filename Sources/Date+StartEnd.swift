//
//  Created by Vladimir Burdukov on 8/26/16.
//

import Foundation

public extension Date {

  public func start(of unit: Calendar.Component) -> Date {
    var date = Date()
    var interval: TimeInterval = 0
    guard Calendar.current.dateInterval(of: unit, start: &date, interval: &interval, for: self) else {
      assertionFailure()
      return date
    }

    return date
  }

  public func end(of unit: Calendar.Component) -> Date {
    var date = Date()
    var interval: TimeInterval = 0
    guard Calendar.current.dateInterval(of: unit, start: &date, interval: &interval, for: self) else {
      assertionFailure()
      return date
    }

    interval -= 0.001
    return date.addingTimeInterval(interval)
  }

}
