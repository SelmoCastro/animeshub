import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class StremioService {
  // Assuming the Stremio Service runs on the same host as the web app (relative)
  // or a specific configured IP. For this MVP, we might need to be flexible.
  // Ideally, this should be configurable.

  // Hardcoded for now based on user's standard VPS setup but can be dynamic.
  // Since the user is running this on a VPS, the browser will access via the VPS IP.
  // We need the PUBLIC IP/Domain of the VPS.
  // For Docker/Web, we can try to guess or let the user configure.

  // Base URL for the Stremio Service (Streaming Engine)
  String get _stremioBaseUrl => 'http://148.230.74.54:11470';

  Future<bool> isServerOnline() async {
    try {
      final response = await http
          .get(Uri.parse('$_stremioBaseUrl/stats.json'))
          .timeout(const Duration(seconds: 2));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Converts a magnet link or external URL into a Stremio Streaming URL
  String getStreamUrl(String videoUrlOrMagnet) {
    // Stremio Server handles magnets by initiating a torrent stream
    // Format: http://<ip>:11470/<infohash>/<fileIdx>
    // BUT, implementing full magnet-to-stream resolving manually is complex.
    // Easiest path: The user needs to have the ADDON configured in Stremio.
    // The app will try to play the stream URL directly if it's an HTTP stream,
    // or open the Stremio App via deep link for complex Torrent/Magnet handling
    // if we can't easily resolve it here without the full Stremio Core.

    // WAIT: The user request is "Backend Bridge... Configurar conexão com Stremio Service".
    // Stremio Service (Streaming Engine) PRIMARILY converts streaming protocols.

    // If the source is ALREADY http (e.g. from an Anime site), we just play it.
    // If it is a MAGNET (from Torrentio addon):
    // The frontend usually asks Stremio Core to resolve.

    // SIMPLIFICATION FOR PHASE 9:
    // We will assume the goal is to play streams that Stremio *Server* can serve.
    // We will construct a "Stream" URL.

    // Actually, standard Stremio deep links are: stremio://detail/...
    return videoUrlOrMagnet;
  }

  Future<void> launchStremioApp(String title) async {
    // Deep link to search or open Stremio
    final Uri url = Uri.parse('stremio://search?search=$title');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Fallback to store or web
      final webUrl =
          Uri.parse('https://web.stremio.com/#/search?search=$title');
      if (await canLaunchUrl(webUrl)) {
        await launchUrl(webUrl);
      }
    }
  // Tenta obter o ID do IMDB via Jikan API para garantir link direto correto no Stremio
  Future<String?> resolveImdbId(int malId) async {
    try {
      final response = await http
          .get(Uri.parse('https://api.jikan.moe/v4/anime/$malId/external'))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final links = data['data'] as List;
        
        // Procura pelo link do IMDB ou "Official Site" que contenha o ID
        final imdbLink = links.firstWhere(
            (l) => (l['name'] as String).toLowerCase() == 'imdb',
            orElse: () => null);

        if (imdbLink != null) {
          final url = imdbLink['url'] as String;
          // Extrai o ID ttXXXXXXX da URL (ex: https://www.imdb.com/title/tt1234567/)
          final uri = Uri.parse(url);
          // Geralmente o ID é o último segmento ou penúltimo se terminar com /
          // Ex: /title/tt1234567/
          final segments = uri.pathSegments;
          for (final segment in segments) {
            if (segment.startsWith('tt')) {
              return segment;
            }
          }
        }
      }
    } catch (_) {
      // Falha silenciosa, retornará null e usará fallback de busca
    }
    return null;
  }
}
