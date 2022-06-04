//
//  ViewModel.swift
//  UnitTestCaseDemo
//
//  Created by Krishna Gunjal on 03/06/22.
//

import Foundation
import SwiftUI


class ViewModel: ObservableObject {
    private var apiService: APIService!
    @Published var alumData = [Album]()
    
    private var persistentDataList = [Album](){
        didSet {
            setData()
        }
    }
    
    fileprivate func setData(){
        self.alumData = persistentDataList
    }
    
    public func getDataList() {
        APIService.shared.getData { result in
            switch result{
            case .failure(let error): break
                
            case .success(let dataList):
                self.persistentDataList = dataList
            }
        }
    }
}
