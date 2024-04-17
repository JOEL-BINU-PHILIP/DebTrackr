
class Note{
  final int? id;
  final String title;
  final String description;
  final int amount;
  const Note({required this.title, required this.description, this.id , required this.amount});

  factory Note.fromJson(Map<String,dynamic> json) => Note(
    id: json['id'],
    amount: json['amount'],
    title: json['title'],
    description: json['description']
  );

  Map<String,dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'title': title,
    'description': description
  };
}