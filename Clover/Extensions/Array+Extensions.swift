//
//  Array+Extensions.swift
//  Clover
//
//  Created by Faiz Mokhtar AD0502 on 08/11/2020.
//

import Foundation

extension Array {
    
    func item(at index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

