// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditCubitState {
  MemeStruct get meme => throw _privateConstructorUsedError;
  int get activeLabelIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCubitStateCopyWith<EditCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCubitStateCopyWith<$Res> {
  factory $EditCubitStateCopyWith(
          EditCubitState value, $Res Function(EditCubitState) then) =
      _$EditCubitStateCopyWithImpl<$Res, EditCubitState>;
  @useResult
  $Res call({MemeStruct meme, int activeLabelIndex});

  $MemeStructCopyWith<$Res> get meme;
}

/// @nodoc
class _$EditCubitStateCopyWithImpl<$Res, $Val extends EditCubitState>
    implements $EditCubitStateCopyWith<$Res> {
  _$EditCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meme = null,
    Object? activeLabelIndex = null,
  }) {
    return _then(_value.copyWith(
      meme: null == meme
          ? _value.meme
          : meme // ignore: cast_nullable_to_non_nullable
              as MemeStruct,
      activeLabelIndex: null == activeLabelIndex
          ? _value.activeLabelIndex
          : activeLabelIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemeStructCopyWith<$Res> get meme {
    return $MemeStructCopyWith<$Res>(_value.meme, (value) {
      return _then(_value.copyWith(meme: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditCubitStateImplCopyWith<$Res>
    implements $EditCubitStateCopyWith<$Res> {
  factory _$$EditCubitStateImplCopyWith(_$EditCubitStateImpl value,
          $Res Function(_$EditCubitStateImpl) then) =
      __$$EditCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MemeStruct meme, int activeLabelIndex});

  @override
  $MemeStructCopyWith<$Res> get meme;
}

/// @nodoc
class __$$EditCubitStateImplCopyWithImpl<$Res>
    extends _$EditCubitStateCopyWithImpl<$Res, _$EditCubitStateImpl>
    implements _$$EditCubitStateImplCopyWith<$Res> {
  __$$EditCubitStateImplCopyWithImpl(
      _$EditCubitStateImpl _value, $Res Function(_$EditCubitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meme = null,
    Object? activeLabelIndex = null,
  }) {
    return _then(_$EditCubitStateImpl(
      meme: null == meme
          ? _value.meme
          : meme // ignore: cast_nullable_to_non_nullable
              as MemeStruct,
      activeLabelIndex: null == activeLabelIndex
          ? _value.activeLabelIndex
          : activeLabelIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EditCubitStateImpl extends _EditCubitState {
  const _$EditCubitStateImpl({required this.meme, this.activeLabelIndex = 0})
      : super._();

  @override
  final MemeStruct meme;
  @override
  @JsonKey()
  final int activeLabelIndex;

  @override
  String toString() {
    return 'EditCubitState(meme: $meme, activeLabelIndex: $activeLabelIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditCubitStateImpl &&
            (identical(other.meme, meme) || other.meme == meme) &&
            (identical(other.activeLabelIndex, activeLabelIndex) ||
                other.activeLabelIndex == activeLabelIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, meme, activeLabelIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditCubitStateImplCopyWith<_$EditCubitStateImpl> get copyWith =>
      __$$EditCubitStateImplCopyWithImpl<_$EditCubitStateImpl>(
          this, _$identity);
}

abstract class _EditCubitState extends EditCubitState {
  const factory _EditCubitState(
      {required final MemeStruct meme,
      final int activeLabelIndex}) = _$EditCubitStateImpl;
  const _EditCubitState._() : super._();

  @override
  MemeStruct get meme;
  @override
  int get activeLabelIndex;
  @override
  @JsonKey(ignore: true)
  _$$EditCubitStateImplCopyWith<_$EditCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
