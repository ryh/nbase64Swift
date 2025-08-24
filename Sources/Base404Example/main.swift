import Foundation
import Base404
import Base64Extension

// Base404 示例
print("=== Base404 示例 ===")
let testString = "Hello, Base404 with 汉字!"
let testData = testString.data(using: .utf8)!
print("原始数据 (hex): \(testData.map { String(format: "%02x", $0) }.joined())")

// 编码
let encoded = base404Encode(data: testData)
print("Base404编码结果: \(encoded)") // 输出404个汉字组成的字符串

// 解码
if let decodedData = base404Decode(encoded: encoded),
   let decodedString = String(data: decodedData, encoding: .utf8) {
    print("解码后字符串: \(decodedString)")
    assert(testData == decodedData, "编码/解码失败")
} else {
    print("解码失败")
}

print("")

// GPS坐标编码/解码示例
print("=== GPS坐标编码/解码示例 ===")
let latitude: Double = 39.9042
let longitude: Double = 116.4074
let encodedGPS = base404EncodeGPS(latitude: latitude, longitude: longitude)
print("GPS坐标编码结果: \(encodedGPS)")

if let decodedGPS = base404DecodeGPS(encoded: encodedGPS) {
    print("解码后GPS坐标: (\(decodedGPS.latitude), \(decodedGPS.longitude))")
    // 验证精度
    let latDiff = abs(decodedGPS.latitude - latitude)
    let lonDiff = abs(decodedGPS.longitude - longitude)
    print("精度误差: 纬度=\(latDiff), 经度=\(lonDiff)")
    assert(latDiff < 1e-10 && lonDiff < 1e-10, "GPS坐标编码/解码精度不足")
} else {
    print("GPS坐标解码失败")
}

print("")

// Base64Extension 示例
print("=== Base64Extension 示例 ===")

func testBase64Extensions() {
    // 测试预定义字符集
    let emojiEncoded = testData.base64EncodedString(with: .emoji)
    print("Emoji编码结果: \(emojiEncoded)")
    
    if let emojiDecoded = Data().base64DecodedFromCustomString(emojiEncoded, with: .emoji),
       let emojiDecodedString = String(data: emojiDecoded, encoding: .utf8) {
        print("Emoji解码结果: \(emojiDecodedString)")
        assert(testData == emojiDecoded, "Emoji编码/解码失败")
    } else {
        print("Emoji解码失败")
    }
    
    let chineseEncoded = testData.base64EncodedString(with: .chinese)
    print("Chinese编码结果: \(chineseEncoded)")
    
    if let chineseDecoded = Data().base64DecodedFromCustomString(chineseEncoded, with: .chinese),
       let chineseDecodedString = String(data: chineseDecoded, encoding: .utf8) {
        print("Chinese解码结果: \(chineseDecodedString)")
        assert(testData == chineseDecoded, "Chinese编码/解码失败")
    } else {
        print("Chinese解码失败")
    }
    
    // 测试自定义字符集
    let customCharset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+!"
    let customEncoded = testData.base64EncodedString(withCharset: customCharset)
    print("Custom charset编码结果: \(customEncoded)")
    
    if let customDecoded = Data().base64DecodedFromCustomString(customEncoded, withCharset: customCharset),
       let customDecodedString = String(data: customDecoded, encoding: .utf8) {
        print("Custom charset解码结果: \(customDecodedString)")
        assert(testData == customDecoded, "Custom charset编码/解码失败")
    } else {
        print("Custom charset解码失败")
    }
}

testBase64Extensions()

print("")

// Data 和 String 扩展示例
print("=== Data 和 String 扩展示例 ===")

// 使用Data扩展进行Base404编码
let dataEncoded = testData.base404EncodedString()
print("使用Data扩展编码: \(dataEncoded)")

// 使用Data扩展进行Base404解码
if let dataDecoded = Data().base404DecodedFrom(string: dataEncoded),
   let dataDecodedString = String(data: dataDecoded, encoding: .utf8) {
    print("使用Data扩展解码: \(dataDecodedString)")
    assert(testData == dataDecoded, "Data扩展编码/解码失败")
} else {
    print("Data扩展解码失败")
}

// 使用String扩展进行Base404编码
if let stringEncoded = testString.base404EncodedString() {
    print("使用String扩展编码: \(stringEncoded)")
    
    // 使用String扩展进行Base404解码
    if let stringDecoded = stringEncoded.base404DecodedString() {
        print("使用String扩展解码: \(stringDecoded)")
        assert(testString == stringDecoded, "String扩展编码/解码失败")
    } else {
        print("String扩展解码失败")
    }
} else {
    print("String扩展编码失败")
}
