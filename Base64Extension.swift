import Foundation

/// An enumeration of predefined character sets for Base64 encoding.
///
/// Use these predefined character sets when encoding or decoding data with Base64.
/// Each case provides a specific character set with defined properties.
enum Base64CharacterSet {
    /// Emoji character set containing 65 emoji characters.
    ///
    /// The character set includes a variety of emoji characters, with the hamburger emoji "🍔"
    /// used as the padding character (the 65th character).
    case emoji
    
    /// Chinese character set containing 65 Chinese characters.
    ///
    /// The character set includes a variety of common Chinese characters, with the character "好"
    /// used as the padding character (the 65th character).
    case chinese
    
    /// URL-safe character set.
    ///
    /// This character set is safe for use in URLs and filenames. It uses the standard Base64
    /// alphabet but replaces '+' with '-' and '/' with '_'.
    case urlSafe
    
    /// Bcrypt character set.
    ///
    /// This character set is used by the bcrypt hashing algorithm. It begins with "./" followed
    /// by the standard Base64 alphabet.
    case bcrypt
    
    /// Crypt character set.
    ///
    /// This character set is used by the traditional crypt hashing algorithm. It begins with "./"
    /// followed by digits, uppercase letters, and lowercase letters.
    case crypt
    
    /// The string representation of the character set.
    ///
    /// This property returns the complete string of characters used for Base64 encoding,
    /// including the padding character if applicable.
    var charset: String {
        switch self {
        case .emoji:
            return "😊😃😄😁😆😅😂🤣😉😇😋😜😝😛🤑🤗🤔🤥😐😑😶😏😒😓😔😕🙃😲😟😦😧😨😩😰😱😳😵😡😠😢😭😤😥😪😫😬🙄😯🌍🌎🌏🌐✨🌟🌌🌠🌙🌚🌛🌜🌝🌞☀️🌭🍔"
        case .chinese:
            return "日月星云山水风雨雷电花草树木江河湖海田地天火金石岩沙土雪霜露雾虹头手足目耳口鼻心刀枪锅碗桌椅床柜走跑跳飛坐立行卧吃喝读写大小多少好"
        case .urlSafe:
            return "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
        case .bcrypt:
            return "./ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        case .crypt:
            return "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        }
    }
}

extension Data {
    // standard Base64 character set
    private static let standardChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    
    /// Encodes the data using a predefined character set.
    ///
    /// - Parameter characterSet: The predefined character set to use for encoding.
    /// - Returns: A Base64-encoded string using the specified character set.
    func base64EncodedString(with characterSet: Base64CharacterSet) -> String {
        return self.base64EncodedString(withCharset: characterSet.charset)
    }
    
    /// Decodes a Base64-encoded string using a predefined character set.
    ///
    /// - Parameters:
    ///   - customString: The Base64-encoded string to decode.
    ///   - characterSet: The predefined character set that was used for encoding.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromCustomString(_ customString: String, with characterSet: Base64CharacterSet) -> Data? {
        return self.base64DecodedFromCustomString(customString, withCharset: characterSet.charset)
    }
    
    /// Encodes the data using the default emoji character set.
    ///
    /// - Returns: A Base64-encoded string using the default emoji character set.
    func base64EncodedEmojiString() -> String {
        return self.base64EncodedString(withCharset: Base64CharacterSet.emoji.charset)
    }
    
    /// Encodes the data using the default Chinese character set.
    ///
    /// - Returns: A Base64-encoded string using the default Chinese character set.
    func base64EncodedChineseString() -> String {
        return self.base64EncodedString(withCharset: Base64CharacterSet.chinese.charset)
    }
    
    /// Encodes the data using the URL-safe character set.
    ///
    /// - Returns: A Base64-encoded string using the URL-safe character set.
    func base64EncodedURLSafeString() -> String {
        return self.base64EncodedString(withCharset: Base64CharacterSet.urlSafe.charset)
    }
    
    /// Encodes the data using the bcrypt character set.
    ///
    /// - Returns: A Base64-encoded string using the bcrypt character set.
    func base64EncodedBcryptString() -> String {
        return self.base64EncodedString(withCharset: Base64CharacterSet.bcrypt.charset)
    }
    
