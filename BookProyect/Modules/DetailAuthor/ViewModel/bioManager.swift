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
    // assing the url to a variable
     let BookUrl = "https://openlibrary.org/authors"

   
   var delegate: BioManagerDelegate?
   
   func fetchBio(authorDetailName: String) {
       
       // add the variable (authorDetailName) to the url
       let urlString = "\(BookUrl)/\(authorDetailName).json"
      perfomRequest(urlString: urlString)
   }
   
   func perfomRequest(urlString: String) {
       // 4 steps
       
       //1.Create a URL
       if let url = URL(string: urlString) {
           //2. Create the URL session
           
           let session = URLSession(configuration: .default)
           //3. give a task to the session
           let task = session.dataTask(with: url) {(data, response, error)
               in
               if error != nil{
                   print(error!)
                   return
               }
               if let safeData = data {
                   if  let bioid = self.parseJSON(bioData: safeData) {
                       delegate?.didUpdateBio(self, bioid: bioid)
                   }
               }
           }
           //4. start the task
           task.resume()
       }
   }
   
   
   
   func parseJSON(bioData: Data) -> BioModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(BioData.self, from: bioData)

           // obtein the data from the API
           let bioApi = decodedData.bio
           
           // assing the data to a variable
           let bioid = BioModel(bio: bioApi)
           return bioid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}
