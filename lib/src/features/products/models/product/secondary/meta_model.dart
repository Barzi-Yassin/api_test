import 'dart:convert';

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;
  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  Meta copyWith({
    String? createdAt,
    String? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return Meta(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      barcode: barcode ?? this.barcode,
      qrCode: qrCode ?? this.qrCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'barcode': barcode,
      'qrCode': qrCode,
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      barcode: map['barcode'] as String,
      qrCode: map['qrCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) =>
      Meta.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Meta(createdAt: $createdAt, updatedAt: $updatedAt, barcode: $barcode, qrCode: $qrCode)';
  }

  @override
  bool operator ==(covariant Meta other) {
    if (identical(this, other)) return true;

    return other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.barcode == barcode &&
        other.qrCode == qrCode;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        updatedAt.hashCode ^
        barcode.hashCode ^
        qrCode.hashCode;
  }
}
