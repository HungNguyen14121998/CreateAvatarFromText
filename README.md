###  CreateAvatarFromText
---

**Introduce**

_Application create avatar from text or choose image_

**Develop**

_Swift 5.4_

_Xcode 12.4_

**Feature**

_Enter a full name in the TextField -> Enter the application will convert your initials into an image and display it on the screen_
_Click the Upload Image button to select your image, the application will display the selected image on the screen_

**Focus**

_Main handle function:_
```swift
func setAvatar(fullName: String, imageUpload: UIImage?) {
    ...
}
```

_Take all capital letters of fullName: A -> Z Ă Â Ê Ư Ô Ơ Đ based on the value ASCII charset:_
```swift
let capitalLetters = (fullName!.unicodeScalars.filter {
    let word = $0.value
    let result = (word > 64 && word < 91) || word == 202 || word == 212 || word == 416 || word == 431 || word == 258 || word == 194 || word == 272
    return result
})
```
_Take first capital letter and last capital letter of capitalLetters:_
```swift
if let firstCapitalLetter = capitalLetters.first, let lastCapitalLetter = capitalLetters.last {
    ...
} else {
    ...
}
```
_Identify abbreviations:_
```swift
    if capitalLetters.count == 1 {
        abbreviation = String(firstCapitalLetter)
    } else {
        abbreviation = String(firstCapitalLetter) + String(lastCapitalLetter)
    }
```
_Renderer image:_
```swift
let renderer = UIGraphicsImageRenderer(size: CGSize(width: 500, height: 500))
let image = renderer.image { ctx in
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    let font = UIFont(name: "HelveticaNeue-Medium", size: 250)!
    let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: paragraphStyle, NSAttributedString.Key.foregroundColor: darkerBackgroundColors[indexColor]]
    let string = abbreviation
    let cgRect = CGRect(x: 0, y: 100, width: 500, height: 500)
    string.draw(with: cgRect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
}
```

**References**

[SwiftyAvatar](https://github.com/dkalaitzidis/SwiftyAvatar)

**Contact**

_GitHub: HungNguyen14121998_

_Email: hhnguyenit@gmail.com_

