//
//  Parser.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-07-26.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import Foundation
import SwiftSoup

class Parser: NSObject {
    var mainContent:[Int:String]!
    var headerContent:[Int:String]!
    var extras:String!
    
    override init() {
        super.init()
        mainContent   = [2:"", 3:"", 4:"", 5:"", 6:""]
        headerContent = [2:"", 3:"", 4:"", 5:"", 6:""]
        extras = ""
    }
    
    func getContentForWeek(day:Int) -> String {
        return mainContent[day]!
    }
    
    func getHeaderForWeek(day:Int) -> String {
        return headerContent[day]!
    }
    
    func initLocalParser() -> Bool{
        
        let testUrl = URL(string: "http://www.uece.br/uece/index.php/conhecaauece/restauranteuniversitario")
        do {
            let myHTMLString = try String(contentsOf: testUrl!, encoding: .utf8)
            let doc: Document = try! SwiftSoup.parse(myHTMLString)
            var table: Element = try! doc.select("table.table-striped.table-bordered.table-hover").first()!
            var rows = try! table.select("tr")
            
            if try! table.select("tr").size() > 10{
                extras = try! table.select("tr").get(10).text()
            }
            
            for (index, row) in rows.enumerated(){
                
                if index == 1 { mainContent[2] = try! row.text() }
                if index == 3 { mainContent[3] = try! row.text() }
                if index == 5 { mainContent[4] = try! row.text() }
                if index == 7 { mainContent[5] = try! row.text() }
                if index == 9 { mainContent[6] = try! row.text() }
                
                if index == 0 { headerContent[2] = try! row.text() }
                if index == 2 { headerContent[3] = try! row.text() }
                if index == 4 { headerContent[4] = try! row.text() }
                if index == 6 { headerContent[5] = try! row.text() }
                if index == 8 { headerContent[6] = try! row.text() }
            }
            
            table = try! doc.select("table.table-striped.table-bordered.table-hover").last()!
            rows = try! table.select("tr")
            
            for (index, row) in rows.enumerated(){
                print("\(index) : \(try! row.text())")
            }
            
            
        } catch let error {
            print("Error: \(error) DEU RUIM")
            return false
        }
        return true
    }
}
