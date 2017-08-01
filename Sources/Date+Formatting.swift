//
//  Created by Vladimir Burdukov on 8/26/16.
//

import Foundation

public extension Locale {

  @nonobjc static let enUSPOSIX = Locale(identifier: "en_US_POSIX")

}

public extension TimeZone {

  @nonobjc static let UTC = TimeZone(abbreviation: "UTC")

}

public extension Date {

  public static func date(fromString str: String, dateFormatter formatter: DateFormatter, timezone: String? = nil) ->
    Date? {
      if let timezone = timezone {
        formatter.timeZone = TimeZone(abbreviation: timezone)
      }

      return formatter.date(from: str)
  }

  public static func date(fromString str: String, format: String, timezone: String? = nil, locale: Locale? = nil) ->
    Date? {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = format
      if let locale = locale {
        dateFormatter.locale = locale
      } else {
        dateFormatter.locale = Locale.enUSPOSIX
      }

      return date(fromString: str, dateFormatter: dateFormatter, timezone: timezone)
  }

  public func toString(formatter: DateFormatter) -> String {
    return formatter.string(from: self)
  }

  public func toString(format: String = "yyyy-MM-dd HH:mm:ss", locale: Locale? = nil) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.locale = locale != nil ? locale : Locale.enUSPOSIX
    return toString(formatter: formatter)
  }

}

public extension String {

  @available(*, unavailable, renamed: "toDate(dateFormatter:timeZone:)")
  public func toDate(dateFormatter formatter: DateFormatter, timezone: String? = nil) -> Date? {
    return nil
  }

  @available(*, unavailable, renamed: "toDate(format:timeZone:locale:)")
  public func toDate(format: String, timezone: String? = nil, locale: Locale? = nil) -> Date? {
    return nil
  }

  public func toDate(dateFormatter formatter: DateFormatter, timeZone: String? = nil) -> Date? {
    return Date.date(fromString: self, dateFormatter: formatter, timezone: timeZone)
  }

  public func toDate(format: String, timeZone: String? = nil, locale: Locale? = nil) -> Date? {
    return Date.date(fromString: self, format: format, timezone: timeZone, locale: locale)
  }

}
