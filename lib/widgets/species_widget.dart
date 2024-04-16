import 'package:flutter/material.dart';
import 'package:timewaretest1/models/species.dart';

class SpeciesWidget extends StatelessWidget {
  final Species species;

  const SpeciesWidget(this.species, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SpeciesDetailsWidget(species),
            ],
          ),
        ),
      );
}

class SpeciesDetailsWidget extends StatelessWidget {
  final Species species;

  const SpeciesDetailsWidget(this.species, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/speciesdetails', arguments: species);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    species.scientificName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Category: ${species.category}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Subpopulation: ${species.subpopulation}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Image.network(
              species.photo,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          ],
        ),
      );
}
