//
//  FCPListSection.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 16/04/2024.
//

import CarPlay
import Foundation

class FCPListSection: CPListSection {}

extension FCPListSectionData {
    func unwrap() -> FCPListSection {
        return FCPListSection(items: <#T##[CPListItem]#>, header: <#T##String?#>, sectionIndexTitle: <#T##String?#>)
    }
}
