part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  const ProfileLoading(this.oldTweets);

  final List<TweetEntity> oldTweets;

  @override
  List<Object> get props => [oldTweets];
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required this.tweets});

  final List<TweetEntity> tweets;

  @override
  List<Object> get props => [tweets];
}

class ProfileError extends ProfileState {
  const ProfileError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
