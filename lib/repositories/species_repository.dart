import 'package:timewaretest1/errors/network_error.dart';
import 'package:timewaretest1/errors/repository_error.dart';
import 'package:timewaretest1/models/species.dart';
import 'package:timewaretest1/models/detailed_species.dart';
import 'package:timewaretest1/repositories/mappers/detailedspecies_mapper.dart';
import 'package:timewaretest1/repositories/mappers/species_mapper.dart';
import 'package:timewaretest1/services/network/species_service.dart';

class SpeciesRepository {
  final SpeciesService speciesService;
  final SpeciesMapper speciesMapper;
  final DetailedSpeciesMapper detailedSpeciesMapper;

  SpeciesRepository({
    required this.speciesService,
    required this.speciesMapper,
    required this.detailedSpeciesMapper,
  });

  Future<List<Species>> fetchSpecies() async {
    try {
      final speciesDTOs = await speciesService.fetchSpecies();
      return speciesDTOs.map(speciesMapper.toModel).toList(growable: false);
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch (e) {
      throw RepositoryError('An unexpected error occurred');
    }
  }

  Future<DetailedSpecies> fetchSpeciesDetails(int taxonId) async {
    try {
      final detailedSpeciesDTO =
          await speciesService.fetchSpeciesDetails(taxonId);
      return detailedSpeciesMapper.toModel(detailedSpeciesDTO);
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch (e) {
      throw RepositoryError('An unexpected error occurred');
    }
  }
}
