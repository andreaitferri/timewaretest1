part of 'detailedspecies_bloc.dart';

abstract class DetailedSpeciesState extends Equatable {
  const DetailedSpeciesState();

  @override
  List<Object?> get props => [];
}

class FetchingDetailedSpeciesState extends DetailedSpeciesState {}

class FetchedDetailedSpeciesState extends DetailedSpeciesState {
  final DetailedSpecies detailedspecies;

  const FetchedDetailedSpeciesState(this.detailedspecies);

  @override
  List<Object?> get props => [detailedspecies];
}

class NoDetailedSpeciesState extends DetailedSpeciesState {}

class ErrorDetailedSpeciesState extends DetailedSpeciesState {
  final String? errorMessage;

  const ErrorDetailedSpeciesState([this.errorMessage]);

  @override
  List<Object?> get props => [errorMessage];
}
