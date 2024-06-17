import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:x_clone/app/domain/entities/tweet/tweet.dart';
import 'package:x_clone/app/domain/usecases/profile/get_profile_tweets.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.getProfileTweets) : super(ProfileInitial()) {
    on<FetchProfileTweets>(_onFetchProfileTweets);
  }
  final GetProfileTweets getProfileTweets;

  Future<void> _onFetchProfileTweets(
    FetchProfileTweets event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoading) return;

    final currentState = state;
    var oldTweets = <TweetEntity>[];
    if (currentState is ProfileLoaded) {
      oldTweets = currentState.tweets;
    }

    emit(ProfileLoading(oldTweets));

    try {
      final tweets = await getProfileTweets(
        userId: event.userId,
        page: event.page,
      );
      emit(ProfileLoaded(tweets: oldTweets + tweets));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
