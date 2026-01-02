import 'dart:async';
import 'package:animes_hub/features/stremio/data/stremio_service.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Note: Conditional imports would be better, but we are keeping it simple for this file structure.
import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' as web;

class StremioPlayerPage extends StatefulWidget {
  final String? streamUrl;
  final String title;
  final int? malId; // ID para Deep Link direto

  const StremioPlayerPage({
    super.key,
    this.streamUrl,
    required this.title,
    this.malId,
  });

  @override
  State<StremioPlayerPage> createState() => _StremioPlayerPageState();
}

class _StremioPlayerPageState extends State<StremioPlayerPage> {
  // Video Player specific
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  // WebView specific
  WebViewController? _webViewController;

  bool _isLoading = true;
  String? _errorMessage;
  bool _useWebView = false;
  final String _viewId = 'stremio-web-view';

  // Toggle between Direct Link and Search
  // Padrão: Busca (false), pois deep link direto (true) falha sem IMDB/Kitsu ID mapeado.
  bool _isDirectLink = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    if (widget.streamUrl != null) {
      // Native Player Mode
      await _initializeNativePlayer(widget.streamUrl!);
    } else {
      // WebView/IFrame Mode
      _useWebView = true;
      _isDirectLink = widget.malId != null; // Try direct link if ID exists
      _initializeWebView();
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _initializeNativePlayer(String url) async {
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        errorBuilder: (context, errorMessage) {
          return Center(
              child: Text('Erro: $errorMessage',
                  style: const TextStyle(color: Colors.white)));
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

  void _initializeWebView() {
    // Construct URL: Direct Deep Link or Search Fallback
    String url;
    if (_isDirectLink && widget.malId != null) {
      // Try mapping MAL ID to Stremio. 'series' is the most common type for Anime.
      // Format: mal:<id> is supported by some addons (like Anime Kitsu).
      // We will try the standard Stremio deep link pattern for MAL.
      url = 'https://web.stremio.com/#/detail/series/mal:${widget.malId}';
    } else {
      url =
          'https://web.stremio.com/#/search?search=${Uri.encodeComponent(widget.title)}';
    }

    if (kIsWeb) {
      // Register IFrame factory for Web
      // ignore: undefined_prefixed_name
      ui_web.platformViewRegistry.registerViewFactory(
        _viewId,
        (int viewId) {
          final iframe = web.HTMLIFrameElement();
          iframe.src = url;
          iframe.style.border = 'none';
          iframe.style.width = '100%';
          iframe.style.height = '100%';
          iframe.allow =
              "autoplay; fullscreen; encrypted-media; picture-in-picture";
          return iframe;
        },
      );
    } else {
      // Mobile WebView Init
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse(url));
    }
  }

  void _toggleViewMode() {
    setState(() {
      _isDirectLink = !_isDirectLink;
      _isLoading = true;
    });
    // Re-init webview with new URL
    _initializeWebView();
    // Small delay to refresh UI
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(_useWebView
            ? (_isDirectLink ? 'Detalhes (Direto)' : 'Buscar no Stremio')
            : widget.title),
        leading: const BackButton(color: Colors.white),
        actions: [
          if (_useWebView)
            IconButton(
              icon: Icon(_isDirectLink ? Icons.search : Icons.link),
              onPressed: _toggleViewMode,
              tooltip:
                  _isDirectLink ? 'Mudar para Busca' : 'Tentar Link Direto',
            ),
          if (_useWebView)
            IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: () => StremioService().launchStremioApp(widget.title),
              tooltip: 'Abrir Externamente',
            )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
          child: CircularProgressIndicator(color: Color(0xFFBB86FC)));
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => StremioService().launchStremioApp(widget.title),
              child: const Text('Tentar no App Stremio'),
            )
          ],
        ),
      );
    }

    if (_useWebView) {
      if (kIsWeb) {
        return HtmlElementView(viewType: _viewId);
      } else {
        return WebViewWidget(controller: _webViewController!);
      }
    }

    return Chewie(controller: _chewieController!);
  }
}
