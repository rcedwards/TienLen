//
//  SequenceExtensions.swift
//  TienLen
//
//  Created by Robert Edwards on 9/8/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import Foundation

extension Sequence {
    public func apply(operation: (Iterator.Element) -> Void) {
        for value in self {
            operation(value)
        }
    }
}
