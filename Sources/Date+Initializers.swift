//
//  Created by Vladimir Burdukov on 8/26/16.
//

import Foundation

public extension Date {

  public init(year: Int, month: Int, day: Int = 1, hour: Int = 0, minute: Int = 0, second: Int = 0,
              nanosecond: Int = 0, `in` timeZone: TimeZone? = nil) {
    var components = DateComponents(calendar: Calendar.current)
    components.year = year
    components.month = month
    components.day = day
    components.hour = hour
    components.minute = minute
    components.second = second
    components.nanosecond = nanosecond
    components.timeZone = timeZone
    guard let result = Calendar.current.date(from: components) else {
      self.init(timeIntervalSinceReferenceDate: 0)
      return
    }
    self.init(timeIntervalSinceReferenceDate: result.timeIntervalSinceReferenceDate)
  }

  public static var yesterday: Date {
    return today - 1.days
  }

  public var yesterday: Date {
    return self - 1.days
  }

  public static var today: Date {
    return Date().start(of: .day)
  }

  public static var tomorrow: Date {
    return today + 1.days
  }

  public var tomorrow: Date {
    return self + 1.days
  }

  public var isInYesterday: Bool {
    return Calendar.current.isDateInYesterday(self)
  }

  public var isInToday: Bool {
    return Calendar.current.isDateInToday(self)
  }

  public var isInTomorrow: Bool {
    return Calendar.current.isDateInTomorrow(self)
  }

  public func isSameDay(as date: Date) -> Bool {
    return Calendar.current.isDate(self, inSameDayAs: date)
  }

}
