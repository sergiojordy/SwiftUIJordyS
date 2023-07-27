import SwiftUI

struct ContentView: View {
    @State private var products = [Product]()
    @State private var selectedProduct: Product?
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Productos").bold().font(.system(size: 24))
                .foregroundColor(Color(red: 10/255, green: 74/255, blue: 163/255))
                .padding(.top, 24)
                .padding(.bottom, 24)
            
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(products) { product in
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text("Nombre:")
                                Text("\(product.title)")
                                Spacer()
                            }
                            .padding(.top, 16)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16)
                            
                            HStack {
                                Text(product.description)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            
                            HStack {
                                Text("Precio:")
                                Text("$\(product.price)")
                                Spacer()
                            }
                            .padding(.top, 8)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 16)
                        }
                        .padding(.horizontal, 20)
                        .border(Color(red: 10/255, green: 74/163, blue: 163/255), width: 1)
                        .onTapGesture {
                            self.selectedProduct = product
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .sheet(item: $selectedProduct, content: { product in
                DetailView(product: product)
            })
        }
        .padding(.horizontal,10)
        .onAppear() {
            ApiRequest().GetAll(resp: { result, error in
                if let resultSource = result {
                    self.products = resultSource
                }
                if let errorSource = error {
                    print(errorSource)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
