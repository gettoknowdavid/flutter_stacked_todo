import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@CopyWith(generateCopyWithNull: true)
@JsonSerializable(explicitToJson: true)
class Todo extends Equatable {
  final String? id;
  final String title;
  final String? description;
  final bool isComplete;

  const Todo({
    this.id,
    required this.title,
    this.description,
    required this.isComplete,
  });

  @override
  List<Object?> get props => [id, title, description, isComplete];

  static Todo fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
