//
//  TodoDataService.swift
//  TodosTest
//
//  Created by Victoria Samsonova on 22.01.25.
//

import Foundation

class TodoDataService {
    @Published var todos: [Todo] = []
    
    func fetchFromApi() {
        if let url = URL(string: "https://dummyjson.com/todos") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Failed to fetch todos: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                do {
                    let todoResponse = try JSONDecoder().decode(TodoResponse.self, from: data)
                } catch {
                    
                }
                
            }
        }
        
    }
}


/*    func fetchTodos() {
 let url = URL(string: "https://dummyjson.com/todos")!
 URLSession.shared.dataTask(with: url) { data, response, error in
     guard let data = data, error == nil else {
         print("Failed to fetch todos: \(error?.localizedDescription ?? "Unknown error")")
         return
     }
     do {
         let todoResponse = try JSONDecoder().decode(TodoResponse.self, from: data)
         self.coreDataManager.saveTodos(todoResponse.todos)
         let todos = self.coreDataManager.fetchTodos()
         DispatchQueue.main.async {
             self.output?.didFetchTodos(todos)
         }
     } catch {
         print("Failed to decode todos: \(error)")
     }
 }.resume()
}
*/
