import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timewaretest1/errors/repository_error.dart';
import 'package:timewaretest1/models/detailed_species.dart';
import 'package:timewaretest1/repositories/species_repository.dart';

part 'detailedspecies_event.dart';
part 'detailedspecies_state.dart';

class DetailedSpeciesBloc
    extends Bloc<DetailedSpeciesEvent, DetailedSpeciesState> {
  final SpeciesRepository speciesRepository;

  DetailedSpeciesBloc({required this.speciesRepository})
      : super(FetchingDetailedSpeciesState()) {
    on<FetchDetailedSpeciesEvent>(_onFetchDetailedSpecies);
  }

  FutureOr<void> _onFetchDetailedSpecies(FetchDetailedSpeciesEvent event,
      Emitter<DetailedSpeciesState> emit) async {
    emit(FetchingDetailedSpeciesState());

    try {
      final detailedSpecies =
          await speciesRepository.fetchSpeciesDetails(event.taxonid);
      emit(FetchedDetailedSpeciesState(detailedSpecies));
    } on RepositoryError catch (error) {
      emit(ErrorDetailedSpeciesState(error.errorMessage));
    } catch (error) {
      emit(const ErrorDetailedSpeciesState("An unknown error occurred"));
    }
  }
}
