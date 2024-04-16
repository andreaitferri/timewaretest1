part of 'detailedspecies_bloc.dart';

abstract class DetailedSpeciesEvent extends Equatable {
  const DetailedSpeciesEvent();

  @override
  List<Object> get props => [];
}

class FetchDetailedSpeciesEvent extends DetailedSpeciesEvent {
  final int taxonid;

  const FetchDetailedSpeciesEvent(this.taxonid);

  @override
  List<Object> get props => [];
}
