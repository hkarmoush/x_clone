part of 'create_tweet_bloc.dart';

abstract class CreateTweetState extends Equatable {
  const CreateTweetState();

  @override
  List<Object> get props => [];
}

class CreateTweetInitial extends CreateTweetState {}

class CreateTweetLoading extends CreateTweetState {}

class CreateTweetSuccess extends CreateTweetState {}

class CreateTweetError extends CreateTweetState {
  const CreateTweetError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
