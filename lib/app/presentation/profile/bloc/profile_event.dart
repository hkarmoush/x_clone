part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FetchProfileTweets extends ProfileEvent {
  const FetchProfileTweets({required this.userId, this.page = 1});

  final String userId;
  final int page;

  @override
  List<Object> get props => [userId, page];
}
