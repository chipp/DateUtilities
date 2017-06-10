//
//  Created by Vladimir Burdukov on 8/26/16.
//

import Foundation

public func < (lhs: Date?, rhs: Date?) -> Bool {
  guard let lhs = lhs else { return true }
  guard let rhs = rhs else { return false }
  return lhs < rhs
}

public func < (lhs: Date, rhs: Date?) -> Bool {
  guard let rhs = rhs else { return false }
  return lhs < rhs
}

public func < (lhs: Date?, rhs: Date) -> Bool {
  guard let lhs = lhs else { return true }
  return lhs < rhs
}

public func > (lhs: Date?, rhs: Date?) -> Bool {
  guard let lhs = lhs else { return false }
  guard let rhs = rhs else { return true }
  return lhs > rhs
}

public func > (lhs: Date, rhs: Date?) -> Bool {
  guard let rhs = rhs else { return true }
  return lhs > rhs
}

public func > (lhs: Date?, rhs: Date) -> Bool {
  guard let lhs = lhs else { return false }
  return lhs > rhs
}
