//
//  DetailView.swift
//  SwiftUIJordyS
//
//  Created by MacBookMBA6 on 26/07/23.
//

import SwiftUI

struct DetailView: View {
    
    var product : Product
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            VStack{
                Text(product.title)
                    .bold()
                    .font(.system(size: 24))
                    .padding(24)
                
                AsyncImage(url: URL(string: product.thumbnail), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }, placeholder: {
                    ProgressView()
                })
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                
                Text(product.description)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 24)
                
                HStack{
                    Text("Precio:")
                    Text("\(product.price)")
                }
                .padding(.top, 24)
                .padding(.bottom, 32)
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Regresar")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.blue)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color(red: 10/255, green: 74/255, blue: 163/255), lineWidth: 2)
                )
                .buttonStyle(.bordered)
                .tint(Color.clear)
                .frame(height: 50)
                .controlSize(.large)
                .padding(.horizontal, 35)
                .padding(.top, 32)
                .padding(.bottom, 24)
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(product: Product(id: 1, title: "iPhone X", description: "Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen", price: 12, thumbnail: "https://i.dummyjson.com/data/products/30/thumbnail.jpg"))
    }
}
