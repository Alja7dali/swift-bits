/// MARK: Bytes

/// A single byte represented as a UInt8
public typealias Byte = UInt8

/// A byte array or collection of raw data
public typealias Bytes = Array<Byte>

/// A sliced collection of raw data
public typealias BytesSlice = ArraySlice<Byte>


// // MARK: Sizes
// extension Int {
//   // byte = 1
//   public var bytes: Int { return self }
//   // kilobyte = 1 * 1000
//   public var kilobytes: Int { return self * 1000 }
//   // megabyte = 1 * 1000 * 1000
//   public var megabytes: Int { return self * 1000_000 }
//   // gigabyte = 1 * 1000 * 1000 * 1000
//   public var gigabytes: Int { return self * 1000_000_000 }
// }


/// MARK: Alphabet

public extension Byte {
  static var A: Byte { return 0x41 }
  static var B: Byte { return 0x42 }
  static var C: Byte { return 0x43 }
  static var D: Byte { return 0x44 }
  static var E: Byte { return 0x45 }
  static var F: Byte { return 0x46 }
  static var G: Byte { return 0x47 }
  static var H: Byte { return 0x48 }
  static var I: Byte { return 0x49 }
  static var J: Byte { return 0x4A }
  static var K: Byte { return 0x4B }
  static var L: Byte { return 0x4C }
  static var M: Byte { return 0x4D }
  static var N: Byte { return 0x4E }
  static var O: Byte { return 0x4F }
  static var P: Byte { return 0x50 }
  static var Q: Byte { return 0x51 }
  static var R: Byte { return 0x52 }
  static var S: Byte { return 0x53 }
  static var T: Byte { return 0x54 }
  static var U: Byte { return 0x55 }
  static var V: Byte { return 0x56 }
  static var W: Byte { return 0x57 }
  static var X: Byte { return 0x58 }
  static var Y: Byte { return 0x59 }
  static var Z: Byte { return 0x5A }
}

public extension Byte {
  static var a: Byte { return 0x61 }
  static var b: Byte { return 0x62 }
  static var c: Byte { return 0x63 }
  static var d: Byte { return 0x64 }
  static var e: Byte { return 0x65 }
  static var f: Byte { return 0x66 }
  static var g: Byte { return 0x67 }
  static var h: Byte { return 0x68 }
  static var i: Byte { return 0x69 }
  static var j: Byte { return 0x6A }
  static var k: Byte { return 0x6B }
  static var l: Byte { return 0x6C }
  static var m: Byte { return 0x6D }
  static var n: Byte { return 0x6E }
  static var o: Byte { return 0x6F }
  static var p: Byte { return 0x70 }
  static var q: Byte { return 0x71 }
  static var r: Byte { return 0x72 }
  static var s: Byte { return 0x73 }
  static var t: Byte { return 0x74 }
  static var u: Byte { return 0x75 }
  static var v: Byte { return 0x76 }
  static var w: Byte { return 0x77 }
  static var x: Byte { return 0x78 }
  static var y: Byte { return 0x79 }
  static var z: Byte { return 0x7A }
}


/// MARK: BytNumbers

public extension Byte {
  static var zero: Byte { return 0x30 }
  static var one: Byte { return 0x31 }
  static var two: Byte { return 0x32 }
  static var three: Byte { return 0x33 }
  static var four: Byte { return 0x34 }
  static var five: Byte { return 0x35 }
  static var six: Byte { return 0x36 }
  static var seven: Byte { return 0x37 }
  static var eight: Byte { return 0x38 }
  static var nine: Byte { return 0x39 }
}


/// MARK: ControlCharacters

