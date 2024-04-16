import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:timewaretest1/blocs/species/species_bloc.dart';
import 'package:timewaretest1/repositories/species_repository.dart';
import 'package:timewaretest1/services/network/auth_service.dart';
import 'package:timewaretest1/widgets/species_widget.dart';

class SpeciesListPage extends StatelessWidget {
  const SpeciesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      if (!isUserAuthenticated(context)) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return BlocProvider<SpeciesBloc>(
      create: (_) => SpeciesBloc(
        speciesRepository: context.read<SpeciesRepository>(),
      )..add(const FetchSpeciesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Species List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        body: BlocBuilder<SpeciesBloc, SpeciesState>(
          builder: (context, state) {
            if (state is FetchedSpeciesState) {
              return ListView.builder(
                itemCount: state.species.length,
                itemBuilder: (context, index) =>
                    SpeciesWidget(state.species[index]),
              );
            } else if (state is FetchingSpeciesState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorSpeciesState) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }
            return const Center(child: Text('No species data available'));
          },
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Provider.of<AuthService>(context, listen: false).logout();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  bool isUserAuthenticated(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return authService.isLoggedIn;
  }
}
