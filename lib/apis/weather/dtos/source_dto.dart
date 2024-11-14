import 'package:json_annotation/json_annotation.dart';

part 'source_dto.g.dart';

/// {@template source_dto}
/// A Data Transfer Object for a weather source.
/// {@endtemplate}
@JsonSerializable()
class SourceDto {
  /// {@macro source_dto}
  const SourceDto({
    required this.distance,
  });

  /// Converts a JSON [Map] into a [SourceDto] instance.
  factory SourceDto.fromJson(Map<String, dynamic> json) =>
      _$SourceDtoFromJson(json);

  /// Converts this [SourceDto] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$SourceDtoToJson(this);

  /// The distance in meters.
  final int distance;
}
