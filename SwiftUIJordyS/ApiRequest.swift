import Foundation

class ApiRequest{
    
    func GetAll(resp: @escaping([Product]?, Error?)->Void){
        let url = URL(string: "https://dummyjson.com/products")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: {data, response, error in
            let httpResponse = response as! HTTPURLResponse
            
            if 200...299 ~= httpResponse.statusCode{
                if let dataSource = data{
                    let decoder = JSONDecoder()
                    let result = try! decoder.decode(Root.self, from: dataSource)
                    resp(result.products, nil)
                    print(result.products)
                }
            }
            if let errorSource = error{
                resp(nil, errorSource)
            }
        }).resume()
    }
    
    func GetById(id : Int){
        
    }
}