    /// Encodes the data using the crypt character set.
    ///
    /// - Returns: A Base64-encoded string using the crypt character set.
    func base64EncodedCryptString() -> String {
        return self.base64EncodedString(withCharset: Base64CharacterSet.crypt.charset)
    }
    
    /// Encodes the data using a custom emoji character set.
    ///
    /// - Parameter charset: The custom emoji character set to use for encoding.
    ///                      Must contain at least 64 characters.
    /// - Returns: A Base64-encoded string using the specified character set.
    func base64EncodedEmojiString(withCharset charset: String) -> String {
        return self.base64EncodedString(withCharset: charset)
    }
    
    /// Encodes the data using a custom Chinese character set.
    ///
    /// - Parameter charset: The custom Chinese character set to use for encoding.
    ///                      Must contain at least 64 characters.
    /// - Returns: A Base64-encoded string using the specified character set.
    func base64EncodedChineseString(withCharset charset: String) -> String {
        return self.base64EncodedString(withCharset: charset)
    }
    
    /// Decodes a Base64-encoded string using the default emoji character set.
    ///
    /// - Parameter emojiString: The Base64-encoded string to decode.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromEmojiString(_ emojiString: String) -> Data? {
        return self.base64DecodedFromCustomString(emojiString, withCharset: Base64CharacterSet.emoji.charset)
    }
    
    /// Decodes a Base64-encoded string using the default Chinese character set.
    ///
    /// - Parameter chineseString: The Base64-encoded string to decode.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromChineseString(_ chineseString: String) -> Data? {
        return self.base64DecodedFromCustomString(chineseString, withCharset: Base64CharacterSet.chinese.charset)
    }
    
    /// Decodes a Base64-encoded string using the URL-safe character set.
    ///
    /// - Parameter urlSafeString: The Base64-encoded string to decode.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromURLSafeString(_ urlSafeString: String) -> Data? {
        return self.base64DecodedFromCustomString(urlSafeString, withCharset: Base64CharacterSet.urlSafe.charset)
    }
    
    /// Decodes a Base64-encoded string using the bcrypt character set.
    ///
    /// - Parameter bcryptString: The Base64-encoded string to decode.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromBcryptString(_ bcryptString: String) -> Data? {
        return self.base64DecodedFromCustomString(bcryptString, withCharset: Base64CharacterSet.bcrypt.charset)
    }
    
    /// Decodes a Base64-encoded string using the crypt character set.
    ///
    /// - Parameter cryptString: The Base64-encoded string to decode.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromCryptString(_ cryptString: String) -> Data? {
        return self.base64DecodedFromCustomString(cryptString, withCharset: Base64CharacterSet.crypt.charset)
    }
    
    /// Decodes a Base64-encoded string using a custom emoji character set.
    ///
    /// - Parameters:
    ///   - emojiString: The Base64-encoded string to decode.
    ///   - charset: The custom emoji character set that was used for encoding.
    ///              Must contain at least 64 characters.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromEmojiString(_ emojiString: String, withCharset charset: String) -> Data? {
        return self.base64DecodedFromCustomString(emojiString, withCharset: charset)
    }
    
    /// Decodes a Base64-encoded string using a custom Chinese character set.
    ///
    /// - Parameters:
    ///   - chineseString: The Base64-encoded string to decode.
    ///   - charset: The custom Chinese character set that was used for encoding.
    ///              Must contain at least 64 characters.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromChineseString(_ chineseString: String, withCharset charset: String) -> Data? {
        return self.base64DecodedFromCustomString(chineseString, withCharset: charset)
    }
    
    /// Encodes the data using a custom character set.
    ///
    /// - Parameter charset: The custom character set to use for encoding.
    ///                      Must contain at least 64 characters. If 65 characters are provided,
    ///                      the 65th character is used as the padding character.
    /// - Returns: A Base64-encoded string using the specified character set.
    func base64EncodedString(withCharset charset: String) -> String {
        let standardEncoded = self.base64EncodedString()
        return Self.mapStandardToCustom(standardEncoded, charset: charset)
    }
    
    /// Decodes a Base64-encoded string using a custom character set.
    ///
    /// - Parameters:
    ///   - customString: The Base64-encoded string to decode.
    ///   - charset: The custom character set that was used for encoding.
    ///              Must contain at least 64 characters. If 65 characters were used for encoding,
    ///              the 65th character should be provided as part of the charset.
    /// - Returns: The decoded data, or `nil` if decoding failed.
    func base64DecodedFromCustomString(_ customString: String, withCharset charset: String) -> Data? {
        let standardEncoded = Self.mapCustomToStandard(customString, charset: charset)
        return Data(base64Encoded: standardEncoded)
    }
    
    /// 将标准Base64字符映射到自定义字符集
    private static func mapStandardToCustom(_ standardString: String, charset: String) -> String {
        let charsetArray = charset.map { String($0) }
        
        // 验证字符集长度
        guard charsetArray.count >= 64 else {
            fatalError("Charset must contain at least 64 characters")
        }
        
        // 前64个字符用于Base64编码
        let customChars = Array(charsetArray[0..<64])
        let standardCharsArray = standardChars.map { $0 }
        
        // 第65个字符（如果存在）用作填充字符
        let paddingChar = charsetArray.count > 64 ? charsetArray[64] : "="
        
        var result = ""
        
        for char in standardString {
            if let index = standardCharsArray.firstIndex(of: char) {
                // 映射到对应的自定义字符
                result += customChars[index]
            } else if char == "=" {
                // 使用指定的填充字符替换标准填充字符
                result += paddingChar
            } else {
                // 保持其他字符
                result += String(char)
            }
        }
        
        return result
    }
    
    /// 将自定义字符集映射回标准Base64字符
    private static func mapCustomToStandard(_ customString: String, charset: String) -> String {
        let charsetArray = charset.map { String($0) }
        
        // 验证字符集长度
        guard charsetArray.count >= 64 else {
            fatalError("Charset must contain at least 64 characters")
        }
        
        // 前64个字符用于Base64编码
        let customChars = Array(charsetArray[0..<64])
        let standardCharsArray = standardChars.map { $0 }
        
        // 第65个字符（如果存在）用作填充字符
        let paddingChar = charsetArray.count > 64 ? charsetArray[64] : "="
        
        var result = ""
        
        for char in customString {
            let charString = String(char)
            if let index = customChars.firstIndex(of: charString) {
                // 映射到对应的标准字符
                result += String(standardCharsArray[index])
            } else if charString == paddingChar {
                // 将自定义填充字符替换为标准填充字符
                result += "="
            } else {
                // 保持其他字符
                result += charString
            }
        }
        
        return result
    }
}

