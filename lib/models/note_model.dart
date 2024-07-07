class NoteModel {
  final int? id;
  final String? title;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  NoteModel({
     this.id,
     this.title,
     this.description,
     this.createdAt,
     this.updatedAt,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory NoteModel.fromJson(Map<dynamic, dynamic> json) {
    return NoteModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'].toString(),
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
