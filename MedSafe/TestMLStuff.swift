//
//  TestMLStuff.swift
//  MedSafe
//
//  Created by Melody Lui on 2019-03-30.
//  Copyright © 2019 Melody Lui. All rights reserved.
//

import Foundation
import NaturalLanguage

public struct TestML{
    public static func summarize(sen_list: [String], completion: @escaping ([String: [String]]?, Error?) -> Void) {
        var prescriptions = [String]()
        var conditions = [String]()
        var management = [String]()
        var referrals = [String]()
        var tests = [String]()

        do {
            let textPredictor = try NLModel(mlModel: textClassifier().model)
            print("test");
            for i in 0..<sen_list.count{
                if(textPredictor.predictedLabel(for: sen_list[i])=="prescription"){
                    prescriptions.append(String(sen_list[i]))
                }
                else if(textPredictor.predictedLabel(for: sen_list[i])=="conditions"){
                    conditions.append(String(sen_list[i]))
                }
                else if(textPredictor.predictedLabel(for: sen_list[i])=="management"){
                    management.append(String(sen_list[i]))
                }
                else if(textPredictor.predictedLabel(for: sen_list[i])=="referrals"){
                    referrals.append(String(sen_list[i]))
                }
                else if(textPredictor.predictedLabel(for: sen_list[i])=="tests"){
                    tests.append(String(sen_list[i]))
                }

            }
            
        } catch let error as NSError {
            print(error)
            completion(nil,error)
            return;
        }
        
        let finalDict = ["prescriptions": prescriptions, "conditions": conditions, "management": management, "referrals": referrals, "tests":tests]
        
        completion(finalDict,nil)
    }
}
