//
//  TacoDataService.swift
//  TocaMama
//
//  Created by Michael Dunn on 2016-10-04.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import Foundation

// delegate pattern
protocol TacoDataServiceDelegate: class {
    func tacoDataLoaded()
}


class TacoDataService {
    // singleton
    static let instance = TacoDataService()
    var tacos: Array<Taco> = []
    
    
    weak var delegate: TacoDataServiceDelegate?
    
    
    
    func loadTaco(){
        parseTacoCSV()  // Normally connect to an API, but let's do csv for now
        
        // signal data loaded.
        delegate?.tacoDataLoaded()
    }
    
    
    // Parse csv
    private func parseTacoCSV(){
        let path = Bundle.main.path(forResource: "TacoMamaData", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            print(rows)
            
            for row in rows {
                let id = Int(row["id"]!)!
                let productName = row["productName"]!
                let shellId = Int(row["shellId"]!)!
                let proteinId = Int(row["proteinId"]!)!
                let condimentsId = Int(row["condimentsId"]!)!
                
                let taco = Taco(id: id,
                                productName: productName,
                                shellId: shellId,
                                proteinId: proteinId,
                                condimentId: condimentsId)
                tacos.append(taco)
            }
            
        } catch let error as NSError{
            print(error.debugDescription)
        }
    }
}
