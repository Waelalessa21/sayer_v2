// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Error value)?  error,TResult Function( PhoneNumberSubmitted value)?  phoneNumberSubmitted,TResult Function( PhoneOTPVerified value)?  phoneOTPVerified,TResult Function( PhoneOTPResend value)?  phoneOTPResend,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case PhoneNumberSubmitted() when phoneNumberSubmitted != null:
return phoneNumberSubmitted(_that);case PhoneOTPVerified() when phoneOTPVerified != null:
return phoneOTPVerified(_that);case PhoneOTPResend() when phoneOTPResend != null:
return phoneOTPResend(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Error value)  error,required TResult Function( PhoneNumberSubmitted value)  phoneNumberSubmitted,required TResult Function( PhoneOTPVerified value)  phoneOTPVerified,required TResult Function( PhoneOTPResend value)  phoneOTPResend,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Error():
return error(_that);case PhoneNumberSubmitted():
return phoneNumberSubmitted(_that);case PhoneOTPVerified():
return phoneOTPVerified(_that);case PhoneOTPResend():
return phoneOTPResend(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Error value)?  error,TResult? Function( PhoneNumberSubmitted value)?  phoneNumberSubmitted,TResult? Function( PhoneOTPVerified value)?  phoneOTPVerified,TResult? Function( PhoneOTPResend value)?  phoneOTPResend,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case PhoneNumberSubmitted() when phoneNumberSubmitted != null:
return phoneNumberSubmitted(_that);case PhoneOTPVerified() when phoneOTPVerified != null:
return phoneOTPVerified(_that);case PhoneOTPResend() when phoneOTPResend != null:
return phoneOTPResend(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ApiErrorModel error)?  error,TResult Function()?  phoneNumberSubmitted,TResult Function()?  phoneOTPVerified,TResult Function()?  phoneOTPResend,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Error() when error != null:
return error(_that.error);case PhoneNumberSubmitted() when phoneNumberSubmitted != null:
return phoneNumberSubmitted();case PhoneOTPVerified() when phoneOTPVerified != null:
return phoneOTPVerified();case PhoneOTPResend() when phoneOTPResend != null:
return phoneOTPResend();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ApiErrorModel error)  error,required TResult Function()  phoneNumberSubmitted,required TResult Function()  phoneOTPVerified,required TResult Function()  phoneOTPResend,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Error():
return error(_that.error);case PhoneNumberSubmitted():
return phoneNumberSubmitted();case PhoneOTPVerified():
return phoneOTPVerified();case PhoneOTPResend():
return phoneOTPResend();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ApiErrorModel error)?  error,TResult? Function()?  phoneNumberSubmitted,TResult? Function()?  phoneOTPVerified,TResult? Function()?  phoneOTPResend,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Error() when error != null:
return error(_that.error);case PhoneNumberSubmitted() when phoneNumberSubmitted != null:
return phoneNumberSubmitted();case PhoneOTPVerified() when phoneOTPVerified != null:
return phoneOTPVerified();case PhoneOTPResend() when phoneOTPResend != null:
return phoneOTPResend();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class Loading implements LoginState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class Error implements LoginState {
  const Error(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'LoginState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class PhoneNumberSubmitted implements LoginState {
  const PhoneNumberSubmitted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneNumberSubmitted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.phoneNumberSubmitted()';
}


}




/// @nodoc


class PhoneOTPVerified implements LoginState {
  const PhoneOTPVerified();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneOTPVerified);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.phoneOTPVerified()';
}


}




/// @nodoc


class PhoneOTPResend implements LoginState {
  const PhoneOTPResend();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneOTPResend);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.phoneOTPResend()';
}


}




// dart format on
