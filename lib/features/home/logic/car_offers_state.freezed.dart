// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_offers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarOffersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarOffersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarOffersState()';
}


}

/// @nodoc
class $CarOffersStateCopyWith<$Res>  {
$CarOffersStateCopyWith(CarOffersState _, $Res Function(CarOffersState) __);
}


/// Adds pattern-matching-related methods to [CarOffersState].
extension CarOffersStatePatterns on CarOffersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CarOffersLoading value)?  carOffersLoading,TResult Function( CarOffersSuccess value)?  carOffersSuccess,TResult Function( CarOffersError value)?  carOffersError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CarOffersLoading() when carOffersLoading != null:
return carOffersLoading(_that);case CarOffersSuccess() when carOffersSuccess != null:
return carOffersSuccess(_that);case CarOffersError() when carOffersError != null:
return carOffersError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CarOffersLoading value)  carOffersLoading,required TResult Function( CarOffersSuccess value)  carOffersSuccess,required TResult Function( CarOffersError value)  carOffersError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CarOffersLoading():
return carOffersLoading(_that);case CarOffersSuccess():
return carOffersSuccess(_that);case CarOffersError():
return carOffersError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CarOffersLoading value)?  carOffersLoading,TResult? Function( CarOffersSuccess value)?  carOffersSuccess,TResult? Function( CarOffersError value)?  carOffersError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CarOffersLoading() when carOffersLoading != null:
return carOffersLoading(_that);case CarOffersSuccess() when carOffersSuccess != null:
return carOffersSuccess(_that);case CarOffersError() when carOffersError != null:
return carOffersError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  carOffersLoading,TResult Function( List<CarOfferData?>? carOffers)?  carOffersSuccess,TResult Function( ApiErrorModel error)?  carOffersError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CarOffersLoading() when carOffersLoading != null:
return carOffersLoading();case CarOffersSuccess() when carOffersSuccess != null:
return carOffersSuccess(_that.carOffers);case CarOffersError() when carOffersError != null:
return carOffersError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  carOffersLoading,required TResult Function( List<CarOfferData?>? carOffers)  carOffersSuccess,required TResult Function( ApiErrorModel error)  carOffersError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CarOffersLoading():
return carOffersLoading();case CarOffersSuccess():
return carOffersSuccess(_that.carOffers);case CarOffersError():
return carOffersError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  carOffersLoading,TResult? Function( List<CarOfferData?>? carOffers)?  carOffersSuccess,TResult? Function( ApiErrorModel error)?  carOffersError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CarOffersLoading() when carOffersLoading != null:
return carOffersLoading();case CarOffersSuccess() when carOffersSuccess != null:
return carOffersSuccess(_that.carOffers);case CarOffersError() when carOffersError != null:
return carOffersError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CarOffersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarOffersState.initial()';
}


}




/// @nodoc


class CarOffersLoading implements CarOffersState {
  const CarOffersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarOffersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarOffersState.carOffersLoading()';
}


}




/// @nodoc


class CarOffersSuccess implements CarOffersState {
  const CarOffersSuccess(final  List<CarOfferData?>? carOffers): _carOffers = carOffers;
  

 final  List<CarOfferData?>? _carOffers;
 List<CarOfferData?>? get carOffers {
  final value = _carOffers;
  if (value == null) return null;
  if (_carOffers is EqualUnmodifiableListView) return _carOffers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CarOffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarOffersSuccessCopyWith<CarOffersSuccess> get copyWith => _$CarOffersSuccessCopyWithImpl<CarOffersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarOffersSuccess&&const DeepCollectionEquality().equals(other._carOffers, _carOffers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_carOffers));

@override
String toString() {
  return 'CarOffersState.carOffersSuccess(carOffers: $carOffers)';
}


}

/// @nodoc
abstract mixin class $CarOffersSuccessCopyWith<$Res> implements $CarOffersStateCopyWith<$Res> {
  factory $CarOffersSuccessCopyWith(CarOffersSuccess value, $Res Function(CarOffersSuccess) _then) = _$CarOffersSuccessCopyWithImpl;
@useResult
$Res call({
 List<CarOfferData?>? carOffers
});




}
/// @nodoc
class _$CarOffersSuccessCopyWithImpl<$Res>
    implements $CarOffersSuccessCopyWith<$Res> {
  _$CarOffersSuccessCopyWithImpl(this._self, this._then);

  final CarOffersSuccess _self;
  final $Res Function(CarOffersSuccess) _then;

/// Create a copy of CarOffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? carOffers = freezed,}) {
  return _then(CarOffersSuccess(
freezed == carOffers ? _self._carOffers : carOffers // ignore: cast_nullable_to_non_nullable
as List<CarOfferData?>?,
  ));
}


}

/// @nodoc


class CarOffersError implements CarOffersState {
  const CarOffersError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of CarOffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarOffersErrorCopyWith<CarOffersError> get copyWith => _$CarOffersErrorCopyWithImpl<CarOffersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarOffersError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CarOffersState.carOffersError(error: $error)';
}


}

/// @nodoc
abstract mixin class $CarOffersErrorCopyWith<$Res> implements $CarOffersStateCopyWith<$Res> {
  factory $CarOffersErrorCopyWith(CarOffersError value, $Res Function(CarOffersError) _then) = _$CarOffersErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$CarOffersErrorCopyWithImpl<$Res>
    implements $CarOffersErrorCopyWith<$Res> {
  _$CarOffersErrorCopyWithImpl(this._self, this._then);

  final CarOffersError _self;
  final $Res Function(CarOffersError) _then;

/// Create a copy of CarOffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CarOffersError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
