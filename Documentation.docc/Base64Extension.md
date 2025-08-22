# ``Base64Extension``

Base64Extension provides a set of extensions to the `Data` and `String` types in Swift that allow encoding and decoding data using custom character sets for Base64 encoding.

## Overview

This extension allows you to encode and decode data using various character sets, including predefined ones like emoji, Chinese characters, URL-safe, bcrypt, and crypt variants, as well as custom character sets of your own design.

## Topics

### Character Set Enumeration

- ``Base64CharacterSet``

An enumeration of predefined character sets for Base64 encoding.

### Data Encoding Methods

Methods for encoding `Data` objects using various character sets.

- ``Data/base64EncodedString(with:)``
- ``Data/base64EncodedEmojiString()``
- ``Data/base64EncodedChineseString()``
- ``Data/base64EncodedURLSafeString()``
- ``Data/base64EncodedBcryptString()``
- ``Data/base64EncodedCryptString()``
- ``Data/base64EncodedEmojiString(withCharset:)``
- ``Data/base64EncodedChineseString(withCharset:)``
- ``Data/base64EncodedString(withCharset:)``

### Data Decoding Methods

Methods for decoding Base64 strings to `Data` objects using various character sets.

- ``Data/base64DecodedFromCustomString(_:with:)``
- ``Data/base64DecodedFromEmojiString(_:)``
- ``Data/base64DecodedFromChineseString(_:)``
- ``Data/base64DecodedFromURLSafeString(_:)``
- ``Data/base64DecodedFromBcryptString(_:)``
- ``Data/base64DecodedFromCryptString(_:)``
- ``Data/base64DecodedFromEmojiString(_:withCharset:)``
- ``Data/base64DecodedFromChineseString(_:withCharset:)``
- ``Data/base64DecodedFromCustomString(_:withCharset:)``

### String Encoding Methods

Methods for encoding `String` objects using various character sets.

- ``String/base64EncodedString(with:)``
- ``String/base64EncodedEmojiString()``
- ``String/base64EncodedChineseString()``
- ``String/base64EncodedURLSafeString()``
- ``String/base64EncodedBcryptString()``
- ``String/base64EncodedCryptString()``
- ``String/base64EncodedEmojiString(withCharset:)``
- ``String/base64EncodedChineseString(withCharset:)``
- ``String/base64EncodedString(withCharset:)``

### String Decoding Methods

Methods for decoding Base64 strings to `String` objects using various character sets.

- ``String/base64DecodedFromCustomString(_:with:)``
- ``String/base64DecodedFromEmojiString()``
- ``String/base64DecodedFromChineseString()``
- ``String/base64DecodedFromURLSafeString()``
- ``String/base64DecodedFromBcryptString()``
- ``String/base64DecodedFromCryptString()``
- ``String/base64DecodedFromEmojiString(withCharset:)``
- ``String/base64DecodedFromChineseString(withCharset:)``
- ``String/base64DecodedFromCustomString(_:withCharset:)``