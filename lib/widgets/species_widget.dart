import 'package:flutter/material.dart';
import 'package:timewaretest1/models/species.dart';

class SpeciesWidget extends StatelessWidget {
  final Species species;

  const SpeciesWidget(this.species, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed('/speciesdetails', arguments: species),
                child: _buildWideLayout(context),
              );
            } else {
              return GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed('/speciesdetails', arguments: species),
                child: _buildNarrowLayout(context),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Image.network(
            species.photo,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
        SizedBox(width: screenWidth * 0.01),
        Expanded(
          flex: 4,
          child: _buildDetailsColumn(
            context,
            const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          species.photo,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
        const SizedBox(height: 10),
        _buildDetailsColumn(
          context,
          const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDetailsColumn(BuildContext context, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          species.scientificName,
          style: style,
        ),
        Text(
          'Category: ${species.category}',
          style: style,
        ),
      ],
    );
  }
}
