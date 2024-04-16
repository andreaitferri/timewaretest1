import 'species_dto.dart';

class DetailedSpeciesDTO extends SpeciesDTO {
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

  const DetailedSpeciesDTO({
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

  factory DetailedSpeciesDTO.fromJson(Map<String, dynamic> data) {
    return DetailedSpeciesDTO(
      taxonid: data['taxonid'] ?? 0,
      scientificName: data['scientific_name'] ?? 'Unknown',
      subspecies: data['subspecies'] ?? '',
      rank: data['rank'] ?? '',
      subpopulation: data['subpopulation'] ?? '',
      category: data['category'] ?? '',
      photo: data['photo'] ?? '',
      kingdom: data['kingdom'] ?? '',
      phylum: data['phylum'] ?? '',
      animalClass: data['class'] ?? '',
      order: data['order'] ?? '',
      family: data['family'] ?? '',
      genus: data['genus'] ?? '',
      mainCommonName: data['main_common_name'] ?? '',
      authority: data['authority'] ?? '',
      publishedYear: data['published_year'] as int? ?? 0,
      criteria: data['criteria'] ?? '',
      marineSystem: data['marine_system'] as bool? ?? false,
      freshwaterSystem: data['freshwater_system'] as bool? ?? false,
      terrestrialSystem: data['terrestrial_system'] as bool? ?? false,
      aooKm2: data['aoo_km2'] ?? '',
      eooKm2: data['eoo_km2'] as int? ?? 0,
      elevationUpper: data['elevation_upper'] as int? ?? 0,
      elevationLower: data['elevation_lower'] as int? ?? 0,
      depthUpper: data['depth_upper'] as int? ?? 0,
      depthLower: data['depth_lower'] as int? ?? 0,
      assessor: data['assessor'] ?? '',
      reviewer: data['reviewer'] ?? '',
      errataFlag: data['errata_flag'] as bool? ?? false,
      errataReason: data['errata_reason'] ?? '',
      amendedFlag: data['amended_flag'] as bool? ?? false,
      amendedReason: data['amended_reason'] ?? '',
    );
  }
}
