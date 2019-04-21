//
//  ThirdPage.swift
//  MedSafe
//
//  Created by Melody Lui on 2019-03-31.
//  Copyright © 2019 Melody Lui. All rights reserved.
//

import Foundation
import UIKit

public class ThirdPage : UIViewController {

    @IBOutlet weak var summaryTextView: UITextView!
    
    public var summary: String? = nil;
    
    public override func viewDidLoad() {
        super.viewDidLoad();
        summaryTextView.layer.borderWidth = 1
        summaryTextView.layer.cornerRadius = 8
        summaryTextView.layer.borderColor = Colors.color1.cgColor;
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.summaryTextView.text = summary;
        
        guard let summary = summary else {
            return;
        }
        
//        self.translateText(text_to_translate: summary, language: "fr");
    }
    func translateText(text_to_translate: String, language: String) {
        
        guard !text_to_translate.isEmpty else {
            return
        }
        
        let task = try? GoogleTranslate.sharedInstance.translateTextTask(text: text_to_translate, targetLanguage: language, completionHandler: { (translatedText: String?, error: Error?) in
            debugPrint(error?.localizedDescription)
            
            DispatchQueue.main.async {
//                print("Translated Text: ");
//                print(translatedText);
                self.summaryTextView.text = translatedText;
            }
            
        })
        
        task?.resume()
    }
    
}
