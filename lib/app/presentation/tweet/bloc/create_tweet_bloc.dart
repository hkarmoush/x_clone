import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:x_clone/app/domain/usecases/tweet/create_tweet_usecase.dart';

part 'create_tweet_event.dart';
part 'create_tweet_state.dart';

class CreateTweetBloc extends Bloc<CreateTweetEvent, CreateTweetState> {
  CreateTweetBloc(this.createTweetUseCase) : super(CreateTweetInitial()) {
    on<CreateTweet>(_onCreateTweet);
  }

  final CreateTweetUseCase createTweetUseCase;

  Future<void> _onCreateTweet(
    CreateTweet event,
    Emitter<CreateTweetState> emit,
  ) async {
    emit(CreateTweetLoading());

    try {
      await createTweetUseCase(event.content, event.images);
      emit(CreateTweetSuccess());
    } catch (e) {
      emit(CreateTweetError(e.toString()));
    }
  }
}
