import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/pages/details_page.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_card.dart';
import 'package:flutter/material.dart';

class SeeAllPage extends StatelessWidget {
  final String title;
  final List<Anime> animes;

  const SeeAllPage({
    super.key,
    required this.title,
    required this.animes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: Text(
          title.toUpperCase(),
          style:
              const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
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
      ),
    );
  }
}
