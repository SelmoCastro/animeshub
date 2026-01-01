import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/pages/details_page.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_card.dart';
import 'package:flutter/material.dart';

class AnimeSectionList extends StatelessWidget {
  final String title;
  final List<Anime> animes;

  const AnimeSectionList({
    super.key,
    required this.title,
    required this.animes,
  });

  @override
  Widget build(BuildContext context) {
    if (animes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 240, // Altura fixa para o carrossel
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: animes.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final anime = animes[index];
              return SizedBox(
                width: 160, // Largura fixa do card no carrossel
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(anime: anime),
                      ),
                    );
                  },
                  child: AnimeCard(anime: anime),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
