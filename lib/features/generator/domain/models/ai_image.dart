import 'dart:convert';

class AIImage {
  String? imageUrl;

  AIImage({this.imageUrl});

  @override
  String toString() {
    return 'AIImage(imageUrl: $imageUrl)';
  }

  factory AIImage.fromMap(Map<String, dynamic> data) {
    final imageData = data['data'];
    if (imageData is List && imageData.isNotEmpty) {
      return AIImage(
        imageUrl: imageData[0]['url'] as String?,
      );
    }
    return AIImage();
  }

  Map<String, dynamic> toMap() => {
        'imageUrl': imageUrl,
      };

  /// Parses the string and returns the resulting JSON object as [AIImage].
  factory AIImage.fromJson(String data) {
    return AIImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// Converts [AIImage] to a JSON string.
  String toJson() => json.encode(toMap());

  AIImage copyWith({String? imageUrl}) {
    return AIImage(imageUrl: imageUrl ?? this.imageUrl);
  }
}
