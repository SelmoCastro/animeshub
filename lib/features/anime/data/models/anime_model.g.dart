// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeModelImpl _$$AnimeModelImplFromJson(Map<String, dynamic> json) =>
    _$AnimeModelImpl(
      malId: (json['mal_id'] as num).toInt(),
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String?,
      images: AnimeImages.fromJson(json['images'] as Map<String, dynamic>),
      synopsis: json['synopsis'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      trailer: json['trailer'] == null
          ? null
          : Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      streaming: (json['streaming'] as List<dynamic>?)
              ?.map((e) => StreamingLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AnimeModelImplToJson(_$AnimeModelImpl instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'images': instance.images,
      'synopsis': instance.synopsis,
      'score': instance.score,
      'trailer': instance.trailer,
      'genres': instance.genres,
      'streaming': instance.streaming,
    };

_$AnimeImagesImpl _$$AnimeImagesImplFromJson(Map<String, dynamic> json) =>
    _$AnimeImagesImpl(
      jpg: ImageType.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: ImageType.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnimeImagesImplToJson(_$AnimeImagesImpl instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

_$ImageTypeImpl _$$ImageTypeImplFromJson(Map<String, dynamic> json) =>
    _$ImageTypeImpl(
      imageUrl: json['image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$$ImageTypeImplToJson(_$ImageTypeImpl instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'large_image_url': instance.largeImageUrl,
    };

_$TrailerImpl _$$TrailerImplFromJson(Map<String, dynamic> json) =>
    _$TrailerImpl(
      youtubeId: json['youtube_id'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embed_url'] as String?,
    );

Map<String, dynamic> _$$TrailerImplToJson(_$TrailerImpl instance) =>
    <String, dynamic>{
      'youtube_id': instance.youtubeId,
      'url': instance.url,
      'embed_url': instance.embedUrl,
    };

_$GenreImpl _$$GenreImplFromJson(Map<String, dynamic> json) => _$GenreImpl(
      malId: (json['mal_id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$GenreImplToJson(_$GenreImpl instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'name': instance.name,
      'type': instance.type,
    };

_$StreamingLinkImpl _$$StreamingLinkImplFromJson(Map<String, dynamic> json) =>
    _$StreamingLinkImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$StreamingLinkImplToJson(_$StreamingLinkImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
