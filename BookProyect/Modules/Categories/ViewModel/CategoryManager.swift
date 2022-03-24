//
//  CategoryManager.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/02/22.
//

import Foundation
import UIKit


protocol CategoryManagerDelegate {
   func didUpdateCategory(_ categoryManager: CategoryManager, categoryid: CategoryModel)
    
}


struct CategoryManager {
    // assign a url to a variable
     let BookUrl = "https://openlibrary.org/subjects"

   
   var delegate: CategoryManagerDelegate?

   
   func fetchCategory(categoryName: String, view: UIView) {
       // add the variable (categoryName) to the url
       let urlString = "\(BookUrl)/\(categoryName).json"
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
                   if  let categoryid = self.parseJSON(categoryData: safeData) {
                       delegate?.didUpdateCategory(self, categoryid: categoryid)
                   }
               }
           }
           //4. start the task
           task.resume()
       }
   }
   
   
   func parseJSON(categoryData: Data) -> CategoryModel? {
       let decoder = JSONDecoder()
       do {
           
           let decodedData = try decoder.decode(CategoryData.self, from: categoryData)
           print(decodedData.name)
           // obtein the data from the API
           let title1Api = decodedData.works[0].title
           let title2Api = decodedData.works[1].title
           let title3Api = decodedData.works[2].title
           let title4Api = decodedData.works[3].title
           let title5Api = decodedData.works[4].title
           let nameApi = decodedData.name
           
           // assing the data to a variable 
           let categoryid = CategoryModel(name: nameApi,title1: title1Api,title2: title2Api, title3: title3Api, title4: title4Api, title5: title5Api  )
           return categoryid
           
       } catch {
           print(error)
           return nil
       }
   }
  
}

