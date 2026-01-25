class Task {
  final String title;
  final String description;
  final String date;
  final String status;

  Task({
    required this.title,
    required this.description,
    required this.date,
    this.status = 'New',
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'date': date,
    'status': status,
  };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: json['description'],
      date: json['date'],
      status: json['status'],
    );
  }
}