extension String {
    /// Encodes the string using a predefined character set.
    ///
    /// - Parameter characterSet: The predefined character set to use for encoding.
    /// - Returns: A Base64-encoded string using the specified character set, or `nil` if the string cannot be encoded.
    func base64EncodedString(with characterSet: Base64CharacterSet) -> String? {
        return self.data(using: .utf8)?.base64EncodedString(with: characterSet)
    }
    
    /// Decodes a Base64-encoded string using a predefined character set.
    ///
    /// - Parameters:
    ///   - customString: The Base64-encoded string to decode.
    ///   - characterSet: The predefined character set that was used for encoding.
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromCustomString(_ customString: String, with characterSet: Base64CharacterSet) -> String? {
        guard let data = Data().base64DecodedFromCustomString(customString, with: characterSet) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Encodes the string using the default emoji character set.
    ///
    /// - Returns: A Base64-encoded string using the default emoji character set, or `nil` if the string cannot be encoded.
    func base64EncodedEmojiString() -> String? {
        return self.data(using: .utf8)?.base64EncodedEmojiString()
    }
    
    /// Encodes the string using the default Chinese character set.
    ///
    /// - Returns: A Base64-encoded string using the default Chinese character set, or `nil` if the string cannot be encoded.
    func base64EncodedChineseString() -> String? {
        return self.data(using: .utf8)?.base64EncodedChineseString()
    }
    
    /// Encodes the string using the URL-safe character set.
    ///
    /// - Returns: A Base64-encoded string using the URL-safe character set, or `nil` if the string cannot be encoded.
    func base64EncodedURLSafeString() -> String? {
        return self.data(using: .utf8)?.base64EncodedURLSafeString()
    }
    
    /// Encodes the string using the bcrypt character set.
    ///
    /// - Returns: A Base64-encoded string using the bcrypt character set, or `nil` if the string cannot be encoded.
    func base64EncodedBcryptString() -> String? {
        return self.data(using: .utf8)?.base64EncodedBcryptString()
    }
    
    /// Encodes the string using the crypt character set.
    ///
    /// - Returns: A Base64-encoded string using the crypt character set, or `nil` if the string cannot be encoded.
    func base64EncodedCryptString() -> String? {
        return self.data(using: .utf8)?.base64EncodedCryptString()
    }
    
    /// Encodes the string using a custom emoji character set.
    ///
    /// - Parameter charset: The custom emoji character set to use for encoding.
    ///                      Must contain at least 64 characters.
    /// - Returns: A Base64-encoded string using the specified character set, or `nil` if the string cannot be encoded.
    func base64EncodedEmojiString(withCharset charset: String) -> String? {
        return self.data(using: .utf8)?.base64EncodedEmojiString(withCharset: charset)
    }
    
    /// Encodes the string using a custom Chinese character set.
    ///
    /// - Parameter charset: The custom Chinese character set to use for encoding.
    ///                      Must contain at least 64 characters.
    /// - Returns: A Base64-encoded string using the specified character set, or `nil` if the string cannot be encoded.
    func base64EncodedChineseString(withCharset charset: String) -> String? {
        return self.data(using: .utf8)?.base64EncodedChineseString(withCharset: charset)
    }
    
    /// Decodes a Base64-encoded string using the default emoji character set.
    ///
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromEmojiString() -> String? {
        guard let data = Data().base64DecodedFromEmojiString(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Decodes a Base64-encoded string using the default Chinese character set.
    ///
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromChineseString() -> String? {
        guard let data = Data().base64DecodedFromChineseString(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Decodes a Base64-encoded string using the URL-safe character set.
    ///
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromURLSafeString() -> String? {
        guard let data = Data().base64DecodedFromURLSafeString(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Decodes a Base64-encoded string using the bcrypt character set.
    ///
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromBcryptString() -> String? {
        guard let data = Data().base64DecodedFromBcryptString(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Decodes a Base64-encoded string using the crypt character set.
    ///
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromCryptString() -> String? {
        guard let data = Data().base64DecodedFromCryptString(self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Decodes a Base64-encoded string using a custom emoji character set.
    ///
    /// - Parameter charset: The custom emoji character set that was used for encoding.
    ///                      Must contain at least 64 characters.
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromEmojiString(withCharset charset: String) -> String? {
        guard let data = Data().base64DecodedFromEmojiString(self, withCharset: charset) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Decodes a Base64-encoded string using a custom Chinese character set.
    ///
    /// - Parameter charset: The custom Chinese character set that was used for encoding.
    ///                      Must contain at least 64 characters.
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromChineseString(withCharset charset: String) -> String? {
        guard let data = Data().base64DecodedFromChineseString(self, withCharset: charset) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    /// Encodes the string using a custom character set.
    ///
    /// - Parameter charset: The custom character set to use for encoding.
    ///                      Must contain at least 64 characters. If 65 characters are provided,
    ///                      the 65th character is used as the padding character.
    /// - Returns: A Base64-encoded string using the specified character set, or `nil` if the string cannot be encoded.
    func base64EncodedString(withCharset charset: String) -> String? {
        return self.data(using: .utf8)?.base64EncodedString(withCharset: charset)
    }
    
    /// Decodes a Base64-encoded string using a custom character set.
    ///
    /// - Parameters:
    ///   - customString: The Base64-encoded string to decode.
    ///   - charset: The custom character set that was used for encoding.
    ///              Must contain at least 64 characters. If 65 characters were used for encoding,
    ///              the 65th character should be provided as part of the charset.
    /// - Returns: The decoded string, or `nil` if decoding failed.
    func base64DecodedFromCustomString(_ customString: String, withCharset charset: String) -> String? {
        guard let data = Data().base64DecodedFromCustomString(customString, withCharset: charset) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}