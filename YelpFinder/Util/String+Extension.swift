//
//  String+Extension.swift
//  YelpFinder
//
//  Created by Ricardo Rodríguez on 3/04/25.
//
import Foundation

extension String {
    
    static func fromJson(filename: String, in bundle: Bundle = Bundle.main) -> String? {
        if let url = bundle.url(forResource: filename, withExtension: "json") {
            do {
                return try String(contentsOf: url, encoding: .utf8)
            } catch {
                print("Error reading JSON file: \(error)")
            }
        } else {
            print("File not found")
        }
        return nil
    }
    
}
