// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ExerciseModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;
  ExerciseModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
  });

  ExerciseModel copyWith({
    String? bodyPart,
    String? equipment,
    String? gifUrl,
    String? id,
    String? name,
    String? target,
  }) {
    return ExerciseModel(
      bodyPart: bodyPart ?? this.bodyPart,
      equipment: equipment ?? this.equipment,
      gifUrl: gifUrl ?? this.gifUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      target: target ?? this.target,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bodyPart': bodyPart,
      'equipment': equipment,
      'gifUrl': gifUrl,
      'id': id,
      'name': name,
      'target': target,
    };
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      bodyPart: map['bodyPart'] != null ? map['bodyPart'] as String : null,
      equipment: map['equipment'] != null ? map['equipment'] as String : null,
      gifUrl: map['gifUrl'] != null ? map['gifUrl'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      target: map['target'] != null ? map['target'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(String source) => ExerciseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExerciseModel(bodyPart: $bodyPart, equipment: $equipment, gifUrl: $gifUrl, id: $id, name: $name, target: $target)';
  }

  @override
  bool operator ==(covariant ExerciseModel other) {
    if (identical(this, other)) return true;

    return other.bodyPart == bodyPart &&
        other.equipment == equipment &&
        other.gifUrl == gifUrl &&
        other.id == id &&
        other.name == name &&
        other.target == target;
  }

  @override
  int get hashCode {
    return bodyPart.hashCode ^ equipment.hashCode ^ gifUrl.hashCode ^ id.hashCode ^ name.hashCode ^ target.hashCode;
  }
}
