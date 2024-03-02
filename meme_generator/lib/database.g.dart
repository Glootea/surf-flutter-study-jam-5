// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $MemesTable extends Memes with TableInfo<$MemesTable, Meme> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _previewPathMeta =
      const VerificationMeta('previewPath');
  @override
  late final GeneratedColumn<String> previewPath = GeneratedColumn<String>(
      'preview_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imagePath, previewPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memes';
  @override
  VerificationContext validateIntegrity(Insertable<Meme> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('preview_path')) {
      context.handle(
          _previewPathMeta,
          previewPath.isAcceptableOrUnknown(
              data['preview_path']!, _previewPathMeta));
    } else if (isInserting) {
      context.missing(_previewPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meme map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meme(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path'])!,
      previewPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}preview_path'])!,
    );
  }

  @override
  $MemesTable createAlias(String alias) {
    return $MemesTable(attachedDatabase, alias);
  }
}

class Meme extends DataClass implements Insertable<Meme> {
  final int id;
  final String imagePath;
  final String previewPath;
  const Meme(
      {required this.id, required this.imagePath, required this.previewPath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['image_path'] = Variable<String>(imagePath);
    map['preview_path'] = Variable<String>(previewPath);
    return map;
  }

  MemesCompanion toCompanion(bool nullToAbsent) {
    return MemesCompanion(
      id: Value(id),
      imagePath: Value(imagePath),
      previewPath: Value(previewPath),
    );
  }

  factory Meme.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meme(
      id: serializer.fromJson<int>(json['id']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      previewPath: serializer.fromJson<String>(json['previewPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'imagePath': serializer.toJson<String>(imagePath),
      'previewPath': serializer.toJson<String>(previewPath),
    };
  }

  Meme copyWith({int? id, String? imagePath, String? previewPath}) => Meme(
        id: id ?? this.id,
        imagePath: imagePath ?? this.imagePath,
        previewPath: previewPath ?? this.previewPath,
      );
  @override
  String toString() {
    return (StringBuffer('Meme(')
          ..write('id: $id, ')
          ..write('imagePath: $imagePath, ')
          ..write('previewPath: $previewPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imagePath, previewPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meme &&
          other.id == this.id &&
          other.imagePath == this.imagePath &&
          other.previewPath == this.previewPath);
}

class MemesCompanion extends UpdateCompanion<Meme> {
  final Value<int> id;
  final Value<String> imagePath;
  final Value<String> previewPath;
  const MemesCompanion({
    this.id = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.previewPath = const Value.absent(),
  });
  MemesCompanion.insert({
    this.id = const Value.absent(),
    required String imagePath,
    required String previewPath,
  })  : imagePath = Value(imagePath),
        previewPath = Value(previewPath);
  static Insertable<Meme> custom({
    Expression<int>? id,
    Expression<String>? imagePath,
    Expression<String>? previewPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imagePath != null) 'image_path': imagePath,
      if (previewPath != null) 'preview_path': previewPath,
    });
  }

  MemesCompanion copyWith(
      {Value<int>? id, Value<String>? imagePath, Value<String>? previewPath}) {
    return MemesCompanion(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      previewPath: previewPath ?? this.previewPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (previewPath.present) {
      map['preview_path'] = Variable<String>(previewPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemesCompanion(')
          ..write('id: $id, ')
          ..write('imagePath: $imagePath, ')
          ..write('previewPath: $previewPath')
          ..write(')'))
        .toString();
  }
}

class $LabelsOnMemeTable extends LabelsOnMeme
    with TableInfo<$LabelsOnMemeTable, LabelsOnMemeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LabelsOnMemeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
      'x', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
      'y', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scaleMeta = const VerificationMeta('scale');
  @override
  late final GeneratedColumn<double> scale = GeneratedColumn<double>(
      'scale', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _memeIdMeta = const VerificationMeta('memeId');
  @override
  late final GeneratedColumn<int> memeId = GeneratedColumn<int>(
      'meme_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES memes (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, label, x, y, color, scale, memeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'labels_on_meme';
  @override
  VerificationContext validateIntegrity(Insertable<LabelsOnMemeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('scale')) {
      context.handle(
          _scaleMeta, scale.isAcceptableOrUnknown(data['scale']!, _scaleMeta));
    } else if (isInserting) {
      context.missing(_scaleMeta);
    }
    if (data.containsKey('meme_id')) {
      context.handle(_memeIdMeta,
          memeId.isAcceptableOrUnknown(data['meme_id']!, _memeIdMeta));
    } else if (isInserting) {
      context.missing(_memeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LabelsOnMemeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LabelsOnMemeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}y'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      scale: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}scale'])!,
      memeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}meme_id'])!,
    );
  }

  @override
  $LabelsOnMemeTable createAlias(String alias) {
    return $LabelsOnMemeTable(attachedDatabase, alias);
  }
}

class LabelsOnMemeData extends DataClass
    implements Insertable<LabelsOnMemeData> {
  final int id;
  final String label;
  final double x;
  final double y;
  final int color;
  final double scale;
  final int memeId;
  const LabelsOnMemeData(
      {required this.id,
      required this.label,
      required this.x,
      required this.y,
      required this.color,
      required this.scale,
      required this.memeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    map['color'] = Variable<int>(color);
    map['scale'] = Variable<double>(scale);
    map['meme_id'] = Variable<int>(memeId);
    return map;
  }

  LabelsOnMemeCompanion toCompanion(bool nullToAbsent) {
    return LabelsOnMemeCompanion(
      id: Value(id),
      label: Value(label),
      x: Value(x),
      y: Value(y),
      color: Value(color),
      scale: Value(scale),
      memeId: Value(memeId),
    );
  }

  factory LabelsOnMemeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LabelsOnMemeData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
      color: serializer.fromJson<int>(json['color']),
      scale: serializer.fromJson<double>(json['scale']),
      memeId: serializer.fromJson<int>(json['memeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
      'color': serializer.toJson<int>(color),
      'scale': serializer.toJson<double>(scale),
      'memeId': serializer.toJson<int>(memeId),
    };
  }

  LabelsOnMemeData copyWith(
          {int? id,
          String? label,
          double? x,
          double? y,
          int? color,
          double? scale,
          int? memeId}) =>
      LabelsOnMemeData(
        id: id ?? this.id,
        label: label ?? this.label,
        x: x ?? this.x,
        y: y ?? this.y,
        color: color ?? this.color,
        scale: scale ?? this.scale,
        memeId: memeId ?? this.memeId,
      );
  @override
  String toString() {
    return (StringBuffer('LabelsOnMemeData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('color: $color, ')
          ..write('scale: $scale, ')
          ..write('memeId: $memeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, x, y, color, scale, memeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LabelsOnMemeData &&
          other.id == this.id &&
          other.label == this.label &&
          other.x == this.x &&
          other.y == this.y &&
          other.color == this.color &&
          other.scale == this.scale &&
          other.memeId == this.memeId);
}

class LabelsOnMemeCompanion extends UpdateCompanion<LabelsOnMemeData> {
  final Value<int> id;
  final Value<String> label;
  final Value<double> x;
  final Value<double> y;
  final Value<int> color;
  final Value<double> scale;
  final Value<int> memeId;
  const LabelsOnMemeCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.color = const Value.absent(),
    this.scale = const Value.absent(),
    this.memeId = const Value.absent(),
  });
  LabelsOnMemeCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required double x,
    required double y,
    required int color,
    required double scale,
    required int memeId,
  })  : label = Value(label),
        x = Value(x),
        y = Value(y),
        color = Value(color),
        scale = Value(scale),
        memeId = Value(memeId);
  static Insertable<LabelsOnMemeData> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<double>? x,
    Expression<double>? y,
    Expression<int>? color,
    Expression<double>? scale,
    Expression<int>? memeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (color != null) 'color': color,
      if (scale != null) 'scale': scale,
      if (memeId != null) 'meme_id': memeId,
    });
  }

  LabelsOnMemeCompanion copyWith(
      {Value<int>? id,
      Value<String>? label,
      Value<double>? x,
      Value<double>? y,
      Value<int>? color,
      Value<double>? scale,
      Value<int>? memeId}) {
    return LabelsOnMemeCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      x: x ?? this.x,
      y: y ?? this.y,
      color: color ?? this.color,
      scale: scale ?? this.scale,
      memeId: memeId ?? this.memeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (scale.present) {
      map['scale'] = Variable<double>(scale.value);
    }
    if (memeId.present) {
      map['meme_id'] = Variable<int>(memeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LabelsOnMemeCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('color: $color, ')
          ..write('scale: $scale, ')
          ..write('memeId: $memeId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MemeDatabase extends GeneratedDatabase {
  _$MemeDatabase(QueryExecutor e) : super(e);
  late final $MemesTable memes = $MemesTable(this);
  late final $LabelsOnMemeTable labelsOnMeme = $LabelsOnMemeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [memes, labelsOnMeme];
}
