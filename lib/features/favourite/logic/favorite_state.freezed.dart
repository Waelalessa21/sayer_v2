// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState()';
}


}

/// @nodoc
class $FavoriteStateCopyWith<$Res>  {
$FavoriteStateCopyWith(FavoriteState _, $Res Function(FavoriteState) __);
}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( SuccessSended value)?  successSended,TResult Function( SuccessFetch value)?  successFetch,TResult Function( SuccessDelete value)?  successDelete,TResult Function( Error value)?  error,TResult Function( SuccessFound value)?  successFound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessSended() when successSended != null:
return successSended(_that);case SuccessFetch() when successFetch != null:
return successFetch(_that);case SuccessDelete() when successDelete != null:
return successDelete(_that);case Error() when error != null:
return error(_that);case SuccessFound() when successFound != null:
return successFound(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( SuccessSended value)  successSended,required TResult Function( SuccessFetch value)  successFetch,required TResult Function( SuccessDelete value)  successDelete,required TResult Function( Error value)  error,required TResult Function( SuccessFound value)  successFound,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case SuccessSended():
return successSended(_that);case SuccessFetch():
return successFetch(_that);case SuccessDelete():
return successDelete(_that);case Error():
return error(_that);case SuccessFound():
return successFound(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( SuccessSended value)?  successSended,TResult? Function( SuccessFetch value)?  successFetch,TResult? Function( SuccessDelete value)?  successDelete,TResult? Function( Error value)?  error,TResult? Function( SuccessFound value)?  successFound,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case SuccessSended() when successSended != null:
return successSended(_that);case SuccessFetch() when successFetch != null:
return successFetch(_that);case SuccessDelete() when successDelete != null:
return successDelete(_that);case Error() when error != null:
return error(_that);case SuccessFound() when successFound != null:
return successFound(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  successSended,TResult Function( FavoritesModel favoritesCarOffers)?  successFetch,TResult Function()?  successDelete,TResult Function( ApiErrorModel message)?  error,TResult Function()?  successFound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessSended() when successSended != null:
return successSended();case SuccessFetch() when successFetch != null:
return successFetch(_that.favoritesCarOffers);case SuccessDelete() when successDelete != null:
return successDelete();case Error() when error != null:
return error(_that.message);case SuccessFound() when successFound != null:
return successFound();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  successSended,required TResult Function( FavoritesModel favoritesCarOffers)  successFetch,required TResult Function()  successDelete,required TResult Function( ApiErrorModel message)  error,required TResult Function()  successFound,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case SuccessSended():
return successSended();case SuccessFetch():
return successFetch(_that.favoritesCarOffers);case SuccessDelete():
return successDelete();case Error():
return error(_that.message);case SuccessFound():
return successFound();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  successSended,TResult? Function( FavoritesModel favoritesCarOffers)?  successFetch,TResult? Function()?  successDelete,TResult? Function( ApiErrorModel message)?  error,TResult? Function()?  successFound,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case SuccessSended() when successSended != null:
return successSended();case SuccessFetch() when successFetch != null:
return successFetch(_that.favoritesCarOffers);case SuccessDelete() when successDelete != null:
return successDelete();case Error() when error != null:
return error(_that.message);case SuccessFound() when successFound != null:
return successFound();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements FavoriteState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.initial()';
}


}




/// @nodoc


class Loading implements FavoriteState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.loading()';
}


}




/// @nodoc


class SuccessSended implements FavoriteState {
  const SuccessSended();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessSended);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.successSended()';
}


}




/// @nodoc


class SuccessFetch implements FavoriteState {
  const SuccessFetch(this.favoritesCarOffers);
  

 final  FavoritesModel favoritesCarOffers;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessFetchCopyWith<SuccessFetch> get copyWith => _$SuccessFetchCopyWithImpl<SuccessFetch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFetch&&(identical(other.favoritesCarOffers, favoritesCarOffers) || other.favoritesCarOffers == favoritesCarOffers));
}


@override
int get hashCode => Object.hash(runtimeType,favoritesCarOffers);

@override
String toString() {
  return 'FavoriteState.successFetch(favoritesCarOffers: $favoritesCarOffers)';
}


}

/// @nodoc
abstract mixin class $SuccessFetchCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory $SuccessFetchCopyWith(SuccessFetch value, $Res Function(SuccessFetch) _then) = _$SuccessFetchCopyWithImpl;
@useResult
$Res call({
 FavoritesModel favoritesCarOffers
});




}
/// @nodoc
class _$SuccessFetchCopyWithImpl<$Res>
    implements $SuccessFetchCopyWith<$Res> {
  _$SuccessFetchCopyWithImpl(this._self, this._then);

  final SuccessFetch _self;
  final $Res Function(SuccessFetch) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favoritesCarOffers = null,}) {
  return _then(SuccessFetch(
null == favoritesCarOffers ? _self.favoritesCarOffers : favoritesCarOffers // ignore: cast_nullable_to_non_nullable
as FavoritesModel,
  ));
}


}

/// @nodoc


class SuccessDelete implements FavoriteState {
  const SuccessDelete();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessDelete);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.successDelete()';
}


}




/// @nodoc


class Error implements FavoriteState {
  const Error(this.message);
  

 final  ApiErrorModel message;

/// Create a copy of FavoriteState
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
  return 'FavoriteState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
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

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class SuccessFound implements FavoriteState {
  const SuccessFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FavoriteState.successFound()';
}


}




// dart format on
