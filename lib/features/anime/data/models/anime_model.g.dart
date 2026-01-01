// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => _AnimeModel(
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

Map<String, dynamic> _$AnimeModelToJson(_AnimeModel instance) =>
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

_AnimeImages _$AnimeImagesFromJson(Map<String, dynamic> json) => _AnimeImages(
      jpg: ImageType.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: ImageType.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeImagesToJson(_AnimeImages instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

_ImageType _$ImageTypeFromJson(Map<String, dynamic> json) => _ImageType(
      imageUrl: json['image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$ImageTypeToJson(_ImageType instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'large_image_url': instance.largeImageUrl,
    };

_Trailer _$TrailerFromJson(Map<String, dynamic> json) => _Trailer(
      youtubeId: json['youtube_id'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embed_url'] as String?,
    );

Map<String, dynamic> _$TrailerToJson(_Trailer instance) => <String, dynamic>{
      'youtube_id': instance.youtubeId,
      'url': instance.url,
      'embed_url': instance.embedUrl,
    };

_Genre _$GenreFromJson(Map<String, dynamic> json) => _Genre(
      malId: (json['mal_id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$GenreToJson(_Genre instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'name': instance.name,
      'type': instance.type,
    };

_StreamingLink _$StreamingLinkFromJson(Map<String, dynamic> json) =>
    _StreamingLink(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StreamingLinkToJson(_StreamingLink instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
