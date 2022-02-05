//
//  AuthorManager.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/02/22.
//

import Foundation

protocol AuthorManagerDelegate {
   func didUpdateAuthor(_ authorManager: AuthorManager, authorid: AuthorModel)
}

struct AuthorManager {
     let BookUrl = "https://openlibrary.org/search/authors.json?"

   
   var delegate: AuthorManagerDelegate?
   
   func fetchAuthor(bookName: String) {
       let urlString = "\(BookUrl)q=\(bookName)"
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
                   if  let authorid = self.parseJSON(authorData: safeData) {
                       delegate?.didUpdateAuthor(self, authorid: authorid)
                   }
               }
           }
           //4. empezar la tarea
           task.resume()
       }
   }
   
   
   
   func parseJSON(authorData: Data) -> AuthorModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(AuthorData.self, from: authorData)
           print(decodedData.docs[0].name)
       
           let nameApi = decodedData.docs[0].name
           let authorid = AuthorModel(name: nameApi)
           return authorid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}

