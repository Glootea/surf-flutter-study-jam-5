// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'label_struct.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LabelStruct {
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Offset get offset => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LabelStructCopyWith<LabelStruct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabelStructCopyWith<$Res> {
  factory $LabelStructCopyWith(
          LabelStruct value, $Res Function(LabelStruct) then) =
      _$LabelStructCopyWithImpl<$Res, LabelStruct>;
  @useResult
  $Res call({int id, String text, Offset offset, Color color, double scale});
}

/// @nodoc
class _$LabelStructCopyWithImpl<$Res, $Val extends LabelStruct>
    implements $LabelStructCopyWith<$Res> {
  _$LabelStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? offset = null,
    Object? color = null,
    Object? scale = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LabelStructImplCopyWith<$Res>
    implements $LabelStructCopyWith<$Res> {
  factory _$$LabelStructImplCopyWith(
          _$LabelStructImpl value, $Res Function(_$LabelStructImpl) then) =
      __$$LabelStructImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String text, Offset offset, Color color, double scale});
}

/// @nodoc
class __$$LabelStructImplCopyWithImpl<$Res>
    extends _$LabelStructCopyWithImpl<$Res, _$LabelStructImpl>
    implements _$$LabelStructImplCopyWith<$Res> {
  __$$LabelStructImplCopyWithImpl(
      _$LabelStructImpl _value, $Res Function(_$LabelStructImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? offset = null,
    Object? color = null,
    Object? scale = null,
  }) {
    return _then(_$LabelStructImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$LabelStructImpl implements _LabelStruct {
  const _$LabelStructImpl(
      {required this.id,
      required this.text,
      required this.offset,
      required this.color,
      required this.scale});

  @override
  final int id;
  @override
  final String text;
  @override
  final Offset offset;
  @override
  final Color color;
  @override
  final double scale;

  @override
  String toString() {
    return 'LabelStruct(id: $id, text: $text, offset: $offset, color: $color, scale: $scale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabelStructImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.scale, scale) || other.scale == scale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, text, offset, color, scale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LabelStructImplCopyWith<_$LabelStructImpl> get copyWith =>
      __$$LabelStructImplCopyWithImpl<_$LabelStructImpl>(this, _$identity);
}

abstract class _LabelStruct implements LabelStruct {
  const factory _LabelStruct(
      {required final int id,
      required final String text,
      required final Offset offset,
      required final Color color,
      required final double scale}) = _$LabelStructImpl;

  @override
  int get id;
  @override
  String get text;
  @override
  Offset get offset;
  @override
  Color get color;
  @override
  double get scale;
  @override
  @JsonKey(ignore: true)
  _$$LabelStructImplCopyWith<_$LabelStructImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
