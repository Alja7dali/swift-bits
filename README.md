###### This is a modified forked repo of [Vapor-Bits](https://github.com/vapor-community/bits)
###### Why it been modified, because it serve a specific purpose `working with bytes only`. No need for the extra stuff that the original repo has, they can be in separate repo.

#### Example:

```swift
import Bits

let meaningOfLife: Double = -42.0

let bytes = meaningOfLife.makeBytes()

print(bytes) // [0, 0, 0, 0, 0, 0, 69, 192]

do {
  let float = try Float(bytes)
} catch {
  print(error) // BytesConversionError.invalidConversion(to: Swift.Float)
}

print(Bytes(-42.0 as Float)) // [0, 0, 40, 194]

if let double = try? Double(bytes) {
  print(double) // -42.0
}
```

#### Importing Bits:

To include `Bits` in your project, you need to add the following to the `dependencies` attribute defined in your `Package.swift` file.
```swift
dependencies: [
  .package(url: "https://github.com/alja7dali/swift-bits.git", from: "1.0.0")
]
```