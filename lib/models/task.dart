class Task {
  final String title; // Заголовок задачи
  final bool completed; // Статус завершения задачи

  Task({required this.title, required this.completed}); // Конструктор

  // Метод для создания экземпляра задачи из JSON
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String, // Извлечение заголовка
      completed: json['completed'] as bool, // Извлечение статуса
    );
  }

  // Метод для преобразования задачи в JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title, // Заголовок задачи
      'completed': completed, // Статус завершения
    };
  }
}
