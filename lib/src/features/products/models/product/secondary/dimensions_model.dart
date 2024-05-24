import 'dart:convert';

class Dimensions {
  final double width;
  final double height;
  final double depth;
  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  Dimensions copyWith({
    double? width,
    double? height,
    double? depth,
  }) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      depth: depth ?? this.depth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'width': width,
      'height': height,
      'depth': depth,
    };
  }

  factory Dimensions.fromMap(Map<String, dynamic> map) {
    return Dimensions(
      width: map['width'].toDouble() as double,
      height: map['height'].toDouble() as double,
      depth: map['depth'].toDouble() as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dimensions.fromJson(String source) =>
      Dimensions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Dimensions(width: $width, height: $height, depth: $depth)';

  @override
  bool operator ==(covariant Dimensions other) {
    if (identical(this, other)) return true;

    return other.width == width &&
        other.height == height &&
        other.depth == depth;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ depth.hashCode;
}

