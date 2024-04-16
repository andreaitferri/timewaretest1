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
    print(" enter here ");

    print(
        "Deserializing: taxonid=${data['taxonid']}, scientific_name=${data['scientific_name']}, kingdom=${data['kingdom']}, phylum=${data['phylum']}, class=${data['class']}, order=${data['order']}, family=${data['family']}, genus=${data['genus']}, main_common_name=${data['main_common_name']}, authority=${data['authority']}, published_year=${data['published_year']}, category=${data['category']}, criteria=${data['criteria']}, marine_system=${data['marine_system']}, freshwater_system=${data['freshwater_system']}, terrestrial_system=${data['terrestrial_system']}, aoo_km2=${data['aoo_km2']}, eoo_km2=${data['eoo_km2']}, elevation_upper=${data['elevation_upper']}, elevation_lower=${data['elevation_lower']}, depth_upper=${data['depth_upper']}, depth_lower=${data['depth_lower']}, assessor=${data['assessor']}, reviewer=${data['reviewer']}, errata_flag=${data['errata_flag']}, errata_reason=${data['errata_reason']}, amended_flag=${data['amended_flag']}, amended_reason=${data['amended_reason']}, photo=${data['photo']}");

    return DetailedSpeciesDTO(
      taxonid: data['taxonid'] as int,
      scientificName: data['scientific_name'] as String,
      subspecies: data['subspecies'] as String,
      rank: data['rank'] as String,
      subpopulation: data['subpopulation'] as String,
      category: data['category'] as String,
      photo: data['photo'] as String,
      kingdom: data['kingdom'] as String,
      phylum: data['phylum'] as String,
      animalClass: data['class'] as String,
      order: data['order'] as String,
      family: data['family'] as String,
      genus: data['genus'] as String,
      mainCommonName: data['main_common_name'] as String,
      authority: data['authority'] as String,
      publishedYear: data['published_year'] as int,
      criteria: data['criteria'] as String,
      marineSystem: data['marine_system'] as bool,
      freshwaterSystem: data['freshwater_system'] as bool,
      terrestrialSystem: data['terrestrial_system'] as bool,
      aooKm2: data['aoo_km2'] as String,
      eooKm2: data['eoo_km2'] as int,
      elevationUpper: data['elevation_upper'] as int,
      elevationLower: data['elevation_lower'] as int,
      depthUpper: data['depth_upper'] as int,
      depthLower: data['depth_lower'] as int,
      assessor: data['assessor'] as String,
      reviewer: data['reviewer'] as String,
      errataFlag: data['errata_flag'] as bool,
      errataReason: data['errata_reason'] as String,
      amendedFlag: data['amended_flag'] as bool,
      amendedReason: data['amended_reason'] as String,
    );
  }
}
