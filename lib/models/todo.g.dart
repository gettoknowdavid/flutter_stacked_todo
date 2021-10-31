// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension TodoCopyWith on Todo {
  Todo copyWith({
    String? description,
    String? id,
    bool? isComplete,
    String? title,
  }) {
    return Todo(
      description: description ?? this.description,
      id: id ?? this.id,
      isComplete: isComplete ?? this.isComplete,
      title: title ?? this.title,
    );
  }

  Todo copyWithNull({
    bool description = false,
    bool id = false,
  }) {
    return Todo(
      description: description == true ? null : this.description,
      id: id == true ? null : this.id,
      isComplete: isComplete,
      title: title,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isComplete': instance.isComplete,
    };
