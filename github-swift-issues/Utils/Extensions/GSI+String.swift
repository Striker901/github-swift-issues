//
//  GSI+String.swift
//  github-swift-issues
//
//  Created by Vinícius D. Brandão on 26/07/21.
//

import Foundation

extension String {
    func formatDateFrom(_ inputFormat: String, to outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        let formattedDate = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = outputFormat
        dateFormatter.locale = Locale(identifier:  "pt_BR")
        
        guard let formattedDate = formattedDate else { return self }
        
        return dateFormatter.string(from: formattedDate)
    }
}

