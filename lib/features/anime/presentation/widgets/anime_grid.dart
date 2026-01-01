import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/pages/details_page.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_card.dart';
import 'package:flutter/material.dart';

class AnimeGrid extends StatelessWidget {
  final List<Anime> animes;

  const AnimeGrid({super.key, required this.animes});

  @override
  Widget build(BuildContext context) {
    if (animes.isEmpty) {
      return const Center(child: Text('Nenhum anime encontrado.'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70, // Ajustar para proporção do poster
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: animes.length,
      itemBuilder: (context, index) {
        final anime = animes[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(anime: anime),
              ),
            );
          },
          child: AnimeCard(anime: anime),
        );
      },
    );
  }
}
