import 'dart:convert';

class Connections {
  String? groupAffiliation;
  String? relatives;

  Connections({this.groupAffiliation, this.relatives});

  @override
  String toString() {
    return 'Connections(groupAffiliation: $groupAffiliation, relatives: $relatives)';
  }

  factory Connections.fromMap(Map<String, dynamic> data) => Connections(
        groupAffiliation: data['groupAffiliation'] as String?,
        relatives: data['relatives'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'groupAffiliation': groupAffiliation,
        'relatives': relatives,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Connections].
  factory Connections.fromJson(String data) {
    return Connections.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Connections] to a JSON string.
  String toJson() => json.encode(toMap());

  Connections copyWith({
    String? groupAffiliation,
    String? relatives,
  }) {
    return Connections(
      groupAffiliation: groupAffiliation ?? this.groupAffiliation,
      relatives: relatives ?? this.relatives,
    );
  }
}
