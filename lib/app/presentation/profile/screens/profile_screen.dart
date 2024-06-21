import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';
import 'package:x_clone/app/core/widgets/platform_scaffold.dart';
import 'package:x_clone/app/data/models/user/tweet/tweet_model.dart';
import 'package:x_clone/app/presentation/profile/bloc/profile_bloc.dart';
import 'package:x_clone/app/presentation/profile/screens/widgets/tweet_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.userId, super.key});

  final String userId;

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileTweets(userId: widget.userId));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context
          .read<ProfileBloc>()
          .add(FetchProfileTweets(userId: widget.userId));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: 'Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading && state.oldTweets.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded ||
              (state is ProfileLoading && state.oldTweets.isNotEmpty)) {
            final tweets = state is ProfileLoaded
                ? state.tweets
                : (state as ProfileLoading).oldTweets;
            return ListView.builder(
              controller: _scrollController,
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                final tweet = tweets[index];
                return TweetItem(tweet: TweetModel.fromEntity(tweet));
              },
            );
          } else if (state is ProfileError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
