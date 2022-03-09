//
//  CategoryManager.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/02/22.
//

import Foundation


protocol CategoryManagerDelegate {
   func didUpdateCategory(_ categoryManager: CategoryManager, categoryid: CategoryModel)
    
}

struct CategoryManager {
     let BookUrl = "https://openlibrary.org/subjects"

   
   var delegate: CategoryManagerDelegate?

   
   func fetchCategory(bookName: String) {
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
                   print(error!)
                   return
               }
               if let safeData = data {
                   if  let categoryid = self.parseJSON(categoryData: safeData) {
                       delegate?.didUpdateCategory(self, categoryid: categoryid)
                   }
               }
           }
           //4. empezar la tarea
           task.resume()
       }
   }
   
   
   func parseJSON(categoryData: Data) -> CategoryModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(CategoryData.self, from: categoryData)
           print(decodedData.name)
       
           let title1Api = decodedData.works[0].title
           let title2Api = decodedData.works[1].title
           let title3Api = decodedData.works[2].title
           let title4Api = decodedData.works[3].title
           let title5Api = decodedData.works[4].title
           let nameApi = decodedData.name
           let categoryid = CategoryModel(name: nameApi,title1: title1Api,title2: title2Api, title3: title3Api, title4: title4Api, title5: title5Api  )
           return categoryid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}

