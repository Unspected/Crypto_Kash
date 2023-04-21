//
//  LocalFileManager.swift
//  CryptoKash
//
//  Created by Pavel Andreev on 4/20/23.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        // create folder
        createFolderNameIfNeeded(folderName: folderName)
        
        // create path for image
        guard let data = image.pngData(),
              let url = getURLFromImage(imageName: imageName, folderName: folderName)
                        else { return }
        // save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image. Imagename:\(imageName). \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        
        guard let url = getURLFromImage(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderNameIfNeeded(folderName: String) {
        
        guard let url = getURLForRolfer(folderName: folderName) else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error{
                print("Error creating directory. Folder name is \(folderName)  \(error)")
            }
        }
    }
    
    private func getURLForRolfer(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
            else { return nil }
        
        return url.appendingPathComponent(folderName)
        
    }
    
    private func getURLFromImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForRolfer(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
        
    }
}
