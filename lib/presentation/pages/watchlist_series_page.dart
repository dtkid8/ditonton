import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/bloc/watchlist_series_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/tv_series.dart';
import '../widgets/tv_series_card.dart';

class WatchlistSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-series';

  @override
  _WatchlistSeriesPageState createState() => _WatchlistSeriesPageState();
}

class _WatchlistSeriesPageState extends State<WatchlistSeriesPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    // Future.microtask(() =>
    //     Provider.of<WatchlistSeriesNotifier>(context, listen: false)
    //         .fetchWatchlistSeries());
    context.read<WatchlistSeriesCubit>().fetchWatchlistSeries();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    // Provider.of<WatchlistSeriesCubit>(context, listen: false).fetchWatchlistSeries();
    context.read<WatchlistSeriesCubit>().fetchWatchlistSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:

            // Consumer<WatchlistSeriesNotifier>(
            //   builder: (context, data, child) {
            //     if (data.watchlistState == RequestState.Loading) {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else if (data.watchlistState == RequestState.Loaded) {
            //       return ListView.builder(
            //         itemBuilder: (context, index) {
            //           final movie = data.watchlistSeries[index];
            //           return TvSeriesCard(movie);
            //         },
            //         itemCount: data.watchlistSeries.length,
            //       );
            //     } else {
            //       return Center(
            //         key: Key('error_message'),
            //         child: Text(data.message),
            //       );
            //     }
            //   },
            // ),
            BlocBuilder<WatchlistSeriesCubit, GeneralState>(
          builder: (context, state) {
            if (state is GeneralLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GeneralLoadedState) {
              final List<TvSeries> tvSeriesList = state.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = tvSeriesList[index];
                  return TvSeriesCard(movie);
                },
                itemCount: tvSeriesList.length,
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
