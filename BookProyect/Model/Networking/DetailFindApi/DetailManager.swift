//
//  DetailManager.swift
//  BookProyect
//
//  Created by GiselaCamacho on 06/02/22.
//

import Foundation

protocol DetailManagerDelegate {
   func didUpdateDetail(_ detailManager: DetailManager, detailid: DetailModel)
}

struct DetailManager {
    // assing the url to a variable
     let BookUrl = "https://openlibrary.org"

   
   var delegate: DetailManagerDelegate?
   
   func fetchDetail(bookDetailName: String) {
       
       // add the variable (bookDetailName) to the url to complete it
       let urlString = "\(BookUrl)/\(bookDetailName).json"
      perfomRequest(urlString: urlString)
   }
   
   func perfomRequest(urlString: String) {
       //4 steps
       
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
                   if  let detailid = self.parseJSON(detailData: safeData) {
                       delegate?.didUpdateDetail(self, detailid: detailid)
                   }
               }
           }
           //4. start the task
           task.resume()
       }
   }
   
   
   
   func parseJSON(detailData: Data) -> DetailModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(DetailData.self, from: detailData)
           
           // obtein the data from the API
           let descriptionApi = decodedData.description
           let titleApi = decodedData.title

           // assing the data to a variable 
           let detailid = DetailModel(description: descriptionApi, title: titleApi)
           return detailid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}
