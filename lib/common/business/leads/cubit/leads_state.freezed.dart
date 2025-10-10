// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeadsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState()';
}


}

/// @nodoc
class $LeadsStateCopyWith<$Res>  {
$LeadsStateCopyWith(LeadsState _, $Res Function(LeadsState) __);
}


/// Adds pattern-matching-related methods to [LeadsState].
extension LeadsStatePatterns on LeadsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( SuccessSent value)?  successSent,TResult Function( SuccessFetch value)?  successFetch,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessSent() when successSent != null:
return successSent(_that);case SuccessFetch() when successFetch != null:
return successFetch(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( SuccessSent value)  successSent,required TResult Function( SuccessFetch value)  successFetch,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case SuccessSent():
return successSent(_that);case SuccessFetch():
return successFetch(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( SuccessSent value)?  successSent,TResult? Function( SuccessFetch value)?  successFetch,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessSent() when successSent != null:
return successSent(_that);case SuccessFetch() when successFetch != null:
return successFetch(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  successSent,TResult Function( List<LeadesData>? lead)?  successFetch,TResult Function( ApiErrorModel message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessSent() when successSent != null:
return successSent();case SuccessFetch() when successFetch != null:
return successFetch(_that.lead);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  successSent,required TResult Function( List<LeadesData>? lead)  successFetch,required TResult Function( ApiErrorModel message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case SuccessSent():
return successSent();case SuccessFetch():
return successFetch(_that.lead);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  successSent,TResult? Function( List<LeadesData>? lead)?  successFetch,TResult? Function( ApiErrorModel message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessSent() when successSent != null:
return successSent();case SuccessFetch() when successFetch != null:
return successFetch(_that.lead);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LeadsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState.initial()';
}


}




/// @nodoc


class Loading implements LeadsState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState.loading()';
}


}




/// @nodoc


class SuccessSent implements LeadsState {
  const SuccessSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LeadsState.successSent()';
}


}




/// @nodoc


class SuccessFetch implements LeadsState {
  const SuccessFetch(final  List<LeadesData>? lead): _lead = lead;
  

 final  List<LeadesData>? _lead;
 List<LeadesData>? get lead {
  final value = _lead;
  if (value == null) return null;
  if (_lead is EqualUnmodifiableListView) return _lead;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessFetchCopyWith<SuccessFetch> get copyWith => _$SuccessFetchCopyWithImpl<SuccessFetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFetch&&const DeepCollectionEquality().equals(other._lead, _lead));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lead));

@override
String toString() {
  return 'LeadsState.successFetch(lead: $lead)';
}


}

/// @nodoc
abstract mixin class $SuccessFetchCopyWith<$Res> implements $LeadsStateCopyWith<$Res> {
  factory $SuccessFetchCopyWith(SuccessFetch value, $Res Function(SuccessFetch) _then) = _$SuccessFetchCopyWithImpl;
@useResult
$Res call({
 List<LeadesData>? lead
});




}
/// @nodoc
class _$SuccessFetchCopyWithImpl<$Res>
    implements $SuccessFetchCopyWith<$Res> {
  _$SuccessFetchCopyWithImpl(this._self, this._then);

  final SuccessFetch _self;
  final $Res Function(SuccessFetch) _then;

/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lead = freezed,}) {
  return _then(SuccessFetch(
freezed == lead ? _self._lead : lead // ignore: cast_nullable_to_non_nullable
as List<LeadesData>?,
  ));
}


}

/// @nodoc


class Error implements LeadsState {
  const Error(this.message);
  

 final  ApiErrorModel message;

/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LeadsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $LeadsStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of LeadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
