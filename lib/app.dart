import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:timewaretest1/blocs/species/species_bloc.dart';
import 'package:timewaretest1/blocs/detailedspecies/detailedspecies_bloc.dart';
import 'package:timewaretest1/models/species.dart';
import 'package:timewaretest1/pages/species_details_page.dart';
import 'package:timewaretest1/pages/species_list_page.dart';
import 'package:timewaretest1/repositories/mappers/detailedspecies_mapper.dart';
import 'package:timewaretest1/repositories/species_repository.dart';
import 'package:timewaretest1/repositories/mappers/species_mapper.dart';
import 'package:timewaretest1/services/network/species_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // Mapper
          Provider<SpeciesMapper>(
            create: (_) => SpeciesMapper(),
          ),
          Provider<DetailedSpeciesMapper>(
            create: (_) => DetailedSpeciesMapper(),
          ),
        ],
        // Provider
        child: MultiProvider(
          providers: [
            Provider<SpeciesService>(
              create: (_) => SpeciesService(),
            ),
          ],
          // Repository
          child: MultiRepositoryProvider(
            providers: [
              RepositoryProvider<SpeciesRepository>(
                create: (context) => SpeciesRepository(
                  speciesService: context.read<SpeciesService>(),
                  speciesMapper: context.read<SpeciesMapper>(),
                  detailedSpeciesMapper: context.read<DetailedSpeciesMapper>(),
                ),
              ),
            ],
            // Bloc
            child: MultiBlocProvider(
              providers: [
                BlocProvider<SpeciesBloc>(
                  create: (context) => SpeciesBloc(
                    speciesRepository: context.read<SpeciesRepository>(),
                  ),
                ),
                BlocProvider<DetailedSpeciesBloc>(
                  create: (context) => DetailedSpeciesBloc(
                    speciesRepository: context.read<SpeciesRepository>(),
                  ),
                ),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Timeware Species App',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  scaffoldBackgroundColor: Colors.grey.shade300,
                  appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 4,
                  ),
                ),
                home: const SpeciesListPage(),
                routes: {
                  '/specieslist': (context) => const SpeciesListPage(),
                  '/speciesdetails': (context) => SpeciesDetailsPage(
                        species: ModalRoute.of(context)!.settings.arguments
                            as Species,
                      ),
                },
              ),
            ),
          ),
        ),
      );
}
