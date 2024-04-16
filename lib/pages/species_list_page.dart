import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timewaretest1/blocs/species/species_bloc.dart';
import 'package:timewaretest1/repositories/species_repository.dart';
import 'package:timewaretest1/widgets/species_widget.dart';
import 'package:timewaretest1/models/species.dart';

class SpeciesListPage extends StatelessWidget {
  const SpeciesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assumendo che tu abbia già un'istanza di SpeciesRepository disponibile tramite RepositoryProvider più in alto nell'albero
    return BlocProvider<SpeciesBloc>(
      create: (_) => SpeciesBloc(
        speciesRepository: context.read<SpeciesRepository>(),
      )..add(FetchSpeciesEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('Species List')),
        body: BlocBuilder<SpeciesBloc, SpeciesState>(
          builder: (context, state) {
            if (state is FetchedSpeciesState) {
              return ListView.builder(
                itemCount: state.species.length,
                itemBuilder: (context, index) =>
                    SpeciesWidget(state.species[index]),
              );
            } else if (state is FetchingSpeciesState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErrorSpeciesState) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }
            // Handle other states or default case
            return const Center(child: Text('No species data available'));
          },
        ),
      ),
    );
  }
}
