//
//  BookManager.swift
//  BookProyect
//
//  Created by GiselaCamacho on 01/02/22.
//

import Foundation
 
protocol BookManagerDelegate {
    func didUpdateBook(_ bookManager: BookManager, bookid: BookModel)
}

struct BookManager {
      let BookUrl = "https://playground-bookstore.herokuapp.com/api/v1/books/"

    
    var delegate: BookManagerDelegate?
    
    func fetchBook(bookName: String) {
        let urlString = "\(BookUrl)\(bookName)"
       perfomRequest(urlString: urlString)
    }
    
    func perfomRequest(urlString: String) {
        // Hacemos los 4 pasos
        
        //1.Crear un URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            //3. Darle la session una tarea
            let task = session.dataTask(with: url) {(data, response, error)
                in
                if error != nil{
                    print(error)
                    return
                }
                if let safeData = data {
                    if  let bookid = self.parseJSON(bookData: safeData) {
                        delegate?.didUpdateBook(self, bookid: bookid)
                    }
                }
            }
            //4. empezar la tarea
            task.resume()
        }
    }
    
    
    
    func parseJSON(bookData: Data) -> BookModel? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(BookData.self, from: bookData)
            print(decodedData.data.attributes.title)
        
            let titleApi = decodedData.data.attributes.title
            let bookid = BookModel(title: titleApi)
            return bookid
            
        } catch {
            print(error)
            return nil
        }
    }
   
}

