//
//  Loterias_Da_Sorte_iOSUITests.swift
//  Loterias-Da-Sorte-iOSUITests
//
//  Created by Gabriel Soria Souza on 19/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import XCTest

final class Loterias_Da_Sorte_iOSUITests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        
        let tablesQuery = XCUIApplication().tables
        snapshot("Home")
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Mega Sena"]/*[[".cells[\"Mega Sena\"].buttons[\"Mega Sena\"]",".buttons[\"Mega Sena\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("MegaSenaLoaded")
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Quina"]/*[[".cells[\"Quina\"].buttons[\"Quina\"]",".buttons[\"Quina\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Timemania"]/*[[".cells[\"Timemania\"].buttons[\"Timemania\"]",".buttons[\"Timemania\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("TimeManiaLoaded")
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Dupla Sena"]/*[[".cells[\"Dupla Sena\"].buttons[\"Dupla Sena\"]",".buttons[\"Dupla Sena\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Federal"]/*[[".cells[\"Federal\"].buttons[\"Federal\"]",".buttons[\"Federal\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let diaDeSorteButton = tablesQuery/*@START_MENU_TOKEN@*/.buttons["Dia de Sorte"]/*[[".cells[\"Dia de Sorte\"].buttons[\"Dia de Sorte\"]",".buttons[\"Dia de Sorte\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        diaDeSorteButton.swipeUp()
        snapshot("FederalLoaded")
        diaDeSorteButton.swipeDown()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Próximo"]/*[[".cells[\"Último, Último, Próximo, Próximo\"]",".segmentedControls.buttons[\"Próximo\"]",".buttons[\"Próximo\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("NextGamesLoaded")
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mega Sena"]/*[[".cells[\"Mega Sena, info.circle.fill\"].staticTexts[\"Mega Sena\"]",".staticTexts[\"Mega Sena\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Lotofácil"]/*[[".cells[\"Lotofácil, info.circle.fill\"].staticTexts[\"Lotofácil\"]",".staticTexts[\"Lotofácil\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("NextGamesLoaded2")
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Último"]/*[[".cells[\"Último, Último, Próximo, Próximo\"]",".segmentedControls.buttons[\"Último\"]",".buttons[\"Último\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func testLaunchPerformance() throws {
        //
    }
    
    
}
