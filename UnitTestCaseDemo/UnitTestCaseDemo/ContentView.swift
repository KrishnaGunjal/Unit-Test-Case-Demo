//
//  ContentView.swift
//  UnitTestCaseDemo
//
//  Created by Krishna Gunjal on 02/06/22.
//

import SwiftUI

struct ContentView: View {
    let items = Array(1...10).map({"Element \($0)"})
    let layout = [
        GridItem(.flexible(minimum: 100, maximum: 200),spacing: 12),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    @ObservedObject var viewModel = ViewModel()
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: layout, content: {
                ForEach(viewModel.alumData, id: \.self){ num in
                    VStack(alignment: .leading){
                        Spacer()
                        Text("accusamus beatae ad facilis cum similique qui sunt")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .padding()
                    .background(Color.red)
                }
            }).padding(.horizontal, 12)
        }
        .onAppear{
            viewModel.getDataList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
