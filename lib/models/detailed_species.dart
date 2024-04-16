import 'package:timewaretest1/models/species.dart';

class DetailedSpecies extends Species {
  final String kingdom;
  final String phylum;
  final String animalClass;
  final String order;
  final String family;
  final String genus;
  final String mainCommonName;
  final String authority;
  final int publishedYear;
  final String criteria;
  final bool marineSystem;
  final bool freshwaterSystem;
  final bool terrestrialSystem;
  final String aooKm2;
  final int eooKm2;
  final int elevationUpper;
  final int elevationLower;
  final int depthUpper;
  final int depthLower;
  final String assessor;
  final String reviewer;
  final bool errataFlag;
  final String errataReason;
  final bool amendedFlag;
  final String amendedReason;

  const DetailedSpecies({
    required int taxonid,
    required String scientificName,
    required String subspecies,
    required String rank,
    required String subpopulation,
    required String category,
    required String photo,
    required this.kingdom,
    required this.phylum,
    required this.animalClass,
    required this.order,
    required this.family,
    required this.genus,
    required this.mainCommonName,
    required this.authority,
    required this.publishedYear,
    required this.criteria,
    required this.marineSystem,
    required this.freshwaterSystem,
    required this.terrestrialSystem,
    required this.aooKm2,
    required this.eooKm2,
    required this.elevationUpper,
    required this.elevationLower,
    required this.depthUpper,
    required this.depthLower,
    required this.assessor,
    required this.reviewer,
    required this.errataFlag,
    required this.errataReason,
    required this.amendedFlag,
    required this.amendedReason,
  }) : super(
          taxonid: taxonid,
          scientificName: scientificName,
          subspecies: subspecies,
          rank: rank,
          subpopulation: subpopulation,
          category: category,
          photo: photo,
        );

  @override
  List<Object?> get props => super.props
    ..addAll([
      kingdom,
      phylum,
      animalClass,
      order,
      family,
      genus,
      mainCommonName,
      authority,
      publishedYear,
      criteria,
      marineSystem,
      freshwaterSystem,
      terrestrialSystem,
      aooKm2,
      eooKm2,
      elevationUpper,
      elevationLower,
      depthUpper,
      depthLower,
      assessor,
      reviewer,
      errataFlag,
      errataReason,
      amendedFlag,
      amendedReason,
    ]);
}
