//
//  color.swift
//  MedSafe
//
//  Created by Melody Lui on 2019-03-31.
//  Copyright © 2019 Melody Lui. All rights reserved.
//

import Foundation
import UIKit

public struct Colors {
    public static let color1 = UIColor(red: 0, green: 178/255, blue: 1, alpha: 1)
    public static let color2 = UIColor(red: 7/255, green: 122/255, blue: 171/255, alpha: 1)
    public static let color3 = UIColor(red: 42/255, green: 91/255, blue: 112/255, alpha: 1)
    public static let color4 = UIColor(red: 44/255, green: 58/255, blue: 63, alpha: 1)
}

public class SupportFunctions {
    public static func translate(text: String, language: String, completionHandler: @escaping (String?, Error?) -> Void) {
        let task = try? GoogleTranslate.sharedInstance.translateTextTask(text: text, targetLanguage: language, completionHandler: completionHandler);
        
        task?.resume();
    }
    
    public static func translate(textArr: [String], language: String, completionHandler: @escaping ([String]?, Error?) -> Void) {
        guard textArr.count > 0 else {
            completionHandler([], nil);
            return;
        }
        
        var count = 0;
        var arr: [String] = [];
        for i in 0..<textArr.count {
            translate(text: textArr[i], language: language) { (transText, error) in
                count += 1;
                
                guard error == nil, let transText = transText else {
                    if count == textArr.count {
                        completionHandler(arr, nil);
                    }
                    return;
                }
                
                DispatchQueue.main.async {
                    arr.append(transText);
                }
                
                if count == textArr.count {
                    DispatchQueue.main.async {
                        completionHandler(arr, nil);
                    }
                }
            }
        }
    }
}
