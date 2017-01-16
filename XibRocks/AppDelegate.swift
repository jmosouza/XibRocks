//
//  AppDelegate.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit
import Fakery
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let shouldCreateUser = false
    let shouldCreateQuestions = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Fakery
        let faker = Faker(locale: "pt-BR")
        
        // Firebase
        FIRApp.configure()
        FIRDatabase.database().persistenceEnabled = true
        let database = FIRDatabase.database().reference()

        // Main view
        let mainViewController = MainViewController()
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()

        // New user
        if shouldCreateUser {
            let languages = ["ruby" : true, "swift" : true]
            let user = database.child("users").childByAutoId()
            user.setValue(["username": "jmosouza"])
            user.child("languages").updateChildValues(languages, withCompletionBlock: { (error, child) in
                if error == nil {
                    print(child)
                }
            })
        }
        
        // Questions
        if shouldCreateQuestions {
            for _ in 0..<1000 {
                
                var options = [String]()
                for _ in 0..<4 {
                    options.append(faker.lorem.word())
                }
                
                let question = [
                    "question": faker.lorem.sentence(),
                    "answer": options[0],
                    "options": options
                ] as [String : Any]
                
                database.child("questions").childByAutoId().setValue(question)
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

