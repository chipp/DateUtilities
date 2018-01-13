//
//  Created by Vladimir Burdukov on 8/26/16.
//

import Foundation

// MARK: - Int components

public extension Int {

  public var seconds: DateComponents {
    var components = DateComponents()
    components.second = self
    return components
  }

  public var minutes: DateComponents {
    var components = DateComponents()
    components.minute = self
    return components
  }

  public var hours: DateComponents {
    var components = DateComponents()
    components.hour = self
    return components
  }

  public var days: DateComponents {
    var components = DateComponents()
    components.day = self
    return components
  }

  public var weeks: DateComponents {
    var components = DateComponents()
    components.weekOfYear = self
    return components
  }

  public var months: DateComponents {
    var components = DateComponents()
    components.month = self
    return components
  }

  public var years: DateComponents {
    var components = DateComponents()
    components.year = self
    return components
  }

}

// MARK: - Date components

public enum Weekday: Int {
  case monday = 0, tuesday, wednesday, thursday, friday, saturday, sunday
}

public extension Date {

  public var second: Int {
    return Context.calendar.component(.second, from: self)
  }

  public var minute: Int {
    return Context.calendar.component(.minute, from: self)
  }

  public var hour: Int {
    return Context.calendar.component(.hour, from: self)
  }

  public var day: Int {
    return Context.calendar.component(.day, from: self)
  }

  public var month: Int {
    return Context.calendar.component(.month, from: self)
  }

  public var year: Int {
    return Context.calendar.component(.year, from: self)
  }

  public var weekday: Weekday {
    guard let weekday = Weekday(rawValue: (Context.calendar.component(.weekday, from: self) + 12) % 7) else {
      assertionFailure()
      return .monday
    }
    return weekday
  }

}

// MARK: - Operators

public func + (lhs: Date, rhs: DateComponents) -> Date {
  guard let result = Context.calendar.date(byAdding: rhs, to: lhs) else {
    assertionFailure("can't add components \(rhs) to date \(lhs)")
    return Date()
  }

  return result
}

public func - (lhs: Date, rhs: DateComponents) -> Date {
  return lhs + (-rhs)
}

fileprivate let components: [Calendar.Component] = [
  .nanosecond, .second, .minute, .hour, .day, .month, .year,
  .yearForWeekOfYear, .weekOfYear, .weekday, .quarter, .weekdayOrdinal, .weekOfMonth]

public prefix func - (comp: DateComponents) -> DateComponents {
  var other = comp
  for component in components {
    guard let value = comp.value(for: component), value != NSNotFound else { continue }
    other.setValue(-value, for: component)
  }

  return other
}

public func & (lhs: DateComponents, rhs: DateComponents) -> DateComponents {
  var new = lhs
  for component in components {
    guard let value1 = lhs.value(for: component), let value2 = rhs.value(for: component) else { continue }
    switch (value1, value2) {
    case (NSNotFound, NSNotFound):
      continue
    case (_, NSNotFound):
      continue
    case (NSNotFound, let value):
      new.setValue(value, for: component)
    case (let value1, let value2):
      new.setValue(value1 + value2, for: component)
    }
  }

  return new
}

// MARK: - Difference

public extension Date {

  public func difference(date: Date, unitFlags: Set<Calendar.Component>) -> DateComponents? {
    return Context.calendar.dateComponents(unitFlags, from: self, to: date)
  }

}
