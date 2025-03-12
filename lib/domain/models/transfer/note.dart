import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_engineer/domain/models/store/store.dart';

import 'created_by.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  int? id;
  String? note;
  @JsonKey(name: 'created_by')
  CreatedBy? createdBy;
  Store? store;

  Note({this.id, this.note, this.createdBy, this.store});

  @override
  String toString() {
    return 'Note(id: $id, note: $note, createdBy: $createdBy, store: $store)';
  }

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  Note copyWith({
    int? id,
    String? note,
    CreatedBy? createdBy,
    Store? store,
  }) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
      createdBy: createdBy ?? this.createdBy,
      store: store ?? this.store,
    );
  }
}
