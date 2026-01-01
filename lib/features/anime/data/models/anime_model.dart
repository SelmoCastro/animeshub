import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

@freezed
class AnimeModel with _$AnimeModel {
  const factory AnimeModel({
    @JsonKey(name: 'mal_id') required int malId,
    required String title,
    @JsonKey(name: 'title_english') String? titleEnglish,
    required AnimeImages images,
    String? synopsis,
    double? score,
    Trailer? trailer,
    @Default([]) List<Genre> genres,
    @Default([])
    List<StreamingLink>
        streaming, // Links externos frequentemente em endpoint separado ou campo específico
  }) = _AnimeModel;

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}

@freezed
class AnimeImages with _$AnimeImages {
  const factory AnimeImages({
    required ImageType jpg,
    required ImageType webp,
  }) = _AnimeImages;

  factory AnimeImages.fromJson(Map<String, dynamic> json) =>
      _$AnimeImagesFromJson(json);
}

@freezed
class ImageType with _$ImageType {
  const factory ImageType({
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'large_image_url') String? largeImageUrl,
  }) = _ImageType;

  factory ImageType.fromJson(Map<String, dynamic> json) =>
      _$ImageTypeFromJson(json);
}

@freezed
class Trailer with _$Trailer {
  const factory Trailer({
    @JsonKey(name: 'youtube_id') String? youtubeId,
    String? url,
    @JsonKey(name: 'embed_url') String? embedUrl,
  }) = _Trailer;

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    @JsonKey(name: 'mal_id') required int malId,
    required String name,
    required String type,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class StreamingLink with _$StreamingLink {
  const factory StreamingLink({
    required String name,
    required String url,
  }) = _StreamingLink;

  factory StreamingLink.fromJson(Map<String, dynamic> json) =>
      _$StreamingLinkFromJson(json);
}
