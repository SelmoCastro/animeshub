import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:animes_hub/features/stremio/data/stremio_service.dart';

class StremioPlayerPage extends StatefulWidget {
  final String? streamUrl;
  final String title;

  const StremioPlayerPage({
    super.key,
    this.streamUrl,
    required this.title,
  });

  @override
  State<StremioPlayerPage> createState() => _StremioPlayerPageState();
}

class _StremioPlayerPageState extends State<StremioPlayerPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    if (widget.streamUrl == null) {
      setState(() {
        _errorMessage = 'Nenhuma URL de stream fornecida.';
        _isLoading = false;
      });
      return;
    }

    try {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.streamUrl!));
      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              'Erro no Player: $errorMessage',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Falha ao carregar vídeo: $e';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _launchFallback() {
    StremioService().launchStremioApp(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
        leading: const BackButton(color: Colors.white),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator(color: Color(0xFFBB86FC))
            : _errorMessage != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline,
                          color: Colors.red, size: 48),
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _launchFallback,
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Abrir no App Stremio'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFBB86FC),
                          foregroundColor: Colors.black,
                        ),
                      )
                    ],
                  )
                : Chewie(controller: _chewieController!),
      ),
    );
  }
}
