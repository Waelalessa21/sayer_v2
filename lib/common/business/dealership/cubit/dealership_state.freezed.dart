// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dealership_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DealershipState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealershipState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealershipState()';
}


}

/// @nodoc
class $DealershipStateCopyWith<$Res>  {
$DealershipStateCopyWith(DealershipState _, $Res Function(DealershipState) __);
}


/// Adds pattern-matching-related methods to [DealershipState].
extension DealershipStatePatterns on DealershipState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( DealershipLoading value)?  dealershipLoading,TResult Function( DealershipSuccess value)?  dealershipSuccess,TResult Function( DealershipError value)?  dealershipError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DealershipLoading() when dealershipLoading != null:
return dealershipLoading(_that);case DealershipSuccess() when dealershipSuccess != null:
return dealershipSuccess(_that);case DealershipError() when dealershipError != null:
return dealershipError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( DealershipLoading value)  dealershipLoading,required TResult Function( DealershipSuccess value)  dealershipSuccess,required TResult Function( DealershipError value)  dealershipError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case DealershipLoading():
return dealershipLoading(_that);case DealershipSuccess():
return dealershipSuccess(_that);case DealershipError():
return dealershipError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( DealershipLoading value)?  dealershipLoading,TResult? Function( DealershipSuccess value)?  dealershipSuccess,TResult? Function( DealershipError value)?  dealershipError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case DealershipLoading() when dealershipLoading != null:
return dealershipLoading(_that);case DealershipSuccess() when dealershipSuccess != null:
return dealershipSuccess(_that);case DealershipError() when dealershipError != null:
return dealershipError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  dealershipLoading,TResult Function( List<DealershipData?>? dealerships)?  dealershipSuccess,TResult Function( ApiErrorModel error)?  dealershipError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case DealershipLoading() when dealershipLoading != null:
return dealershipLoading();case DealershipSuccess() when dealershipSuccess != null:
return dealershipSuccess(_that.dealerships);case DealershipError() when dealershipError != null:
return dealershipError(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  dealershipLoading,required TResult Function( List<DealershipData?>? dealerships)  dealershipSuccess,required TResult Function( ApiErrorModel error)  dealershipError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case DealershipLoading():
return dealershipLoading();case DealershipSuccess():
return dealershipSuccess(_that.dealerships);case DealershipError():
return dealershipError(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  dealershipLoading,TResult? Function( List<DealershipData?>? dealerships)?  dealershipSuccess,TResult? Function( ApiErrorModel error)?  dealershipError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case DealershipLoading() when dealershipLoading != null:
return dealershipLoading();case DealershipSuccess() when dealershipSuccess != null:
return dealershipSuccess(_that.dealerships);case DealershipError() when dealershipError != null:
return dealershipError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DealershipState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealershipState.initial()';
}


}




/// @nodoc


class DealershipLoading implements DealershipState {
  const DealershipLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealershipLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealershipState.dealershipLoading()';
}


}




/// @nodoc


class DealershipSuccess implements DealershipState {
  const DealershipSuccess(final  List<DealershipData?>? dealerships): _dealerships = dealerships;
  

 final  List<DealershipData?>? _dealerships;
 List<DealershipData?>? get dealerships {
  final value = _dealerships;
  if (value == null) return null;
  if (_dealerships is EqualUnmodifiableListView) return _dealerships;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DealershipState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealershipSuccessCopyWith<DealershipSuccess> get copyWith => _$DealershipSuccessCopyWithImpl<DealershipSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealershipSuccess&&const DeepCollectionEquality().equals(other._dealerships, _dealerships));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dealerships));

@override
String toString() {
  return 'DealershipState.dealershipSuccess(dealerships: $dealerships)';
}


}

/// @nodoc
abstract mixin class $DealershipSuccessCopyWith<$Res> implements $DealershipStateCopyWith<$Res> {
  factory $DealershipSuccessCopyWith(DealershipSuccess value, $Res Function(DealershipSuccess) _then) = _$DealershipSuccessCopyWithImpl;
@useResult
$Res call({
 List<DealershipData?>? dealerships
});




}
/// @nodoc
class _$DealershipSuccessCopyWithImpl<$Res>
    implements $DealershipSuccessCopyWith<$Res> {
  _$DealershipSuccessCopyWithImpl(this._self, this._then);

  final DealershipSuccess _self;
  final $Res Function(DealershipSuccess) _then;

/// Create a copy of DealershipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dealerships = freezed,}) {
  return _then(DealershipSuccess(
freezed == dealerships ? _self._dealerships : dealerships // ignore: cast_nullable_to_non_nullable
as List<DealershipData?>?,
  ));
}


}

/// @nodoc


class DealershipError implements DealershipState {
  const DealershipError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of DealershipState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealershipErrorCopyWith<DealershipError> get copyWith => _$DealershipErrorCopyWithImpl<DealershipError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealershipError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DealershipState.dealershipError(error: $error)';
}


}

/// @nodoc
abstract mixin class $DealershipErrorCopyWith<$Res> implements $DealershipStateCopyWith<$Res> {
  factory $DealershipErrorCopyWith(DealershipError value, $Res Function(DealershipError) _then) = _$DealershipErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$DealershipErrorCopyWithImpl<$Res>
    implements $DealershipErrorCopyWith<$Res> {
  _$DealershipErrorCopyWithImpl(this._self, this._then);

  final DealershipError _self;
  final $Res Function(DealershipError) _then;

/// Create a copy of DealershipState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DealershipError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
