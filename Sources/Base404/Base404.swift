import Foundation

// 定义base404字符集：404个唯一汉字
// IMPORTANT: 替换此处为你实际的404个汉字！
// 示例：使用Unicode CJK Unified Ideographs区块（U+4E00起始）
// 注意：U+4E00 + 403 = U+4F93（在有效汉字范围内），但实际应确保所有字符有效且唯一
public let base404Chars: [Character] = "啊爱安昂奥八白班帮包杯本蹦比边标别宾冰波不擦菜餐仓草册岑层查柴产常超车陈成吃冲抽出欻揣穿窗吹春戳词从凑粗窜催村错大代单当刀的得灯地嗲点调叠定丢东都读端对顿多鹅诶恩欸儿发反方飞分风佛否夫嘎该干刚高哥给根更工狗古瓜乖关光归滚国哈海汉行河黑很哼红后湖花坏欢黄回昏火鸡家间江交姐金京窘九局卷决军卡开看康考可肯坑空口哭夸快宽狂亏昆阔拉来兰狼老嘞雷冷里俩连凉聊列林灵流龙楼路乱论罗驴略妈卖满忙毛么没门蒙米面秒灭民名谬摸谋木那奶南囔脑呢内嫩能你年娘鸟捏您宁牛农努暖诺女虐哦欧趴拍盘旁跑陪盆朋皮片漂撇拼平破剖普七掐前枪桥切亲青穷秋去全却群然让绕热人扔日容肉如软瑞润若撒赛三桑扫色森僧沙晒山上少舌谁身生十手书刷帅栓双水顺说四松搜苏算岁孙所他太谈糖桃特腾提天条铁听同头图团推吞托挖外万王为文翁我无西下先香小写心星雄休需宣学寻鸭眼羊腰也一音英哟用有鱼元月云杂在赞脏早则贼怎增扎摘展帐找这真正知中周朱抓拽专装追准桌字总走足钻最尊作".map { Character(String($0)) }

// 优化：创建字符到索引的字典，加速解码（可选，但推荐）
public let charToIndex: [Character: Int] = Dictionary(uniqueKeysWithValues: base404Chars.enumerated().map { ($1, $0) })

// Base404编码：Data -> String（汉字序列）
public func base404Encode(data: Data) -> String {
    var result = ""
    let bytes = Array(data)
    let length = bytes.count
    var i = 0
    let base = 404 // 字符集大小
    
    while i < length {
        if i + 3 <= length {
            // 处理3字节块
            let b1 = bytes[i]
            let b2 = bytes[i + 1]
            let b3 = bytes[i + 2]
            var n = UInt32(b1) << 16 | UInt32(b2) << 8 | UInt32(b3)
            
            // 将24位数字转换为3个0-403的索引（高位在前）
            let index0 = Int(n % UInt32(base))
            n /= UInt32(base)
            let index1 = Int(n % UInt32(base))
            n /= UInt32(base)
            let index2 = Int(n) // n < base
            
            result.append(base404Chars[index2])
            result.append(base404Chars[index1])
            result.append(base404Chars[index0])
            i += 3
        } else if i + 2 <= length {
            // 处理2字节块
            let b1 = bytes[i]
            let b2 = bytes[i + 1]
            var n = UInt16(b1) << 8 | UInt16(b2)
            
            // 将16位数字转换为2个索引
            let index0 = Int(n % UInt16(base))
            n /= UInt16(base)
            let index1 = Int(n) // n < base
            
            result.append(base404Chars[index1])
            result.append(base404Chars[index0])
            i += 2
        } else if i + 1 <= length {
            // 处理1字节块
            let b = bytes[i]
            let index = Int(b) // b < 256 < 404
            result.append(base404Chars[index])
            i += 1
        }
    }
    return result
}

