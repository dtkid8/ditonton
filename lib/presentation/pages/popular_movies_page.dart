import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/popular_movies_cubit.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
       context.read<PopularMoviesCubit>().fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
         BlocBuilder<PopularMoviesCubit, GeneralState>(
          builder: (context, state) {
            if (state is GeneralLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GeneralLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final   Movie movies = state.data[index];
                  return MovieCard(movies);
                },
                itemCount: state.data.length,
              );
            } else if (state is GeneralErrorState) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
