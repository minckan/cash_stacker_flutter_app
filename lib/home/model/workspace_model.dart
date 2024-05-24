class Workspace {
  Workspace({
    required this.members,
    required this.totalAmount,
    required this.id,
  });

  final String id;
  final List<String> members;
  final double totalAmount;

  factory Workspace.fromJson(Map<String, dynamic> data) {
    return Workspace(
      id: data['id'],
      members: List<String>.from(data['user']),
      totalAmount: data['totalAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': members,
      'totalAmount': totalAmount,
    };
  }
}
