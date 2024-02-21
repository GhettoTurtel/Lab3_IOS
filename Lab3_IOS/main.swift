struct Student {
    let firstName: String
    let lastName: String
    let averageGrade: Double
}

struct StudentJournal {
    var students: [Student] = []
    
    mutating func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let student = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(student)
    }
    
    mutating func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }
    
    func displayStudents() {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
        for student in sortedStudents {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }
    
    func averageScore() -> Double {
        let total = students.reduce(0.0) { $0 + $1.averageGrade }
        return total / Double(students.count)
    }
    
    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

struct Task {
    let title: String
    let description: String
    var isCompleted: Bool = false
}

struct ToDoList {
    var tasks: [Task] = []
    
    mutating func addTask(title: String, description: String) {
        let task = Task(title: title, description: description)
        tasks.append(task)
    }
    
    mutating func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    mutating func updateTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    func displayTasks() {
        for task in tasks {
            print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted)")
        }
    }
    
    func completedTasks() -> [Task] {
        return tasks.filter { $0.isCompleted }
    }
    
    func outstandingTasks() -> [Task] {
        return tasks.filter { !$0.isCompleted }
    }
    
    mutating func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
}


var journal = StudentJournal()
journal.addStudent(firstName: "Damir", lastName: "Tansykov", averageGrade: 4.0)
journal.addStudent(firstName: "Amir", lastName: "Gusmanov", averageGrade: 3.0)
journal.addStudent(firstName: "Radmir", lastName: "Amirov", averageGrade: 2.0)

print("All students:")
journal.displayStudents()
print("Average score:", journal.averageScore())
if let topStudent = journal.studentWithHighestGPA() {
    print("Student with highest GPA:", topStudent.firstName, topStudent.lastName)
}

var toDoList = ToDoList()
toDoList.addTask(title: "Complete this lab", description: "Finish this Lab")
toDoList.addTask(title: "Sleep", description: "Go sleep")

print("\nAll tasks:")
toDoList.displayTasks()

toDoList.updateTaskStatus(title: "Complete this lab", isCompleted: true)

print("\nCompleted tasks:")
for task in toDoList.completedTasks() {
    print("Title: \(task.title), Description: \(task.description)")
}

print("\nOutstanding tasks:")
for task in toDoList.outstandingTasks() {
    print("Title: \(task.title), Description: \(task.description)")
}

toDoList.clearCompletedTasks()
print("\nTasks after clearing completed tasks:")
toDoList.displayTasks()
