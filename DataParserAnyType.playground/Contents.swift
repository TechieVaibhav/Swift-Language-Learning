import UIKit



// { status : "", message : "", data : ""}
// { status : "", message : "", data : []}
// { status : "", message : "", data : {}}
// { status : "", message : "", data : null}

struct DataParser : Decodable{
    let status : String
    let message : String
    var data : AnyTypeData
}

struct AnyTypeData: Decodable {
    var value: Any?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if container.decodeNil() {
            value = nil
        } else if let intValue = try? container.decode(Int.self) {
            value = intValue
        } else if let doubleValue = try? container.decode(Double.self) {
            value = doubleValue
        } else if let stringValue = try? container.decode(String.self) {
            value = stringValue
        } else if let boolValue = try? container.decode(Bool.self) {
            value = boolValue
        } else if let arrayValue = try? container.decode([AnyTypeData].self) {
            value = arrayValue.map { $0.value }
        } else if let dictionaryValue = try? container.decode([String: AnyTypeData].self) {
            var decodedDict = [String: Any]()
            for (key, anyTypeData) in dictionaryValue {
                decodedDict[key] = anyTypeData.value
            }
            value = decodedDict
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Data type not supported")
        }
    }
}


let json = """
{
  "status": "success",
  "message": "succeed",
  "data": null
}
""".data(using: .utf8)


let decoder = JSONDecoder()
let obj = try! decoder.decode(DataParser.self, from: json!)

print(obj.data.value)
