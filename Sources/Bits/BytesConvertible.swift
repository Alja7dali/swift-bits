/// MARK: BytesConvertible

/// Used for objects that can be represented as Bytes
public protocol BytesRepresentable {
  func makeBytes() throws -> Bytes
}

/// Used for objects that can be initialized with Bytes
public protocol BytesInitializable {
  init(_ bytes: Bytes) throws
}

/// Used for objects that can be initialized with, and represented by, Bytes
public typealias BytesConvertible = BytesRepresentable & BytesInitializable

public enum BytesConversionError<T>: Error {
  case invalidConversion(to: T.Type)
}

public extension BytesInitializable {
  init<S: Sequence>(_ bytes: S) throws where S.Element == Byte {
    try self.init(Bytes(bytes))
  }
}


/// MARK: Bool

extension Bool: BytesConvertible {
  public func makeBytes() -> Bytes {
    return self ? [.one] : [.zero]
  }

  public init(_ bytes: Bytes) throws {
    guard let first = bytes.first
    else { throw BytesConversionError.invalidConversion(to: Bool.self) }
    self = first == .one
  }
}


/// MARK: Data

extension Data: BytesConvertible {
  public func makeBytes() -> Bytes {
    return Bytes(self)
  }
}


/// MARK: String

extension String: BytesConvertible {
  public func makeBytes() -> Bytes {
    return Bytes(utf8)
  }

  public init(_ bytes: Bytes) throws {
    guard let value = String(bytes: bytes, encoding: .utf8)
    else { throw BytesConversionError.invalidConversion(to: String.self) }
    self = value
  }
}


/// MARK: BinaryIntegers

extension Int:    BytesConvertible {}
extension Int8:   BytesConvertible {}
extension Int16:  BytesConvertible {}
extension Int32:  BytesConvertible {}
extension Int64:  BytesConvertible {}

extension UInt:   BytesConvertible {}
extension UInt8:  BytesConvertible {}
extension UInt16: BytesConvertible {}
extension UInt32: BytesConvertible {}
extension UInt64: BytesConvertible {}

extension BinaryInteger {
  public func makeBytes() -> Bytes {
    return Bytes(from: self)
  }

  public init(_ bytes: Bytes) throws {
    try self.init(bytes.load(as: Self.self))
  }
}


/// MARK: FloatingPoints

extension Float:  BytesConvertible {}
extension Double: BytesConvertible {}

extension BinaryFloatingPoint {
  public func makeBytes() -> Bytes {
    return Bytes(from: self)
  }

  public init(_ bytes: Bytes) throws {
    try self.init(bytes.load(as: Self.self))
  }
}


/// MARK: Conversion from N.Type to Bytes and vice versa

extension Bytes {
  fileprivate init<N: Numeric>(from value: N) {
    // precondition(
    //   MemoryLayout<N>.size >= MemoryLayout<Byte>.size,
    //   "The input memory size should be greater than the output memory size"
    // )

    var value = value

    self = withUnsafePointer(to: &value, {
      $0.withMemoryRebound(to: Byte.self, capacity: MemoryLayout<N>.size, {
        Array(
          UnsafeBufferPointer(
            start: $0,
            count: MemoryLayout<N>.size/MemoryLayout<Byte>.size
          )
        )
      })
    })
  }

  fileprivate func load<N: Numeric>(as: N.Type) throws -> N {
    let n = Data(self).withUnsafeBytes { $0.load(as: N.self) }
    guard self.count == MemoryLayout<N>.size
    else { throw BytesConversionError.invalidConversion(to: N.self) }
    return n
  }
}