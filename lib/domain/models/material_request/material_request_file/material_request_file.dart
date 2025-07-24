import 'package:json_annotation/json_annotation.dart';

part 'material_request_file.g.dart';

@JsonSerializable(explicitToJson: true)
class MaterialRequestFile {
  int? id;
  @JsonKey(name: 'material_request_id')
  int? materialRequestId;
  String? file;
  @JsonKey(name: 'file_mime_type')
  String? fileMimeType;
  @JsonKey(name: 'transaction_type')
  String? transactionType;
  String? url;

  MaterialRequestFile({
    this.id,
    this.materialRequestId,
    this.file,
    this.fileMimeType,
    this.transactionType,
    this.url,
  });

  factory MaterialRequestFile.fromJson(Map<String, dynamic> json) {
    return _$MaterialRequestFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MaterialRequestFileToJson(this);
}
