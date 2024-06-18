class TodoTask {
  String id;
  String category;
  String task;
  bool isCompleted;

  TodoTask({
    required this.id,
    required this.category,
    required this.task,
    required this.isCompleted,
  });

  TodoTask toggleCompleted() {
    return TodoTask(
      id: id,
      category: category,
      task: task,
      isCompleted: !isCompleted,
    );
  }
}

List<TodoTask> todoList = [
  TodoTask(
    id: '1',
    category: 'Grocery Shopping',
    task: 'Buy vegetables: tomatoes, carrots, spinach',
    isCompleted: false,
  ),
  TodoTask(
    id: '2',
    category: 'Household Chores',
    task: 'Clean the kitchen',
    isCompleted: false,
  ),
  TodoTask(
    id: '3',
    category: 'Work Tasks',
    task: 'Finish the project proposal',
    isCompleted: false,
  ),
  TodoTask(
    id: '4',
    category: 'Personal Development',
    task: 'Read 30 pages of a book',
    isCompleted: false,
  ),
  TodoTask(
    id: '5',
    category: 'Health & Fitness',
    task: 'Drink 8 glasses of water',
    isCompleted: false,
  ),
];
