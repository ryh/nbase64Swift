# ``Base64Extension/Base64CharacterSet``

An enumeration of predefined character sets for Base64 encoding.

## Overview

The `Base64CharacterSet` enum provides a convenient way to specify commonly used character sets for Base64 encoding. Each case represents a specific character set with defined properties.

## Topics

### Cases

### Emoji Character Set

- ``emoji``

A character set that uses emoji characters for Base64 encoding. Contains 65 emoji characters with the hamburger emoji "🍔" used as the padding character.

### Chinese Character Set

- ``chinese``

A character set that uses Chinese characters for Base64 encoding. Contains 65 Chinese characters with the character "好" used as the padding character.

### URL-safe Character Set

- ``urlSafe``

A character set that is safe for use in URLs and filenames. Uses the standard Base64 alphabet but replaces '+' with '-' and '/' with '_'.

### Bcrypt Character Set

- ``bcrypt``

A character set used by the bcrypt hashing algorithm. Begins with "./" followed by the standard Base64 alphabet.

### Crypt Character Set

- ``crypt``

A character set used by the traditional crypt hashing algorithm. Begins with "./" followed by digits, uppercase letters, and lowercase letters.

### Properties

- ``charset``