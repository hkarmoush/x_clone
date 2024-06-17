// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TweetModel _$TweetModelFromJson(Map<String, dynamic> json) {
  return _TweetModel.fromJson(json);
}

/// @nodoc
mixin _$TweetModel {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  dynamic get likes => throw _privateConstructorUsedError;
  int get retweets => throw _privateConstructorUsedError;
  int get replies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetModelCopyWith<TweetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetModelCopyWith<$Res> {
  factory $TweetModelCopyWith(
          TweetModel value, $Res Function(TweetModel) then) =
      _$TweetModelCopyWithImpl<$Res, TweetModel>;
  @useResult
  $Res call(
      {String id,
      String content,
      String authorId,
      DateTime timestamp,
      dynamic likes,
      int retweets,
      int replies});
}

/// @nodoc
class _$TweetModelCopyWithImpl<$Res, $Val extends TweetModel>
    implements $TweetModelCopyWith<$Res> {
  _$TweetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? authorId = null,
    Object? timestamp = null,
    Object? likes = freezed,
    Object? retweets = null,
    Object? replies = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      retweets: null == retweets
          ? _value.retweets
          : retweets // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TweetModelImplCopyWith<$Res>
    implements $TweetModelCopyWith<$Res> {
  factory _$$TweetModelImplCopyWith(
          _$TweetModelImpl value, $Res Function(_$TweetModelImpl) then) =
      __$$TweetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String authorId,
      DateTime timestamp,
      dynamic likes,
      int retweets,
      int replies});
}

/// @nodoc
class __$$TweetModelImplCopyWithImpl<$Res>
    extends _$TweetModelCopyWithImpl<$Res, _$TweetModelImpl>
    implements _$$TweetModelImplCopyWith<$Res> {
  __$$TweetModelImplCopyWithImpl(
      _$TweetModelImpl _value, $Res Function(_$TweetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? authorId = null,
    Object? timestamp = null,
    Object? likes = freezed,
    Object? retweets = null,
    Object? replies = null,
  }) {
    return _then(_$TweetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likes: freezed == likes ? _value.likes! : likes,
      retweets: null == retweets
          ? _value.retweets
          : retweets // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TweetModelImpl implements _TweetModel {
  const _$TweetModelImpl(
      {required this.id,
      required this.content,
      required this.authorId,
      required this.timestamp,
      this.likes = 0,
      this.retweets = 0,
      this.replies = 0});

  factory _$TweetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TweetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String authorId;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final dynamic likes;
  @override
  @JsonKey()
  final int retweets;
  @override
  @JsonKey()
  final int replies;

  @override
  String toString() {
    return 'TweetModel(id: $id, content: $content, authorId: $authorId, timestamp: $timestamp, likes: $likes, retweets: $retweets, replies: $replies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            (identical(other.retweets, retweets) ||
                other.retweets == retweets) &&
            (identical(other.replies, replies) || other.replies == replies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, authorId, timestamp,
      const DeepCollectionEquality().hash(likes), retweets, replies);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetModelImplCopyWith<_$TweetModelImpl> get copyWith =>
      __$$TweetModelImplCopyWithImpl<_$TweetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TweetModelImplToJson(
      this,
    );
  }
}

abstract class _TweetModel implements TweetModel {
  const factory _TweetModel(
      {required final String id,
      required final String content,
      required final String authorId,
      required final DateTime timestamp,
      final dynamic likes,
      final int retweets,
      final int replies}) = _$TweetModelImpl;

  factory _TweetModel.fromJson(Map<String, dynamic> json) =
      _$TweetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get authorId;
  @override
  DateTime get timestamp;
  @override
  dynamic get likes;
  @override
  int get retweets;
  @override
  int get replies;
  @override
  @JsonKey(ignore: true)
  _$$TweetModelImplCopyWith<_$TweetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
