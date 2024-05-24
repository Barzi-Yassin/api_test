import 'dart:convert';

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  Review copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return Review(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerEmail: reviewerEmail ?? this.reviewerEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      rating: map['rating'].toInt() as int,
      comment: map['comment'] as String,
      date: map['date'] as String,
      reviewerName: map['reviewerName'] as String,
      reviewerEmail: map['reviewerEmail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) =>
      Review.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Review(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.comment == comment &&
        other.date == date &&
        other.reviewerName == reviewerName &&
        other.reviewerEmail == reviewerEmail;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        comment.hashCode ^
        date.hashCode ^
        reviewerName.hashCode ^
        reviewerEmail.hashCode;
  }
}
