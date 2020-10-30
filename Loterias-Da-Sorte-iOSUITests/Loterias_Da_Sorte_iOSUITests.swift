//
//  Loterias_Da_Sorte_iOSUITests.swift
//  Loterias-Da-Sorte-iOSUITests
//
//  Created by Gabriel Soria Souza on 19/10/20.
//  Copyright © 2020 Gabriel Sória Souza. All rights reserved.
//

import XCTest

final class Loterias_Da_Sorte_iOSUITests: XCTestCase {

    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
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
        diaDeSorteButton.swipeDown()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Próximo"]/*[[".cells[\"Último, Último, Próximo, Próximo\"]",".segmentedControls.buttons[\"Próximo\"]",".buttons[\"Próximo\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("NextGamesLoaded")
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mega Sena"]/*[[".cells[\"Mega Sena, info.circle.fill\"].staticTexts[\"Mega Sena\"]",".staticTexts[\"Mega Sena\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Lotofácil"]/*[[".cells[\"Lotofácil, info.circle.fill\"].staticTexts[\"Lotofácil\"]",".staticTexts[\"Lotofácil\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("NextGamesLoaded2")
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Último"]/*[[".cells[\"Último, Último, Próximo, Próximo\"]",".segmentedControls.buttons[\"Último\"]",".buttons[\"Último\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Quina"]/*[[".cells[\"Quina\"].buttons[\"Quina\"]",".buttons[\"Quina\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("QuinaLoaded")
                
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Quina\nConcurso 5007\n15   19   21   43   44\n29/06/2019\nR$ 3.959.908,92"]/*[[".cells[\"Quina\\nConcurso 5007\\n15   19   21   43   44\\n29\/06\/2019\\nR$ 3.959.908,92\"].buttons[\"Quina\\nConcurso 5007\\n15   19   21   43   44\\n29\/06\/2019\\nR$ 3.959.908,92\"]",".buttons[\"Quina\\nConcurso 5007\\n15   19   21   43   44\\n29\/06\/2019\\nR$ 3.959.908,92\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("QuinaDetail")
        
        let quinaNavigationBar = app.navigationBars["Quina"]
        quinaNavigationBar.buttons["magnifyingglass.circle.fill"].tap()
        snapshot("SearchSheet")
        app.sheets["Deseja ver algum jogo específico?"].scrollViews.otherElements.buttons["Procurar"].tap()
        snapshot("Alert")
        app.alerts["Digite o número do jogo que você deseja ver"].scrollViews.otherElements.buttons["Voltar"].tap()
        
        quinaNavigationBar.buttons["square.and.arrow.up.fill"].tap()
        snapshot("ShareSheet")
        app/*@START_MENU_TOKEN@*/.navigationBars["UIActivityContentView"]/*[[".otherElements[\"ActivityListView\"].navigationBars[\"UIActivityContentView\"]",".navigationBars[\"UIActivityContentView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Close"].tap()
        quinaNavigationBar.buttons["Loterias da Sorte"].tap()
        app.tabBars["Tab Bar"].buttons["settings"].tap()
        snapshot("Settings")
    }

    func testLaunchPerformance() throws {
        //
    }
    
    
}
