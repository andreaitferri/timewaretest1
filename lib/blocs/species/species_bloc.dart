import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timewaretest1/errors/repository_error.dart';
import 'package:timewaretest1/models/species.dart';
import 'package:timewaretest1/repositories/species_repository.dart';

part 'species_event.dart';
part 'species_state.dart';

class SpeciesBloc extends Bloc<SpeciesEvent, SpeciesState> {
  final SpeciesRepository speciesRepository;

  SpeciesBloc({required this.speciesRepository})
      : super(FetchingSpeciesState()) {
    on<FetchSpeciesEvent>(_onFetchSpecies);
  }

  FutureOr<void> _onFetchSpecies(
      FetchSpeciesEvent event, Emitter<SpeciesState> emit) async {
    emit(FetchingSpeciesState());

    try {
      final species = await speciesRepository.fetchSpecies();
      if (species.isEmpty) {
        emit(NoSpeciesState());
      } else {
        emit(FetchedSpeciesState(species));
      }
    } on RepositoryError catch (error) {
      emit(ErrorSpeciesState(error.errorMessage));
    } catch (error) {
      emit(const ErrorSpeciesState("An unknown error occurred"));
    }
  }
}
