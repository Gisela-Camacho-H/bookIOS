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
    // assign the url to a variable
      let BookUrl = "https://openlibrary.org/search.json?"

    
    var delegate: BookManagerDelegate?
    
    func fetchBook(bookName: String) {
        // add the variable(bookName) to the url
        let urlString = "\(BookUrl)q=\(bookName)"
       perfomRequest(urlString: urlString)
    }
    
    func perfomRequest(urlString: String) {
        // 4 steps
        
        //1.Create a URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
            
            //3. give a task to the session
            let task = session.dataTask(with: url) {(data, response, error)
                in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    if  let bookid = self.parseJSON(bookData: safeData) {
                        delegate?.didUpdateBook(self, bookid: bookid)
                    }
                }
            }
            //4. start the task
            task.resume()
        }
    }
    
    
    
    func parseJSON(bookData: Data) -> BookModel? {
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(BookData.self, from: bookData)

            // obtein the data from the API
            let title1Api = decodedData.docs[0].title
            let firstApi = decodedData.docs[0].first_publish_year
            let keyApi = decodedData.docs[0].key
            let EditionIdApi = decodedData.docs[0].edition_key?[2]
            let authorNameApi = decodedData.docs[0].author_name?[0]
            let authorKeyNameApi = decodedData.docs[0].author_key?[0]
            
            // assing the data to a variable
            let bookid = BookModel(title: title1Api, first: firstApi, key: keyApi, author_name: authorNameApi, edition: EditionIdApi, author_key: authorKeyNameApi)
            return bookid
            
        } catch {
            print(error)
            return nil
        }
    }
   
}


