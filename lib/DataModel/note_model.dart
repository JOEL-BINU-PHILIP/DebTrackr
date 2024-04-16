class Note {
  final int id;
  final String title;
  final String description;
  final String amount;

  const Note(
      {required this.amount,
      required this.description,
      required this.id,
      required this.title});

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        amount: json['amount'],
        description: json['description'],
        id: json['id'],
        title: json['title'],
      );

  Map<String , dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'description' : description,
    'amount' : amount
  };
}