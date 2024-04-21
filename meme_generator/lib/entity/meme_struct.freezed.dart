// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_struct.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemeStruct {
  int get id => throw _privateConstructorUsedError;
  String get backgroundImagePath => throw _privateConstructorUsedError;
  String get previewImagePath => throw _privateConstructorUsedError;
  List<LabelStruct> get labels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemeStructCopyWith<MemeStruct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeStructCopyWith<$Res> {
  factory $MemeStructCopyWith(
          MemeStruct value, $Res Function(MemeStruct) then) =
      _$MemeStructCopyWithImpl<$Res, MemeStruct>;
  @useResult
  $Res call(
      {int id,
      String backgroundImagePath,
      String previewImagePath,
      List<LabelStruct> labels});
}

/// @nodoc
class _$MemeStructCopyWithImpl<$Res, $Val extends MemeStruct>
    implements $MemeStructCopyWith<$Res> {
  _$MemeStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backgroundImagePath = null,
    Object? previewImagePath = null,
    Object? labels = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImagePath: null == backgroundImagePath
          ? _value.backgroundImagePath
          : backgroundImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      previewImagePath: null == previewImagePath
          ? _value.previewImagePath
          : previewImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<LabelStruct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeStructImplCopyWith<$Res>
    implements $MemeStructCopyWith<$Res> {
  factory _$$MemeStructImplCopyWith(
          _$MemeStructImpl value, $Res Function(_$MemeStructImpl) then) =
      __$$MemeStructImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String backgroundImagePath,
      String previewImagePath,
      List<LabelStruct> labels});
}

/// @nodoc
class __$$MemeStructImplCopyWithImpl<$Res>
    extends _$MemeStructCopyWithImpl<$Res, _$MemeStructImpl>
    implements _$$MemeStructImplCopyWith<$Res> {
  __$$MemeStructImplCopyWithImpl(
      _$MemeStructImpl _value, $Res Function(_$MemeStructImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backgroundImagePath = null,
    Object? previewImagePath = null,
    Object? labels = null,
  }) {
    return _then(_$MemeStructImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundImagePath: null == backgroundImagePath
          ? _value.backgroundImagePath
          : backgroundImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      previewImagePath: null == previewImagePath
          ? _value.previewImagePath
          : previewImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      labels: null == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<LabelStruct>,
    ));
  }
}

/// @nodoc

class _$MemeStructImpl extends _MemeStruct {
  const _$MemeStructImpl(
      {required this.id,
      required this.backgroundImagePath,
      required this.previewImagePath,
      required final List<LabelStruct> labels})
      : _labels = labels,
        super._();

  @override
  final int id;
  @override
  final String backgroundImagePath;
  @override
  final String previewImagePath;
  final List<LabelStruct> _labels;
  @override
  List<LabelStruct> get labels {
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labels);
  }

  @override
  String toString() {
    return 'MemeStruct(id: $id, backgroundImagePath: $backgroundImagePath, previewImagePath: $previewImagePath, labels: $labels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeStructImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.backgroundImagePath, backgroundImagePath) ||
                other.backgroundImagePath == backgroundImagePath) &&
            (identical(other.previewImagePath, previewImagePath) ||
                other.previewImagePath == previewImagePath) &&
            const DeepCollectionEquality().equals(other._labels, _labels));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, backgroundImagePath,
      previewImagePath, const DeepCollectionEquality().hash(_labels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeStructImplCopyWith<_$MemeStructImpl> get copyWith =>
      __$$MemeStructImplCopyWithImpl<_$MemeStructImpl>(this, _$identity);
}

abstract class _MemeStruct extends MemeStruct {
  const factory _MemeStruct(
      {required final int id,
      required final String backgroundImagePath,
      required final String previewImagePath,
      required final List<LabelStruct> labels}) = _$MemeStructImpl;
  const _MemeStruct._() : super._();

  @override
  int get id;
  @override
  String get backgroundImagePath;
  @override
  String get previewImagePath;
  @override
  List<LabelStruct> get labels;
  @override
  @JsonKey(ignore: true)
  _$$MemeStructImplCopyWith<_$MemeStructImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
