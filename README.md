# TaskListTest

## Description  
Something like ToDoList SwiftUI app which is created with MVVM architecture. Management features include adding, editing, deleting, and searching ***todos*** by title. 
Upon app launch, tasks are loaded from *Core Data* unless it is the first launch, in which case they are fetched from the [dummy JSON API](https://dummyjson.com/todos) and saved locally.

##### Key features:
-  Display a list of tasks with concise dynamic titles (extracted from the first word of the description). Includes task metadata: ID, status (completed/incomplete), creation date, and full description.
-  Core functionalities: Add, edit, delete, and search tasks dynamically.
-  Asynchronous operations for fetching tasks and saving/loading from Core Data using DispatchQueue. Ensures a responsive UI during background tasks.
-  Dynamic task status updates in detail view.

##### Networking Workflow:
- Use URLSession to fetch data from the API.
- Decode JSON response using Codable.
- Save fetched tasks to Core Data.
- Load tasks from Core Data on subsequent app launches.


## Installation  
1. To get started with this project, clone the repository to your local machine using the following command: `git clone https://github.com/victoriaSamsonovaaa/TaskListTest`
2. Open the project in Xcode.
3. Build and Run: Select a simulator or connected device and click the "Run" button in Xcode.







