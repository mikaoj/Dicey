# Dicey
Adjective

Unpredictable and potentially dangerous. *'democracy is a dicey business’'*
## What
Dicey is a string matching framework using [Sørensen–Dice coefficient](https://en.wikipedia.org/wiki/Sørensen–Dice_coefficient) algorithm. 

## How
```swift
import Dicey

"Healed".similarity(with: "Sealed") // About 80% similarity
"Web Database Applications".similarity(with: "Creating Database Web Applications with PHP and ASP") // 71%
"Web Database Applications".similarity(with: "Building Web Database Applications with Visual Studio 6") // 67%
```
## Who
Created by Joakim Gyllström, joakim@backslashed

Heavily inspired by this [blog post](http://www.catalysoft.com/articles/StrikeAMatch.html)

## License
Dicey is available under the MIT license. See the LICENSE file for more info.