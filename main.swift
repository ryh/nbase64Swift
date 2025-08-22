import Foundation

// 测试函数
func testBase64Extensions() {
    print("Testing Base64 Extensions with default and custom character sets")
    
    // 测试文本
    let testString = "Hello 世界! 🌍🚀"
    print("Original string: \(testString)")
    
    // 标准Base64编码
    let standardEncoded = testString.data(using: .utf8)?.base64EncodedString()
    print("Standard Base64: \(standardEncoded ?? "")")
    
    print("\n=== Testing Default Character Sets ===")
    
    // 使用默认字符集编码
    let emojiEncoded = testString.base64EncodedEmojiString()
    print("Default Emoji Base64: \(emojiEncoded ?? "")")
    
    let chineseEncoded = testString.base64EncodedChineseString()
    print("Default Chinese Base64: \(chineseEncoded ?? "")")
    
    let urlSafeEncoded = testString.base64EncodedURLSafeString()
    print("URL Safe Base64: \(urlSafeEncoded ?? "")")
    
    let bcryptEncoded = testString.base64EncodedBcryptString()
    print("Bcrypt Base64: \(bcryptEncoded ?? "")")
    
    let cryptEncoded = testString.base64EncodedCryptString()
    print("Crypt Base64: \(cryptEncoded ?? "")")
    
    // 使用默认字符集解码
    if let emojiDecoded = emojiEncoded?.base64DecodedFromEmojiString() {
        print("Default Emoji Decoded: \(emojiDecoded)")
    } else {
        print("Failed to decode default emoji string")
    }
    
    if let chineseDecoded = chineseEncoded?.base64DecodedFromChineseString() {
        print("Default Chinese Decoded: \(chineseDecoded)")
    } else {
        print("Failed to decode default chinese string")
    }
    
    if let urlSafeDecoded = urlSafeEncoded?.base64DecodedFromURLSafeString() {
        print("URL Safe Decoded: \(urlSafeDecoded)")
    } else {
        print("Failed to decode URL safe string")
    }
    
    if let bcryptDecoded = bcryptEncoded?.base64DecodedFromBcryptString() {
        print("Bcrypt Decoded: \(bcryptDecoded)")
    } else {
        print("Failed to decode bcrypt string")
    }
    
    if let cryptDecoded = cryptEncoded?.base64DecodedFromCryptString() {
        print("Crypt Decoded: \(cryptDecoded)")
    } else {
        print("Failed to decode crypt string")
    }
    
    print("\n=== Testing Enum-based Character Sets ===")
    
    // 使用枚举指定的字符集编码和解码
    let emojiEnumEncoded = testString.base64EncodedString(with: .emoji)
    print("Enum Emoji Base64: \(emojiEnumEncoded ?? "")")
    
    if let emojiEnumDecoded = emojiEnumEncoded?.base64DecodedFromCustomString(emojiEnumEncoded ?? "", with: .emoji) {
        print("Enum Emoji Decoded: \(emojiEnumDecoded)")
    }
    
    let chineseEnumEncoded = testString.base64EncodedString(with: .chinese)
    print("Enum Chinese Base64: \(chineseEnumEncoded ?? "")")
    
    if let chineseEnumDecoded = chineseEnumEncoded?.base64DecodedFromCustomString(chineseEnumEncoded ?? "", with: .chinese) {
        print("Enum Chinese Decoded: \(chineseEnumDecoded)")
    }
    
    let urlSafeEnumEncoded = testString.base64EncodedString(with: .urlSafe)
    print("Enum URL Safe Base64: \(urlSafeEnumEncoded ?? "")")
    
    if let urlSafeEnumDecoded = urlSafeEnumEncoded?.base64DecodedFromCustomString(urlSafeEnumEncoded ?? "", with: .urlSafe) {
        print("Enum URL Safe Decoded: \(urlSafeEnumDecoded)")
    }
    
    let bcryptEnumEncoded = testString.base64EncodedString(with: .bcrypt)
    print("Enum Bcrypt Base64: \(bcryptEnumEncoded ?? "")")
    
    if let bcryptEnumDecoded = bcryptEnumEncoded?.base64DecodedFromCustomString(bcryptEnumEncoded ?? "", with: .bcrypt) {
        print("Enum Bcrypt Decoded: \(bcryptEnumDecoded)")
    }
    
    let cryptEnumEncoded = testString.base64EncodedString(with: .crypt)
    print("Enum Crypt Base64: \(cryptEnumEncoded ?? "")")
    
    if let cryptEnumDecoded = cryptEnumEncoded?.base64DecodedFromCustomString(cryptEnumEncoded ?? "", with: .crypt) {
        print("Enum Crypt Decoded: \(cryptEnumDecoded)")
    }
    
    print("\n=== Testing Generic Custom Character Sets ===")
    
    // 使用通用自定义字符集方法
    let genericCustomCharset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+!@#$%^&*()_+-=[]{}|;':\",./<>?`~"
    
    let genericEncoded = testString.base64EncodedString(withCharset: genericCustomCharset)
    print("Generic Custom Base64: \(genericEncoded ?? "")")
    
    if let genericDecoded = genericEncoded?.base64DecodedFromCustomString(genericEncoded ?? "", withCharset: genericCustomCharset) {
        print("Generic Custom Decoded: \(genericDecoded)")
    } else {
        print("Failed to decode generic custom string")
    }
    
    print("\n--- Testing with binary data ---")
    
    // 测试二进制数据
    let binaryData = Data([0x00, 0x01, 0x02, 0x03, 0xFF, 0xFE, 0xFD])
    print("Binary data: \(binaryData.map { String(format: "%02X", $0) }.joined(separator: " "))")
    
    // 使用默认字符集编码二进制数据
    let binaryEmojiEncoded = binaryData.base64EncodedEmojiString()
    print("Binary Default Emoji Base64: \(binaryEmojiEncoded)")
    
    let binaryChineseEncoded = binaryData.base64EncodedChineseString()
    print("Binary Default Chinese Base64: \(binaryChineseEncoded)")
    
    // 使用默认字符集解码二进制数据
    if let binaryEmojiDecoded = Data().base64DecodedFromEmojiString(binaryEmojiEncoded) {
        print("Binary Default Emoji Decoded: \(binaryEmojiDecoded.map { String(format: "%02X", $0) }.joined(separator: " "))")
        print("Default Emoji decoding successful: \(binaryData == binaryEmojiDecoded)")
    }
    
    if let binaryChineseDecoded = Data().base64DecodedFromChineseString(binaryChineseEncoded) {
        print("Binary Default Chinese Decoded: \(binaryChineseDecoded.map { String(format: "%02X", $0) }.joined(separator: " "))")
        print("Default Chinese decoding successful: \(binaryData == binaryChineseDecoded)")
    }
    
    print("\n--- Testing with custom charset (more than 65 chars) ---")
    
    // 测试超过65个字符的字符集
    let extendedCharset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/!@#$%^&*()_+-=[]{}|;':\",./<>?`~"
    let extendedEncoded = testString.base64EncodedString(withCharset: extendedCharset)
    print("Extended charset Base64: \(extendedEncoded ?? "")")
    
    if let extendedDecoded = testString.base64DecodedFromCustomString(extendedEncoded ?? "", withCharset: extendedCharset) {
        print("Extended charset Decoded: \(extendedDecoded)")
    }
    
    print("\n--- Testing with exactly 64 chars (no padding) ---")
    
    // 测试正好64个字符的字符集（无填充字符）
    let sixtyFourCharset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+*"
    let shortData = "Hi"
    let shortEncoded = shortData.data(using: .utf8)?.base64EncodedString(withCharset: sixtyFourCharset)
    print("64-char charset Base64: \(shortEncoded ?? "")")
    
    if let shortDecoded = shortData.base64DecodedFromCustomString(shortEncoded ?? "", withCharset: sixtyFourCharset) {
        print("64-char charset Decoded: \(shortDecoded)")
    }
}

// 程序入口点
testBase64Extensions()