// Base404解码：String（汉字序列）-> Data?
public func base404Decode(encoded: String) -> Data? {
    var data = Data()
    let chars = Array(encoded)
    let length = chars.count
    var i = 0
    let base = 404
    let base2 = base * base // 404^2 = 163,216
    
    while i < length {
        if i + 3 <= length {
            // 解码3个汉字块
            // 使用预计算字典加速（推荐）：let index2 = charToIndex[chars[i]], etc.
            guard let index2 = charToIndex[chars[i]],
                  let index1 = charToIndex[chars[i + 1]],
                  let index0 = charToIndex[chars[i + 2]] else {
                return nil // 无效字符
            }
            i += 3
            
            // 计算24位原始值
            let n = UInt32(index2) * UInt32(base2) + UInt32(index1) * UInt32(base) + UInt32(index0)
            guard n < 16_777_216 else { return nil } // 检查是否在3字节范围内
            
            // 拆分为3字节
            let b1 = UInt8(n >> 16)
            let b2 = UInt8((n >> 8) & 0xFF)
            let b3 = UInt8(n & 0xFF)
            data.append(contentsOf: [b1, b2, b3])
        } else if i + 2 <= length {
            // 解码2个汉字块
            guard let index1 = charToIndex[chars[i]],
                  let index0 = charToIndex[chars[i + 1]] else {
                return nil
            }
            i += 2
            
            // 计算16位原始值
            let n = UInt16(index1) * UInt16(base) + UInt16(index0)
            guard n <= 65_535 else { return nil } // 检查是否在2字节范围内
            
            // 拆分为2字节
            let b1 = UInt8(n >> 8)
            let b2 = UInt8(n & 0xFF)
            data.append(contentsOf: [b1, b2])
        } else if i + 1 <= length {
            // 解码1个汉字块
            guard let index = charToIndex[chars[i]] else {
                return nil
            }
            i += 1
            
            guard index < 256 else { return nil } // 单字节块索引必须<256
            data.append(UInt8(index))
        }
    }
    return data
}

// GPS坐标编码：将经纬度转换为Data再编码
public func base404EncodeGPS(latitude: Double, longitude: Double) -> String {
    // 将经纬度转换为字节数据
    let latData = withUnsafeBytes(of: latitude) { Data($0) }
    let lonData = withUnsafeBytes(of: longitude) { Data($0) }
    
    // 合并数据
    var coordinateData = Data()
    coordinateData.append(latData)
    coordinateData.append(lonData)
    
    // 编码
    return base404Encode(data: coordinateData)
}

// GPS坐标解码：将编码后的字符串解码为经纬度
public func base404DecodeGPS(encoded: String) -> (latitude: Double, longitude: Double)? {
    // 解码为数据
    guard let data = base404Decode(encoded: encoded), 
          data.count == 16 else { // 两个Double值应该是16字节
        return nil
    }
    
    // 分离经纬度数据
    let latData = data[0..<8]
    let lonData = data[8..<16]
    
    // 转换为Double
    let latitude = latData.withUnsafeBytes { $0.load(as: Double.self) }
    let longitude = lonData.withUnsafeBytes { $0.load(as: Double.self) }
    
    return (latitude, longitude)
}

// MARK: - Data Extensions

extension Data {
    /// 使用Base404字符集编码数据
    /// - Returns: Base404编码的字符串
    public func base404EncodedString() -> String {
        return base404Encode(data: self)
    }
    
    /// 解码Base404编码的字符串
    /// - Parameter string: Base404编码的字符串
    /// - Returns: 解码后的数据，如果解码失败则返回nil
    public func base404DecodedFrom(string: String) -> Data? {
        return base404Decode(encoded: string)
    }
}

// MARK: - String Extensions

extension String {
    /// 使用Base404字符集编码字符串
    /// - Returns: Base404编码的字符串，如果编码失败则返回nil
    public func base404EncodedString() -> String? {
        return self.data(using: .utf8)?.base404EncodedString()
    }
    
    /// 解码Base404编码的字符串
    /// - Returns: 解码后的字符串，如果解码失败则返回nil
    public func base404DecodedString() -> String? {
        guard let data = Data().base404DecodedFrom(string: self),
              let decodedString = String(data: data, encoding: .utf8) else {
            return nil
        }
        return decodedString
    }
    

    /// 解码Base404编码的GPS坐标字符串
    /// - Returns: 包含纬度和经度的元组，如果解码失败则返回nil
    public func base404DecodedGPS() -> (latitude: Double, longitude: Double)? {
        return base404DecodeGPS(encoded: self)
    }
}