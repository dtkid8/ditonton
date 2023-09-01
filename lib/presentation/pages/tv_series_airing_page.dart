import 'package:ditonton/presentation/bloc/airing_tv_series_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/general_state.dart';
import '../widgets/tv_series_card.dart';

class TvSeriesAiringPage extends StatefulWidget {
  static const ROUTE_NAME = '/airing-series';

  @override
  _TvSeriesAiringPageState createState() => _TvSeriesAiringPageState();
}

class _TvSeriesAiringPageState extends State<TvSeriesAiringPage> {
  @override
  void initState() {
    super.initState();
     context.read<AiringTvSeriesCubit>().fetchAiringTvSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: 
        BlocBuilder<AiringTvSeriesCubit, GeneralState>(
          builder: (context, state) {
            if (state is GeneralLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GeneralLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final   series = state.data.tvSeries[index];
                  return TvSeriesCard(series);
                },
                itemCount: state.data.tvSeries,
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
