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
     let BookUrl = "https://openlibrary.org"

   
   var delegate: DetailManagerDelegate?
   
   func fetchDetail(bookName: String) {
       
       let urlString = "\(BookUrl)/\(bookName).json"
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
                   if  let detailid = self.parseJSON(detailData: safeData) {
                       delegate?.didUpdateDetail(self, detailid: detailid)
                   }
               }
           }
           //4. empezar la tarea
           task.resume()
       }
   }
   
   
   
   func parseJSON(detailData: Data) -> DetailModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(DetailData.self, from: detailData)
           print(decodedData.description)
       
           let descriptionApi = decodedData.description
           let titleApi = decodedData.title
           let detailid = DetailModel(description: descriptionApi, title: titleApi)
           return detailid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}
