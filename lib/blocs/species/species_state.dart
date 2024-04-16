part of 'species_bloc.dart';

abstract class SpeciesState extends Equatable {
  const SpeciesState();

  @override
  List<Object?> get props => [];
}

class FetchingSpeciesState extends SpeciesState {}

class FetchedSpeciesState extends SpeciesState {
  final List<Species> species;

  const FetchedSpeciesState(this.species);

  @override
  List<Object?> get props => [species];
}

class NoSpeciesState extends SpeciesState {}

class ErrorSpeciesState extends SpeciesState {
  final String? errorMessage;

  const ErrorSpeciesState([this.errorMessage]);

  @override
  List<Object?> get props => [errorMessage];
}
