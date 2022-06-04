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
        GridItem(.flexible(minimum: 100, maximum: 200),spacing: 12),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    let viewModel = ViewModel()
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: layout, content: {
                ForEach(0..<20, id: \.self){ num in
                    HStack{
                        Spacer()
                        Text("\(num)")
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
