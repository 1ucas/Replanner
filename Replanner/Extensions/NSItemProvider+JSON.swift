//
//  NSItemProvider+JSON.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import Foundation

//@objc protocol NSItemProviderJSON: NSItemProviderReading, NSItemProviderWriting {
//    static var typeIdentifier: String { get }
//}
//
//extension NSItemProviderJSON where Self: Decodable {
//    
//    static var readableTypeIdentifiersForItemProvider: [String] {
//        [typeIdentifier]
//    }
//    
//    static func object(withItemProviderData data: Data, typeIdentifier: String) throws -> Self {
//        try JSONDecoder().decode(Self.self, from: data)
//    }
//}
//
//extension NSItemProviderJSON where Self: AnyObject, Encodable {
//    
//    static var writableTypeIdentifiersForItemProvider: [String] {
//        [typeIdentifier]
//    }
//    
//    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
//        do {
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            completionHandler(try encoder.encode(self), nil)
//        } catch {
//            completionHandler(nil, error)
//        }
//        return nil
//    }
//}
