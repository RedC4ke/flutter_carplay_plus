//
//  FCPNavigationStack.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 11/04/2024.
//

import Foundation
import CarPlay

class FCPInterfaceController: CPInterfaceController {
    private var fcpTemplates: [WrappedTemplateData] = []
    var fcpRootTemplate: WrappedTemplateData? {
        get {
            return fcpTemplates.first
        }
    }
    
    func setRootTemplate(to template: WrappedTemplateData) {
        fcpTemplates[0] = template
        
    }
}
