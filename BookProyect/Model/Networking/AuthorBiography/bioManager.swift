//
//  bioManager.swift
//  BookProyect
//
//  Created by GiselaCamacho on 07/02/22.
//

import Foundation

protocol BioManagerDelegate {
   func didUpdateBio(_ bioManager: BioManager, bioid: BioModel)
}

struct BioManager {
     let BookUrl = "https://openlibrary.org/authors"

   
   var delegate: BioManagerDelegate?
   
   func fetchBio(bookName: String) {
       
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
                   if  let bioid = self.parseJSON(bioData: safeData) {
                       delegate?.didUpdateBio(self, bioid: bioid)
                   }
               }
           }
           //4. empezar la tarea
           task.resume()
       }
   }
   
   
   
   func parseJSON(bioData: Data) -> BioModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(BioData.self, from: bioData)
           print(decodedData.bio)
       
           let bioApi = decodedData.bio
           let bioid = BioModel(bio: bioApi)
           return bioid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}
