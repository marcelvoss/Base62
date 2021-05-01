# Base62
[![CI](https://github.com/marcelvoss/Base62/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/marcelvoss/Base62/actions/workflows/ci.yml)

Base62 is a tiny package for [Base62](https://en.wikipedia.org/wiki/Base62) encoding/decoding values. It is tested, documented, easy-to-use and supports Apple Platforms, as well as Linux.

## Installation
Base62 is distributed using the Swift Package Manager. To install it into a project, add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/marcelvoss/Base62.git", from: "0.1.0")
    ],
    ...
)
```

Then import Base62 wherever you’d like to use it:

```swift
import Base62
```

## Usage
Using Base62 is incredibly easy, as it focusses on a single responsibility and does that nicely.

Base62 ships with a single object that provides encoding and decoding functionality.

```swift
let base62Encoded = Base62.encode(2021)
// 2021 == "wz"

let base62Decoded = Base62.decode("GitHub")
// "GitHub" == 38750631667
```

There are also extensions for `String` and `Int` available, if you prefer to use them rather than the `Base62` object directly.
