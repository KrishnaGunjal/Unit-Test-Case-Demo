//
//  ViewModel.swift
//  UnitTestCaseDemo
//
//  Created by Krishna Gunjal on 03/06/22.
//

import Foundation
import SwiftUI


protocol DataViewModelDelegate {
    func dataRefreshSuccess()
    func dataFetchError(error: DataError)
}

class ViewModel: NSObject {
    private var apiService: APIService!
    var dataViewModelDelegate: DataViewModelDelegate?
    var alumData = [Album]()
    
    private var persistentDataList = [Album](){
        didSet {
            setData()
        }
    }
    
    fileprivate func setData(){
        self.alumData = persistentDataList
        self.dataViewModelDelegate?.dataRefreshSuccess()
    }
    
    public func getDataList() {
        APIService.shared.getData { result in
            switch result{
            case .failure(let error):
                self.dataViewModelDelegate?.dataFetchError(error: error)
                
            case .success(let dataList):
                self.persistentDataList = dataList
                self.dataViewModelDelegate?.dataRefreshSuccess()
            }
        }
    }
}
