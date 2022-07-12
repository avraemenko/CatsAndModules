//
//  CatsAndModules_KaterynaAvramenkoUITests.swift
//  CatsAndModules_KaterynaAvramenkoUITests
//
//  Created by Kate Avramenko on 10.07.2022.
//

import XCTest

class CatsAndModules_KaterynaAvramenkoUITests: XCTestCase {
    
    func testBasic(){
//        let app = XCUIApplication()
//        setupSnapshot(app)
//        app.launch()
//        sleep(5)
//        snapshot("KaterynaAvramenko_MainScreen")
//        let _ = app.otherElements["mainTable"].tap()
//        sleep(5)
//        snapshot("KaterynaAvramenko_DetailsScreen")
        let app = XCUIApplication()
                setupSnapshot(app)
                app.launch()
                sleep(5)
                let table = app.scrollViews.element (boundBy: 0)
                let cell = table.children(matching: .other).element (boundBy: 0)
              
                
                snapshot ("KaterynaAvramenko_MainScreen")
                
                cell.tap()
                
                sleep(5)
                snapshot ("KaterynaAvramenko_DetailsScreen")
    }
    
}
