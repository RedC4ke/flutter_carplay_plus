//
//  Extensions.swift
//  flutter_carplay_plus
//
//  Created by Michał Wyczarski on 15/04/2024.
//

import CarPlay
import Flutter
import Foundation

private let placeholderImage = UIImage(systemName: "questionmark")

extension UIImage {
    static func fromFCPImageData(_ data: FCPImageData?) -> UIImage? {
        guard let imageData = data else {
            return nil
        }

        switch imageData.source {
        case .network:
            return fromNetwork(url: imageData.path)
        case .asset:
            return fromAsset(path: imageData.path)
        case .file:
            return fromFile(path: imageData.path)
        case .system:
            return fromSystem(name: imageData.path)
        }
    }

    private static func fromNetwork(url: String) -> UIImage? {
        let utf8url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: utf8url)

        let data = try? Data(contentsOf: url!)
        guard let data = data else {
            return placeholderImage
        }
        return UIImage(data: data)
    }

    private static func fromAsset(path: String) -> UIImage? {
        let filename = (path as NSString).lastPathComponent
        let path = (path as NSString).deletingLastPathComponent

        for screenScale in stride(from: Int(UIScreen.main.scale), to: 1, by: -1) {
            let key = FlutterDartProject.lookupKey(forAsset: "\(path)/\(screenScale).0x/\(filename)")
            if let image = UIImage(named: key, in: Bundle.main, compatibleWith: nil) {
                return image
            }
        }

        let key = FlutterDartProject.lookupKey(forAsset: path)
        return UIImage(named: key, in: Bundle.main, compatibleWith: nil) ?? placeholderImage
    }

    private static func fromFile(path: String) -> UIImage? {
        guard FileManager.default.fileExists(atPath: path) else {
            return placeholderImage
        }

        return UIImage(contentsOfFile: path)
    }

    private static func fromSystem(name: String) -> UIImage? {
        return UIImage(systemName: name) ?? placeholderImage
    }
}

extension CPInterfaceController {
    var fcpTemplates: [FCPTemplate] {
        return templates.compactMap { template in
            guard let fcpTemplate = template as? FCPTemplate else {
                return nil
            }
            return fcpTemplate
        }
    }

    func setRootTemplate(_ rootTemplate: FCPTemplate) {
        setRootTemplate(rootTemplate, animated: true, completion: { _, _ in })
    }
}

extension FCPListItemAccessoryType {
    var cp: CPListItemAccessoryType {
        switch self {
        case .none: return .none
        case .cloud: return .cloud
        case .disclosureIndicator: return .disclosureIndicator
        }
    }
}

extension FCPListItemPlayingIndicatorLocation {
    var cp: CPListItemPlayingIndicatorLocation {
        switch self {
        case .leading: return .leading
        case .trailing: return .trailing
        }
    }
}

extension Array {
    func fcpComponents() -> [FCPComponent] {
        return (compactMap { element in
            guard let fcpComponent = element as? FCPComponent else {
                return nil
            }

            return fcpComponent.getComponentHierarchy()
        }).reduce([], +)
    }
}
