extension UnsignedInteger {
  /// Returns whether or not a given bitMask is part of the caller
  public func containsMask(_ mask: Self) -> Bool {
    return (self & mask) == mask
  }

  /// A right bit shifter that is supported without the need for a concrete type.
  public func shiftRight(_ places: Int) -> Self {
    var temp = self
    for _ in (1...places) { temp /= 2 }
    return temp
  }

  /// A bit shifter that is supported without the need for a concrete type.
  public func shiftLeft(_ places: Int) -> Self {
    var temp = self
    for _ in (1...places) { temp *= 2 }
    return temp
  }
}

public func rotateLeft(_ value: UInt8, by: UInt8) -> UInt8 {
  return ((value << by) & 0xff) | (value >> (8 - by))
}


public func rotateLeft(_ value: UInt16, by: UInt16) -> UInt16 {
  return ((value << by) & 0xffff) | (value >> (16 - by))
}


public func rotateLeft(_ value: UInt32, by: UInt32) -> UInt32 {
  return ((value << by) & 0xffffffff) | (value >> (32 - by))
}


public func rotateLeft(_ value: UInt64, by: UInt64) -> UInt64 {
  return (value << by) | (value >> (64 - by))
}


public func rotateRight(_ value: UInt8, by: UInt8) -> UInt8 {
  return (value >> by) | (value << (8 - by))
}

public func rotateRight(_ value: UInt16, by: UInt16) -> UInt16 {
  return (value >> by) | (value << (16 - by))
}


public func rotateRight(_ value: UInt32, by: UInt32) -> UInt32 {
  return (value >> by) | (value << (32 - by))
}


public func rotateRight(_ value: UInt64, by: UInt64) -> UInt64 {
  return ((value >> by) | (value << (64 - by)))
}


public func reversed(_ uint8: UInt8) -> UInt8 {
  var v = uint8
  v = (v & 0xf0) >> 4 | (v & 0x0f) << 4
  v = (v & 0xcc) >> 2 | (v & 0x33) << 2
  v = (v & 0xaa) >> 1 | (v & 0x55) << 1
  return v
}


public func reversed(_ uint32: UInt32) -> UInt32 {
  var v = uint32
  v = ((v >> 1) & 0x55555555) | ((v & 0x55555555) << 1)
  v = ((v >> 2) & 0x33333333) | ((v & 0x33333333) << 2)
  v = ((v >> 4) & 0x0f0f0f0f) | ((v & 0x0f0f0f0f) << 4)
  v = ((v >> 8) & 0x00ff00ff) | ((v & 0x00ff00ff) << 8)
  v = ((v >> 16) & 0xffff) | ((v & 0xffff) << 16)
  return v
}

public func xor<T, V>(_ left: T, _ right: V) -> Bytes where
  T: RandomAccessCollection,
  V: RandomAccessCollection,
  T.Element == UInt8,
  T.Index == Int,
  V.Element == UInt8,
  V.Index == Int {
  let length = Swift.min(left.count, right.count)

  let buf = UnsafeMutablePointer<UInt8>.allocate(capacity: length)
  buf.initialize(repeating: 0, count: length)
  defer {
    buf.deinitialize(count: length)
    buf.deallocate()
  }

  // xor
  for i in 0..<length {
    buf[i] = left[left.startIndex.advanced(by: i)] ^ right[right.startIndex.advanced(by: i)]
  }

  return Array(UnsafeBufferPointer(start: buf, count: length))
}

///  ISO/IEC 9797-1 Padding method 2.
///  Add a single bit with value 1 to the end of the data.
///  If necessary add bits with value 0 to the end of the data until the padded data is a multiple of blockSize.
///  - parameters:
///  - blockSize: Padding size in bytes.
///  - allowance: Excluded trailing number of bytes.

public func bitPadding(_ bytes: Bytes, blockSize: Int, allowance: Int = 0) -> Bytes {
  let msgLength = bytes.count
  // Step 1. Append Padding Bits
  // append one bit (UInt8 with one bit) to message
  let bytes = bytes + [0x80]

  // Step 2. append "0" bit until message length in bits ≡ 448 (mod 512)
  let max = blockSize - allowance // 448, 986
  if msgLength % blockSize < max { // 448
    return bytes + Bytes(repeating: 0, count: max - 1 - (msgLength % blockSize))
  } else {
    return bytes + Bytes(repeating: 0, count: blockSize + max - 1 - (msgLength % blockSize))
  }
}