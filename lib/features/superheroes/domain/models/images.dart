import 'dart:convert';

class Images {
  String? xs;
  String? sm;
  String? md;
  String? lg;

  Images({this.xs, this.sm, this.md, this.lg});

  @override
  String toString() => 'Images(xs: $xs, sm: $sm, md: $md, lg: $lg)';

  factory Images.fromMap(Map<String, dynamic> data) => Images(
        xs: data['xs'] as String?,
        sm: data['sm'] as String?,
        md: data['md'] as String?,
        lg: data['lg'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'xs': xs,
        'sm': sm,
        'md': md,
        'lg': lg,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Images].
  factory Images.fromJson(String data) {
    return Images.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Images] to a JSON string.
  String toJson() => json.encode(toMap());

  Images copyWith({
    String? xs,
    String? sm,
    String? md,
    String? lg,
  }) {
    return Images(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }
}
