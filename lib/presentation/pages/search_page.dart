import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/search/search_event.dart';
import 'package:ditonton/presentation/bloc/search/search_movie_bloc.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_series_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/search/search_series_bloc.dart';
import 'package:ditonton/injection.dart' as di;

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<SearchMovieBloc>()),
        BlocProvider(create: (_) => di.locator<SearchSeriesBloc>()),
      ],
      child: SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String _dropdownValue = "Movie";
  final TextEditingController _textEditingController = TextEditingController();
  final items = [
    'Movie',
    'Series',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DropdownButton(
                  value: _dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null && newValue == "Movie") {
                        // Provider.of<MovieSearchNotifier>(context, listen: false).fetchMovieSearch(_textEditingController.text);
                        context.read<SearchMovieBloc>().add(OnQueryChanged(_textEditingController.text));
                      } else {
                        // Provider.of<TvSeriesSearchNotifier>(context, listen: false).fetchTvSeriesSearch(_textEditingController.text);
                        context.read<SearchSeriesBloc>().add(OnQueryChanged(_textEditingController.text));
                      }
                      _dropdownValue = newValue!;
                    });
                  },
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    onChanged: (query) {
                      if (_dropdownValue == "Movie") {
                        context.read<SearchMovieBloc>().add(OnQueryChanged(query));
                      } else {
                        context.read<SearchSeriesBloc>().add(OnQueryChanged(query));
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Search title',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            _dropdownValue == "Movie"
                ? BlocBuilder<SearchMovieBloc, GeneralState>(
                    builder: (context, state) {
                      if (state is GeneralLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GeneralLoadedState) {
                        final result = state.data;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(movie);
                            },
                            itemCount: result.length,
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Container(),
                        );
                      }
                    },
                  )
                : BlocBuilder<SearchSeriesBloc, GeneralState>(
                    builder: (context, state) {
                      if (state is GeneralLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GeneralLoadedState) {
                        final result = state.data;
                        return Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final series = result[index];
                              return TvSeriesCard(series);
                            },
                            itemCount: result.length,
                          ),
                        );
                      } else {
                        return Expanded(
                          child: Container(),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
