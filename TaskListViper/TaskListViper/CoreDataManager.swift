import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ItemModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            } else {
                print("Persistent store loaded successfully: \(storeDescription)")
            }
        })
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("Context saved successfully")
            } catch {
                let nserror = error as NSError
                print("Failed to save context: \(nserror), \(nserror.userInfo)")
            }
        } else {
            print("No changes to save in context")
        }
    }

    func fetchTodos() -> [ToDoItem] {
        let fetchRequest: NSFetchRequest<ItemModel> = ItemModel.fetchRequest()
        do {
            let items = try context.fetch(fetchRequest)
            print("Fetched \(items.count) items from CoreData")
            return items.map { ToDoItem(from: $0) }
        } catch {
            print("Failed to fetch todos: \(error)")
            return []
        }
    }

    func saveTodos(_ todos: [ToDoItem]) {
        let fetchRequest: NSFetchRequest<ItemModel> = ItemModel.fetchRequest()
        do {
            // Удаление существующих данных
            let existingItems = try context.fetch(fetchRequest)
            print("Deleting \(existingItems.count) existing items from CoreData")
            for item in existingItems {
                context.delete(item)
            }
            saveContext()

            // Сохранение новых данных
            print("Saving \(todos.count) new todos to CoreData")
            for todo in todos {
                let item = ItemModel(context: context)
                item.id = todo.id
                item.todo = todo.todo
                item.completed = todo.completed
                item.userId = todo.userId
                print("Saved item: \(todo.todo)")
            }
            saveContext()
        } catch {
            print("Failed to save todos: \(error)")
        }
    }
}
