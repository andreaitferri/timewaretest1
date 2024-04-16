import 'package:flutter/material.dart';
import 'package:timewaretest1/models/detailed_species.dart';

class DetailedSpeciesWidget extends StatelessWidget {
  final DetailedSpecies detailedSpecies;

  const DetailedSpeciesWidget(this.detailedSpecies, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DetailedSpeciesInfoWidget(detailedSpecies),
            ],
          ),
        ),
      );
}

class DetailedSpeciesInfoWidget extends StatelessWidget {
  final DetailedSpecies detailedSpecies;

  const DetailedSpeciesInfoWidget(this.detailedSpecies, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kingdom: ${detailedSpecies.kingdom}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'Class: ${detailedSpecies.animalClass}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // Add more detailed fields as necessary
            Text(
              'Main Common Name: ${detailedSpecies.mainCommonName}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Image.network(
              detailedSpecies.photo,
              width:
                  MediaQuery.of(context).size.width * 0.95, // responsive width
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          ],
        ),
      );
}
