class Workspace {
  Workspace({
    required this.id,
    required this.members,
  });

  final String id;
  final List<String> members;

  factory Workspace.fromJson(Map<String, dynamic> data) {
    return Workspace(
      id: data['id'],
      members: List<String>.from(data['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': members,
    };
  }
}
