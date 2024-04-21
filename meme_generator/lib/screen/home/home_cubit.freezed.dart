// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeScreenState {
  List<MemeStruct> get memes => throw _privateConstructorUsedError;
  Set<int> get selectedItemIDs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res, HomeScreenState>;
  @useResult
  $Res call({List<MemeStruct> memes, Set<int> selectedItemIDs});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res, $Val extends HomeScreenState> implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memes = null,
    Object? selectedItemIDs = null,
  }) {
    return _then(_value.copyWith(
      memes: null == memes
          ? _value.memes
          : memes // ignore: cast_nullable_to_non_nullable
              as List<MemeStruct>,
      selectedItemIDs: null == selectedItemIDs
          ? _value.selectedItemIDs
          : selectedItemIDs // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeScreenStateImplCopyWith<$Res> implements $HomeScreenStateCopyWith<$Res> {
  factory _$$HomeScreenStateImplCopyWith(_$HomeScreenStateImpl value, $Res Function(_$HomeScreenStateImpl) then) =
      __$$HomeScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MemeStruct> memes, Set<int> selectedItemIDs});
}

/// @nodoc
class __$$HomeScreenStateImplCopyWithImpl<$Res> extends _$HomeScreenStateCopyWithImpl<$Res, _$HomeScreenStateImpl>
    implements _$$HomeScreenStateImplCopyWith<$Res> {
  __$$HomeScreenStateImplCopyWithImpl(_$HomeScreenStateImpl _value, $Res Function(_$HomeScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memes = null,
    Object? selectedItemIDs = null,
  }) {
    return _then(_$HomeScreenStateImpl(
      memes: null == memes
          ? _value._memes
          : memes // ignore: cast_nullable_to_non_nullable
              as List<MemeStruct>,
      selectedItemIDs: null == selectedItemIDs
          ? _value._selectedItemIDs
          : selectedItemIDs // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$HomeScreenStateImpl extends _HomeScreenState {
  const _$HomeScreenStateImpl({final List<MemeStruct> memes = const [], final Set<int> selectedItemIDs = const {}})
      : _memes = memes,
        _selectedItemIDs = selectedItemIDs,
        super._();

  final List<MemeStruct> _memes;
  @override
  @JsonKey()
  List<MemeStruct> get memes {
    if (_memes is EqualUnmodifiableListView) return _memes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memes);
  }

  final Set<int> _selectedItemIDs;
  @override
  @JsonKey()
  Set<int> get selectedItemIDs {
    if (_selectedItemIDs is EqualUnmodifiableSetView) return _selectedItemIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedItemIDs);
  }

  @override
  String toString() {
    return 'HomeScreenState(memes: $memes, selectedItemIDs: $selectedItemIDs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenStateImpl &&
            const DeepCollectionEquality().equals(other._memes, _memes) &&
            const DeepCollectionEquality().equals(other._selectedItemIDs, _selectedItemIDs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_memes), const DeepCollectionEquality().hash(_selectedItemIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeScreenStateImplCopyWith<_$HomeScreenStateImpl> get copyWith =>
      __$$HomeScreenStateImplCopyWithImpl<_$HomeScreenStateImpl>(this, _$identity);
}

abstract class _HomeScreenState extends HomeScreenState {
  const factory _HomeScreenState({final List<MemeStruct> memes, final Set<int> selectedItemIDs}) =
      _$HomeScreenStateImpl;
  const _HomeScreenState._() : super._();

  @override
  List<MemeStruct> get memes;
  @override
  Set<int> get selectedItemIDs;
  @override
  @JsonKey(ignore: true)
  _$$HomeScreenStateImplCopyWith<_$HomeScreenStateImpl> get copyWith => throw _privateConstructorUsedError;
}
