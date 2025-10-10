// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState()';
}


}

/// @nodoc
class $UserStateCopyWith<$Res>  {
$UserStateCopyWith(UserState _, $Res Function(UserState) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns on UserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( SuccessSended value)?  successSended,TResult Function( SuccessFetch value)?  successFetch,TResult Function( SuccessFetchId value)?  successFetchId,TResult Function( Error value)?  error,TResult Function( UpdateUserSuccess value)?  updateUserSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessSended() when successSended != null:
return successSended(_that);case SuccessFetch() when successFetch != null:
return successFetch(_that);case SuccessFetchId() when successFetchId != null:
return successFetchId(_that);case Error() when error != null:
return error(_that);case UpdateUserSuccess() when updateUserSuccess != null:
return updateUserSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( SuccessSended value)  successSended,required TResult Function( SuccessFetch value)  successFetch,required TResult Function( SuccessFetchId value)  successFetchId,required TResult Function( Error value)  error,required TResult Function( UpdateUserSuccess value)  updateUserSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case SuccessSended():
return successSended(_that);case SuccessFetch():
return successFetch(_that);case SuccessFetchId():
return successFetchId(_that);case Error():
return error(_that);case UpdateUserSuccess():
return updateUserSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( SuccessSended value)?  successSended,TResult? Function( SuccessFetch value)?  successFetch,TResult? Function( SuccessFetchId value)?  successFetchId,TResult? Function( Error value)?  error,TResult? Function( UpdateUserSuccess value)?  updateUserSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessSended() when successSended != null:
return successSended(_that);case SuccessFetch() when successFetch != null:
return successFetch(_that);case SuccessFetchId() when successFetchId != null:
return successFetchId(_that);case Error() when error != null:
return error(_that);case UpdateUserSuccess() when updateUserSuccess != null:
return updateUserSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  successSended,TResult Function( String userName)?  successFetch,TResult Function( int userId)?  successFetchId,TResult Function( ApiErrorModel message)?  error,TResult Function( String userName)?  updateUserSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessSended() when successSended != null:
return successSended();case SuccessFetch() when successFetch != null:
return successFetch(_that.userName);case SuccessFetchId() when successFetchId != null:
return successFetchId(_that.userId);case Error() when error != null:
return error(_that.message);case UpdateUserSuccess() when updateUserSuccess != null:
return updateUserSuccess(_that.userName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  successSended,required TResult Function( String userName)  successFetch,required TResult Function( int userId)  successFetchId,required TResult Function( ApiErrorModel message)  error,required TResult Function( String userName)  updateUserSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case SuccessSended():
return successSended();case SuccessFetch():
return successFetch(_that.userName);case SuccessFetchId():
return successFetchId(_that.userId);case Error():
return error(_that.message);case UpdateUserSuccess():
return updateUserSuccess(_that.userName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  successSended,TResult? Function( String userName)?  successFetch,TResult? Function( int userId)?  successFetchId,TResult? Function( ApiErrorModel message)?  error,TResult? Function( String userName)?  updateUserSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessSended() when successSended != null:
return successSended();case SuccessFetch() when successFetch != null:
return successFetch(_that.userName);case SuccessFetchId() when successFetchId != null:
return successFetchId(_that.userId);case Error() when error != null:
return error(_that.message);case UpdateUserSuccess() when updateUserSuccess != null:
return updateUserSuccess(_that.userName);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.initial()';
}


}




/// @nodoc


class Loading implements UserState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.loading()';
}


}




/// @nodoc


class SuccessSended implements UserState {
  const SuccessSended();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessSended);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState.successSended()';
}


}




/// @nodoc


class SuccessFetch implements UserState {
  const SuccessFetch(this.userName);
  

 final  String userName;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessFetchCopyWith<SuccessFetch> get copyWith => _$SuccessFetchCopyWithImpl<SuccessFetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFetch&&(identical(other.userName, userName) || other.userName == userName));
}


@override
int get hashCode => Object.hash(runtimeType,userName);

@override
String toString() {
  return 'UserState.successFetch(userName: $userName)';
}


}

/// @nodoc
abstract mixin class $SuccessFetchCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $SuccessFetchCopyWith(SuccessFetch value, $Res Function(SuccessFetch) _then) = _$SuccessFetchCopyWithImpl;
@useResult
$Res call({
 String userName
});




}
/// @nodoc
class _$SuccessFetchCopyWithImpl<$Res>
    implements $SuccessFetchCopyWith<$Res> {
  _$SuccessFetchCopyWithImpl(this._self, this._then);

  final SuccessFetch _self;
  final $Res Function(SuccessFetch) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userName = null,}) {
  return _then(SuccessFetch(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SuccessFetchId implements UserState {
  const SuccessFetchId(this.userId);
  

 final  int userId;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessFetchIdCopyWith<SuccessFetchId> get copyWith => _$SuccessFetchIdCopyWithImpl<SuccessFetchId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFetchId&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'UserState.successFetchId(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $SuccessFetchIdCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $SuccessFetchIdCopyWith(SuccessFetchId value, $Res Function(SuccessFetchId) _then) = _$SuccessFetchIdCopyWithImpl;
@useResult
$Res call({
 int userId
});




}
/// @nodoc
class _$SuccessFetchIdCopyWithImpl<$Res>
    implements $SuccessFetchIdCopyWith<$Res> {
  _$SuccessFetchIdCopyWithImpl(this._self, this._then);

  final SuccessFetchId _self;
  final $Res Function(SuccessFetchId) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(SuccessFetchId(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Error implements UserState {
  const Error(this.message);
  

 final  ApiErrorModel message;

/// Create a copy of UserState
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
  return 'UserState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $UserStateCopyWith<$Res> {
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

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpdateUserSuccess implements UserState {
  const UpdateUserSuccess(this.userName);
  

 final  String userName;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserSuccessCopyWith<UpdateUserSuccess> get copyWith => _$UpdateUserSuccessCopyWithImpl<UpdateUserSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserSuccess&&(identical(other.userName, userName) || other.userName == userName));
}


@override
int get hashCode => Object.hash(runtimeType,userName);

@override
String toString() {
  return 'UserState.updateUserSuccess(userName: $userName)';
}


}

/// @nodoc
abstract mixin class $UpdateUserSuccessCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory $UpdateUserSuccessCopyWith(UpdateUserSuccess value, $Res Function(UpdateUserSuccess) _then) = _$UpdateUserSuccessCopyWithImpl;
@useResult
$Res call({
 String userName
});




}
/// @nodoc
class _$UpdateUserSuccessCopyWithImpl<$Res>
    implements $UpdateUserSuccessCopyWith<$Res> {
  _$UpdateUserSuccessCopyWithImpl(this._self, this._then);

  final UpdateUserSuccess _self;
  final $Res Function(UpdateUserSuccess) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userName = null,}) {
  return _then(UpdateUserSuccess(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