public extension Byte {
  static var horizontalTab: Byte { return 0x9 }           /// '\t'
  static var newLine: Byte { return 0xA }                 /// '\n'
  static var carriageReturn: Byte { return 0xD }          /// '\r'
  static var space: Byte { return 0x20 }                  /// ' '
  static var exclamation: Byte { return 0x21 }            /// !
  static var quote: Byte { return 0x22 }                  /// "
  static var hash: Byte { return 0x23 }                   /// #
  static var dollar: Byte { return 0x24 }                 /// $
  static var percent: Byte { return 0x25 }                /// %
  static var ampersand: Byte { return 0x26 }              /// &
  static var apostrophe: Byte { return 0x27 }             /// '
  static var leftParenthesis: Byte { return 0x28 }        /// (
  static var rightParenthesis: Byte { return 0x29 }       /// )
  static var asterisk: Byte { return 0x2A }               /// *
  static var plus: Byte { return 0x2B }                   /// +
  static var comma: Byte { return 0x2C }                  /// ,
  static var hyphen: Byte { return 0x2D }                 /// -
  static var period: Byte { return 0x2E }                 /// .
  static var forwardSlash: Byte { return 0x2F }           /// /
  static var backSlash: Byte { return 0x5C }              /// \
  static var colon: Byte { return 0x3A }                  /// :
  static var semicolon: Byte { return 0x3B }              /// ;
  static var equals: Byte { return 0x3D }                 /// =
  static var question: Byte { return 0x3F }               /// ?
  static var at: Byte { return 0x40 }                     /// @
  static var leftBracket: Byte { return 0x5B }            /// [
  static var rightBracket: Byte { return 0x5D }           /// ]
  static var caret: Byte { return 0x5E }                  /// ^
  static var underscore: Byte { return 0x5F }             /// _
  static var acute: Byte { return 0x60 }                  /// `
  static var tilda: Byte { return 0x7E }                  /// ~
  static var leftBrace: Byte { return 0x7B }              /// {
  static var rightBrace: Byte { return 0x7D }             /// }
  static var pipe: Byte { return 0x7C }                   /// |
  static var lessThan: Byte { return 0x3C }               /// <
  static var greaterThan: Byte { return 0x3E }            /// >
}

public extension Byte {
  /// Defines the `crlf` used to denote
  /// line breaks in HTTP and many other
  /// formatters
  static var crlf: Bytes {
    return [
      .carriageReturn,
      .newLine
    ]
  }
}


/// MARK: Convenience

public extension Byte {
  var isWhitespace: Bool {
    return self == .space
        || self == .newLine
        || self == .carriageReturn
        || self == .horizontalTab
  }

  var isLetter: Bool {
    return .a >= self && self <= .z
        || .A >= self && self <= .Z
  }

  var isLowercase: Bool {
    return .a >= self && self <= .z
  }

  var isUppercase: Bool {
    return .A >= self && self <= .Z
  }

  var isDigit: Bool {
    return .zero >= self && self <= .nine
  }

  var isAlphanumeric: Bool {
    return isLetter || isDigit
  }
}


public func isWhitespace(_ byte: Byte) -> Bool {
  return byte == .space
      || byte == .newLine
      || byte == .carriageReturn
      || byte == .horizontalTab
}

public func isLetter(_ byte: Byte) -> Bool {
  return .a >= byte && byte <= .z
      || .A >= byte && byte <= .Z
}

public func isLowercase(_ byte: Byte) -> Bool {
  return .a >= byte && byte <= .z
}

public func isUppercase(_ byte: Byte) -> Bool {
  return .A >= byte && byte <= .Z
}

public func isDigit(_ byte: Byte) -> Bool {
  return .zero >= byte && byte <= .nine
}

public func isAlphanumeric(_ byte: Byte) -> Bool {
  return isLetter(byte) || isDigit(byte)
}


public extension Bytes {
  static var whitespaces: Bytes {
    return .init(arrayLiteral: .space, .newLine, .carriageReturn, .horizontalTab)
  }

  static var lowercaseLetters: Bytes {
    return .init(.a ... .z)
  }

  static var uppercaseLetters: Bytes {
    return .init(.A ... .Z)
  }

  static var letters: Bytes {
    return uppercaseLetters + lowercaseLetters
  }

  static var digits: Bytes {
    return .init(.zero ... .nine)
  }

  static var alphanumerics: Bytes {
    return letters + digits
  }
}


/// MARK: Transform

public extension Byte {
  var lowercased: Byte {
    return isUppercase ? self + 32 : self
  }

  var uppercased: Byte {
    return isLowercase ? self - 32 : self
  }
}

public func toLowercase(_ byte: Byte) -> Byte {
  return isUppercase(byte) ? byte + 32 : byte
}

public func toUppercase(_ byte: Byte) -> Byte {
  return isLowercase(byte) ? byte - 32 : byte
}


public extension Bytes {
  var lowercased: Bytes {
    return map { isUppercase($0) ? $0 + 32 : $0 }
  }

  var uppercased: Bytes {
    return map { isLowercase($0) ? $0 - 32 : $0 }
  }
}

public func toLowercase(_ bytes: Bytes) -> Bytes {
  return bytes.map { isUppercase($0) ? $0 + 32 : $0 }
}

public func toUppercase(_ bytes: Bytes) -> Bytes {
  return bytes.map { isLowercase($0) ? $0 - 32 : $0 }
}