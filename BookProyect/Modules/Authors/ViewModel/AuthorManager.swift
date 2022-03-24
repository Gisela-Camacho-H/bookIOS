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
    // assign the url to a variable
     let BookUrl = "https://openlibrary.org/search/authors.json?"

   
   var delegate: AuthorManagerDelegate?
   
   func fetchAuthor(authorName: String) {
       // add the variable (authorName) to the url
       let urlString = "\(BookUrl)q=\(authorName)"
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
                   if  let authorid = self.parseJSON(authorData: safeData) {
                       delegate?.didUpdateAuthor(self, authorid: authorid)
                   }
               }
           }
           //4. star the task
           task.resume()
       }
   }
   
   
   
   func parseJSON(authorData: Data) -> AuthorModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(AuthorData.self, from: authorData)
       
           // obtein the data from the API
           let nameApi = decodedData.docs[0].name
           let birthdayApi = decodedData.docs[0].birth_date
           let topApi = decodedData.docs[0].top_work
           let keyApi = decodedData.docs[0].key
           // assing the data to a variable 
           let authorid = AuthorModel(name: nameApi,birthday: birthdayApi, top: topApi, key: keyApi)
           return authorid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}

