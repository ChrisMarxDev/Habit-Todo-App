// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  LoginLoadingState loading() {
    return const LoginLoadingState();
  }

  LoginLoggedIn loggedIn({required User user}) {
    return LoginLoggedIn(
      user: user,
    );
  }

  LoginNotLoggedIn loggedOut() {
    return const LoginNotLoggedIn();
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginLoggedIn value) loggedIn,
    required TResult Function(LoginNotLoggedIn value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class $LoginLoadingStateCopyWith<$Res> {
  factory $LoginLoadingStateCopyWith(
          LoginLoadingState value, $Res Function(LoginLoadingState) then) =
      _$LoginLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginLoadingStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginLoadingStateCopyWith<$Res> {
  _$LoginLoadingStateCopyWithImpl(
      LoginLoadingState _value, $Res Function(LoginLoadingState) _then)
      : super(_value, (v) => _then(v as LoginLoadingState));

  @override
  LoginLoadingState get _value => super._value as LoginLoadingState;
}

/// @nodoc

class _$LoginLoadingState implements LoginLoadingState {
  const _$LoginLoadingState();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginLoggedIn value) loggedIn,
    required TResult Function(LoginNotLoggedIn value) loggedOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoadingState implements LoginState {
  const factory LoginLoadingState() = _$LoginLoadingState;
}

/// @nodoc
abstract class $LoginLoggedInCopyWith<$Res> {
  factory $LoginLoggedInCopyWith(
          LoginLoggedIn value, $Res Function(LoginLoggedIn) then) =
      _$LoginLoggedInCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$LoginLoggedInCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginLoggedInCopyWith<$Res> {
  _$LoginLoggedInCopyWithImpl(
      LoginLoggedIn _value, $Res Function(LoginLoggedIn) _then)
      : super(_value, (v) => _then(v as LoginLoggedIn));

  @override
  LoginLoggedIn get _value => super._value as LoginLoggedIn;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(LoginLoggedIn(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$LoginLoggedIn implements LoginLoggedIn {
  const _$LoginLoggedIn({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'LoginState.loggedIn(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginLoggedIn &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $LoginLoggedInCopyWith<LoginLoggedIn> get copyWith =>
      _$LoginLoggedInCopyWithImpl<LoginLoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedIn(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) {
    return loggedIn?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginLoggedIn value) loggedIn,
    required TResult Function(LoginNotLoggedIn value) loggedOut,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class LoginLoggedIn implements LoginState {
  const factory LoginLoggedIn({required User user}) = _$LoginLoggedIn;

  User get user;
  @JsonKey(ignore: true)
  $LoginLoggedInCopyWith<LoginLoggedIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginNotLoggedInCopyWith<$Res> {
  factory $LoginNotLoggedInCopyWith(
          LoginNotLoggedIn value, $Res Function(LoginNotLoggedIn) then) =
      _$LoginNotLoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginNotLoggedInCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginNotLoggedInCopyWith<$Res> {
  _$LoginNotLoggedInCopyWithImpl(
      LoginNotLoggedIn _value, $Res Function(LoginNotLoggedIn) _then)
      : super(_value, (v) => _then(v as LoginNotLoggedIn));

  @override
  LoginNotLoggedIn get _value => super._value as LoginNotLoggedIn;
}

/// @nodoc

class _$LoginNotLoggedIn implements LoginNotLoggedIn {
  const _$LoginNotLoggedIn();

  @override
  String toString() {
    return 'LoginState.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginNotLoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(User user) loggedIn,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(User user)? loggedIn,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginLoggedIn value) loggedIn,
    required TResult Function(LoginNotLoggedIn value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginLoggedIn value)? loggedIn,
    TResult Function(LoginNotLoggedIn value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoginNotLoggedIn implements LoginState {
  const factory LoginNotLoggedIn() = _$LoginNotLoggedIn;
}
