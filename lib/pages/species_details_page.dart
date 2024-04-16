import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timewaretest1/blocs/detailedspecies/detailedspecies_bloc.dart';
import 'package:timewaretest1/models/species.dart';
import 'package:timewaretest1/repositories/species_repository.dart';
import 'package:timewaretest1/widgets/detailedspecies_widget.dart';

class SpeciesDetailsPage extends StatelessWidget {
  final Species species;

  const SpeciesDetailsPage({Key? key, required this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailedSpeciesBloc(
        speciesRepository: context.read<SpeciesRepository>(),
      )..add(FetchDetailedSpeciesEvent(species.taxonid)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Species Details'),
        ),
        body: BlocBuilder<DetailedSpeciesBloc, DetailedSpeciesState>(
          builder: (context, state) {
            if (state is FetchedDetailedSpeciesState) {
              return DetailedSpeciesWidget(state.detailedspecies);
            } else if (state is ErrorDetailedSpeciesState) {
              return Center(
                child: Text(
                  state.errorMessage ?? 'Error loading detailed species',
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
