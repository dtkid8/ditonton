import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/watchlist_movies_cubit.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistMoviesCubit>().fetchWatchlistMovies();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<WatchlistMoviesCubit>().fetchWatchlistMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<WatchlistMoviesCubit, GeneralState>(
          builder: (context, state) {
            if (state is GeneralLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GeneralLoadedState) {
              final List<Movie> moviesList = state.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = moviesList[index];
                  return MovieCard(movie);
                },
                itemCount: moviesList.length,
              );
            } else {
              return Text('Failed');
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
