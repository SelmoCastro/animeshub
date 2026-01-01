// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnimeModel {
  @JsonKey(name: 'mal_id')
  int get malId;
  String get title;
  @JsonKey(name: 'title_english')
  String? get titleEnglish;
  AnimeImages get images;
  String? get synopsis;
  double? get score;
  Trailer? get trailer;
  List<Genre> get genres;
  List<StreamingLink> get streaming;

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnimeModelCopyWith<AnimeModel> get copyWith =>
      _$AnimeModelCopyWithImpl<AnimeModel>(this as AnimeModel, _$identity);

  /// Serializes this AnimeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnimeModel &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEnglish, titleEnglish) ||
                other.titleEnglish == titleEnglish) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.trailer, trailer) || other.trailer == trailer) &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            const DeepCollectionEquality().equals(other.streaming, streaming));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      malId,
      title,
      titleEnglish,
      images,
      synopsis,
      score,
      trailer,
      const DeepCollectionEquality().hash(genres),
      const DeepCollectionEquality().hash(streaming));

  @override
  String toString() {
    return 'AnimeModel(malId: $malId, title: $title, titleEnglish: $titleEnglish, images: $images, synopsis: $synopsis, score: $score, trailer: $trailer, genres: $genres, streaming: $streaming)';
  }
}

/// @nodoc
abstract mixin class $AnimeModelCopyWith<$Res> {
  factory $AnimeModelCopyWith(
          AnimeModel value, $Res Function(AnimeModel) _then) =
      _$AnimeModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String title,
      @JsonKey(name: 'title_english') String? titleEnglish,
      AnimeImages images,
      String? synopsis,
      double? score,
      Trailer? trailer,
      List<Genre> genres,
      List<StreamingLink> streaming});

  $AnimeImagesCopyWith<$Res> get images;
  $TrailerCopyWith<$Res>? get trailer;
}

/// @nodoc
class _$AnimeModelCopyWithImpl<$Res> implements $AnimeModelCopyWith<$Res> {
  _$AnimeModelCopyWithImpl(this._self, this._then);

  final AnimeModel _self;
  final $Res Function(AnimeModel) _then;

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? title = null,
    Object? titleEnglish = freezed,
    Object? images = null,
    Object? synopsis = freezed,
    Object? score = freezed,
    Object? trailer = freezed,
    Object? genres = null,
    Object? streaming = null,
  }) {
    return _then(_self.copyWith(
      malId: null == malId
          ? _self.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleEnglish: freezed == titleEnglish
          ? _self.titleEnglish
          : titleEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as AnimeImages,
      synopsis: freezed == synopsis
          ? _self.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      trailer: freezed == trailer
          ? _self.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as Trailer?,
      genres: null == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      streaming: null == streaming
          ? _self.streaming
          : streaming // ignore: cast_nullable_to_non_nullable
              as List<StreamingLink>,
    ));
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeImagesCopyWith<$Res> get images {
    return $AnimeImagesCopyWith<$Res>(_self.images, (value) {
      return _then(_self.copyWith(images: value));
    });
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrailerCopyWith<$Res>? get trailer {
    if (_self.trailer == null) {
      return null;
    }

    return $TrailerCopyWith<$Res>(_self.trailer!, (value) {
      return _then(_self.copyWith(trailer: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AnimeModel implements AnimeModel {
  const _AnimeModel(
      {@JsonKey(name: 'mal_id') required this.malId,
      required this.title,
      @JsonKey(name: 'title_english') this.titleEnglish,
      required this.images,
      this.synopsis,
      this.score,
      this.trailer,
      final List<Genre> genres = const [],
      final List<StreamingLink> streaming = const []})
      : _genres = genres,
        _streaming = streaming;
  factory _AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String title;
  @override
  @JsonKey(name: 'title_english')
  final String? titleEnglish;
  @override
  final AnimeImages images;
  @override
  final String? synopsis;
  @override
  final double? score;
  @override
  final Trailer? trailer;
  final List<Genre> _genres;
  @override
  @JsonKey()
  List<Genre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<StreamingLink> _streaming;
  @override
  @JsonKey()
  List<StreamingLink> get streaming {
    if (_streaming is EqualUnmodifiableListView) return _streaming;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_streaming);
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnimeModelCopyWith<_AnimeModel> get copyWith =>
      __$AnimeModelCopyWithImpl<_AnimeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnimeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnimeModel &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleEnglish, titleEnglish) ||
                other.titleEnglish == titleEnglish) &&
            (identical(other.images, images) || other.images == images) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.trailer, trailer) || other.trailer == trailer) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality()
                .equals(other._streaming, _streaming));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      malId,
      title,
      titleEnglish,
      images,
      synopsis,
      score,
      trailer,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_streaming));

  @override
  String toString() {
    return 'AnimeModel(malId: $malId, title: $title, titleEnglish: $titleEnglish, images: $images, synopsis: $synopsis, score: $score, trailer: $trailer, genres: $genres, streaming: $streaming)';
  }
}

/// @nodoc
abstract mixin class _$AnimeModelCopyWith<$Res>
    implements $AnimeModelCopyWith<$Res> {
  factory _$AnimeModelCopyWith(
          _AnimeModel value, $Res Function(_AnimeModel) _then) =
      __$AnimeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mal_id') int malId,
      String title,
      @JsonKey(name: 'title_english') String? titleEnglish,
      AnimeImages images,
      String? synopsis,
      double? score,
      Trailer? trailer,
      List<Genre> genres,
      List<StreamingLink> streaming});

  @override
  $AnimeImagesCopyWith<$Res> get images;
  @override
  $TrailerCopyWith<$Res>? get trailer;
}

/// @nodoc
class __$AnimeModelCopyWithImpl<$Res> implements _$AnimeModelCopyWith<$Res> {
  __$AnimeModelCopyWithImpl(this._self, this._then);

  final _AnimeModel _self;
  final $Res Function(_AnimeModel) _then;

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? malId = null,
    Object? title = null,
    Object? titleEnglish = freezed,
    Object? images = null,
    Object? synopsis = freezed,
    Object? score = freezed,
    Object? trailer = freezed,
    Object? genres = null,
    Object? streaming = null,
  }) {
    return _then(_AnimeModel(
      malId: null == malId
          ? _self.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleEnglish: freezed == titleEnglish
          ? _self.titleEnglish
          : titleEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as AnimeImages,
      synopsis: freezed == synopsis
          ? _self.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      trailer: freezed == trailer
          ? _self.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as Trailer?,
      genres: null == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      streaming: null == streaming
          ? _self._streaming
          : streaming // ignore: cast_nullable_to_non_nullable
              as List<StreamingLink>,
    ));
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnimeImagesCopyWith<$Res> get images {
    return $AnimeImagesCopyWith<$Res>(_self.images, (value) {
      return _then(_self.copyWith(images: value));
    });
  }

  /// Create a copy of AnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TrailerCopyWith<$Res>? get trailer {
    if (_self.trailer == null) {
      return null;
    }

    return $TrailerCopyWith<$Res>(_self.trailer!, (value) {
      return _then(_self.copyWith(trailer: value));
    });
  }
}

/// @nodoc
mixin _$AnimeImages {
  ImageType get jpg;
  ImageType get webp;

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnimeImagesCopyWith<AnimeImages> get copyWith =>
      _$AnimeImagesCopyWithImpl<AnimeImages>(this as AnimeImages, _$identity);

  /// Serializes this AnimeImages to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnimeImages &&
            (identical(other.jpg, jpg) || other.jpg == jpg) &&
            (identical(other.webp, webp) || other.webp == webp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jpg, webp);

  @override
  String toString() {
    return 'AnimeImages(jpg: $jpg, webp: $webp)';
  }
}

/// @nodoc
abstract mixin class $AnimeImagesCopyWith<$Res> {
  factory $AnimeImagesCopyWith(
          AnimeImages value, $Res Function(AnimeImages) _then) =
      _$AnimeImagesCopyWithImpl;
  @useResult
  $Res call({ImageType jpg, ImageType webp});

  $ImageTypeCopyWith<$Res> get jpg;
  $ImageTypeCopyWith<$Res> get webp;
}

/// @nodoc
class _$AnimeImagesCopyWithImpl<$Res> implements $AnimeImagesCopyWith<$Res> {
  _$AnimeImagesCopyWithImpl(this._self, this._then);

  final AnimeImages _self;
  final $Res Function(AnimeImages) _then;

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jpg = null,
    Object? webp = null,
  }) {
    return _then(_self.copyWith(
      jpg: null == jpg
          ? _self.jpg
          : jpg // ignore: cast_nullable_to_non_nullable
              as ImageType,
      webp: null == webp
          ? _self.webp
          : webp // ignore: cast_nullable_to_non_nullable
              as ImageType,
    ));
  }

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<$Res> get jpg {
    return $ImageTypeCopyWith<$Res>(_self.jpg, (value) {
      return _then(_self.copyWith(jpg: value));
    });
  }

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<$Res> get webp {
    return $ImageTypeCopyWith<$Res>(_self.webp, (value) {
      return _then(_self.copyWith(webp: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AnimeImages implements AnimeImages {
  const _AnimeImages({required this.jpg, required this.webp});
  factory _AnimeImages.fromJson(Map<String, dynamic> json) =>
      _$AnimeImagesFromJson(json);

  @override
  final ImageType jpg;
  @override
  final ImageType webp;

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnimeImagesCopyWith<_AnimeImages> get copyWith =>
      __$AnimeImagesCopyWithImpl<_AnimeImages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnimeImagesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnimeImages &&
            (identical(other.jpg, jpg) || other.jpg == jpg) &&
            (identical(other.webp, webp) || other.webp == webp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jpg, webp);

  @override
  String toString() {
    return 'AnimeImages(jpg: $jpg, webp: $webp)';
  }
}

/// @nodoc
abstract mixin class _$AnimeImagesCopyWith<$Res>
    implements $AnimeImagesCopyWith<$Res> {
  factory _$AnimeImagesCopyWith(
          _AnimeImages value, $Res Function(_AnimeImages) _then) =
      __$AnimeImagesCopyWithImpl;
  @override
  @useResult
  $Res call({ImageType jpg, ImageType webp});

  @override
  $ImageTypeCopyWith<$Res> get jpg;
  @override
  $ImageTypeCopyWith<$Res> get webp;
}

/// @nodoc
class __$AnimeImagesCopyWithImpl<$Res> implements _$AnimeImagesCopyWith<$Res> {
  __$AnimeImagesCopyWithImpl(this._self, this._then);

  final _AnimeImages _self;
  final $Res Function(_AnimeImages) _then;

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jpg = null,
    Object? webp = null,
  }) {
    return _then(_AnimeImages(
      jpg: null == jpg
          ? _self.jpg
          : jpg // ignore: cast_nullable_to_non_nullable
              as ImageType,
      webp: null == webp
          ? _self.webp
          : webp // ignore: cast_nullable_to_non_nullable
              as ImageType,
    ));
  }

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<$Res> get jpg {
    return $ImageTypeCopyWith<$Res>(_self.jpg, (value) {
      return _then(_self.copyWith(jpg: value));
    });
  }

  /// Create a copy of AnimeImages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<$Res> get webp {
    return $ImageTypeCopyWith<$Res>(_self.webp, (value) {
      return _then(_self.copyWith(webp: value));
    });
  }
}

/// @nodoc
mixin _$ImageType {
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'large_image_url')
  String? get largeImageUrl;

  /// Create a copy of ImageType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<ImageType> get copyWith =>
      _$ImageTypeCopyWithImpl<ImageType>(this as ImageType, _$identity);

  /// Serializes this ImageType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageType &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.largeImageUrl, largeImageUrl) ||
                other.largeImageUrl == largeImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, largeImageUrl);

  @override
  String toString() {
    return 'ImageType(imageUrl: $imageUrl, largeImageUrl: $largeImageUrl)';
  }
}

/// @nodoc
abstract mixin class $ImageTypeCopyWith<$Res> {
  factory $ImageTypeCopyWith(ImageType value, $Res Function(ImageType) _then) =
      _$ImageTypeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'large_image_url') String? largeImageUrl});
}

/// @nodoc
class _$ImageTypeCopyWithImpl<$Res> implements $ImageTypeCopyWith<$Res> {
  _$ImageTypeCopyWithImpl(this._self, this._then);

  final ImageType _self;
  final $Res Function(ImageType) _then;

  /// Create a copy of ImageType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? largeImageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      largeImageUrl: freezed == largeImageUrl
          ? _self.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ImageType implements ImageType {
  const _ImageType(
      {@JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'large_image_url') this.largeImageUrl});
  factory _ImageType.fromJson(Map<String, dynamic> json) =>
      _$ImageTypeFromJson(json);

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'large_image_url')
  final String? largeImageUrl;

  /// Create a copy of ImageType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImageTypeCopyWith<_ImageType> get copyWith =>
      __$ImageTypeCopyWithImpl<_ImageType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageType &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.largeImageUrl, largeImageUrl) ||
                other.largeImageUrl == largeImageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, largeImageUrl);

  @override
  String toString() {
    return 'ImageType(imageUrl: $imageUrl, largeImageUrl: $largeImageUrl)';
  }
}

/// @nodoc
abstract mixin class _$ImageTypeCopyWith<$Res>
    implements $ImageTypeCopyWith<$Res> {
  factory _$ImageTypeCopyWith(
          _ImageType value, $Res Function(_ImageType) _then) =
      __$ImageTypeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'large_image_url') String? largeImageUrl});
}

/// @nodoc
class __$ImageTypeCopyWithImpl<$Res> implements _$ImageTypeCopyWith<$Res> {
  __$ImageTypeCopyWithImpl(this._self, this._then);

  final _ImageType _self;
  final $Res Function(_ImageType) _then;

  /// Create a copy of ImageType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUrl = freezed,
    Object? largeImageUrl = freezed,
  }) {
    return _then(_ImageType(
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      largeImageUrl: freezed == largeImageUrl
          ? _self.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Trailer {
  @JsonKey(name: 'youtube_id')
  String? get youtubeId;
  String? get url;
  @JsonKey(name: 'embed_url')
  String? get embedUrl;

  /// Create a copy of Trailer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrailerCopyWith<Trailer> get copyWith =>
      _$TrailerCopyWithImpl<Trailer>(this as Trailer, _$identity);

  /// Serializes this Trailer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Trailer &&
            (identical(other.youtubeId, youtubeId) ||
                other.youtubeId == youtubeId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.embedUrl, embedUrl) ||
                other.embedUrl == embedUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, youtubeId, url, embedUrl);

  @override
  String toString() {
    return 'Trailer(youtubeId: $youtubeId, url: $url, embedUrl: $embedUrl)';
  }
}

/// @nodoc
abstract mixin class $TrailerCopyWith<$Res> {
  factory $TrailerCopyWith(Trailer value, $Res Function(Trailer) _then) =
      _$TrailerCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'youtube_id') String? youtubeId,
      String? url,
      @JsonKey(name: 'embed_url') String? embedUrl});
}

/// @nodoc
class _$TrailerCopyWithImpl<$Res> implements $TrailerCopyWith<$Res> {
  _$TrailerCopyWithImpl(this._self, this._then);

  final Trailer _self;
  final $Res Function(Trailer) _then;

  /// Create a copy of Trailer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? youtubeId = freezed,
    Object? url = freezed,
    Object? embedUrl = freezed,
  }) {
    return _then(_self.copyWith(
      youtubeId: freezed == youtubeId
          ? _self.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      embedUrl: freezed == embedUrl
          ? _self.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Trailer implements Trailer {
  const _Trailer(
      {@JsonKey(name: 'youtube_id') this.youtubeId,
      this.url,
      @JsonKey(name: 'embed_url') this.embedUrl});
  factory _Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  @override
  @JsonKey(name: 'youtube_id')
  final String? youtubeId;
  @override
  final String? url;
  @override
  @JsonKey(name: 'embed_url')
  final String? embedUrl;

  /// Create a copy of Trailer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TrailerCopyWith<_Trailer> get copyWith =>
      __$TrailerCopyWithImpl<_Trailer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TrailerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Trailer &&
            (identical(other.youtubeId, youtubeId) ||
                other.youtubeId == youtubeId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.embedUrl, embedUrl) ||
                other.embedUrl == embedUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, youtubeId, url, embedUrl);

  @override
  String toString() {
    return 'Trailer(youtubeId: $youtubeId, url: $url, embedUrl: $embedUrl)';
  }
}

/// @nodoc
abstract mixin class _$TrailerCopyWith<$Res> implements $TrailerCopyWith<$Res> {
  factory _$TrailerCopyWith(_Trailer value, $Res Function(_Trailer) _then) =
      __$TrailerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'youtube_id') String? youtubeId,
      String? url,
      @JsonKey(name: 'embed_url') String? embedUrl});
}

/// @nodoc
class __$TrailerCopyWithImpl<$Res> implements _$TrailerCopyWith<$Res> {
  __$TrailerCopyWithImpl(this._self, this._then);

  final _Trailer _self;
  final $Res Function(_Trailer) _then;

  /// Create a copy of Trailer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? youtubeId = freezed,
    Object? url = freezed,
    Object? embedUrl = freezed,
  }) {
    return _then(_Trailer(
      youtubeId: freezed == youtubeId
          ? _self.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      embedUrl: freezed == embedUrl
          ? _self.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Genre {
  @JsonKey(name: 'mal_id')
  int get malId;
  String get name;
  String get type;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenreCopyWith<Genre> get copyWith =>
      _$GenreCopyWithImpl<Genre>(this as Genre, _$identity);

  /// Serializes this Genre to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Genre &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, malId, name, type);

  @override
  String toString() {
    return 'Genre(malId: $malId, name: $name, type: $type)';
  }
}

/// @nodoc
abstract mixin class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) _then) =
      _$GenreCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'mal_id') int malId, String name, String type});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res> implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._self, this._then);

  final Genre _self;
  final $Res Function(Genre) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      malId: null == malId
          ? _self.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Genre implements Genre {
  const _Genre(
      {@JsonKey(name: 'mal_id') required this.malId,
      required this.name,
      required this.type});
  factory _Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String name;
  @override
  final String type;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenreCopyWith<_Genre> get copyWith =>
      __$GenreCopyWithImpl<_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenreToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Genre &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, malId, name, type);

  @override
  String toString() {
    return 'Genre(malId: $malId, name: $name, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) _then) =
      __$GenreCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'mal_id') int malId, String name, String type});
}

/// @nodoc
class __$GenreCopyWithImpl<$Res> implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(this._self, this._then);

  final _Genre _self;
  final $Res Function(_Genre) _then;

  /// Create a copy of Genre
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? malId = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_Genre(
      malId: null == malId
          ? _self.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$StreamingLink {
  String get name;
  String get url;

  /// Create a copy of StreamingLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StreamingLinkCopyWith<StreamingLink> get copyWith =>
      _$StreamingLinkCopyWithImpl<StreamingLink>(
          this as StreamingLink, _$identity);

  /// Serializes this StreamingLink to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreamingLink &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @override
  String toString() {
    return 'StreamingLink(name: $name, url: $url)';
  }
}

/// @nodoc
abstract mixin class $StreamingLinkCopyWith<$Res> {
  factory $StreamingLinkCopyWith(
          StreamingLink value, $Res Function(StreamingLink) _then) =
      _$StreamingLinkCopyWithImpl;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$StreamingLinkCopyWithImpl<$Res>
    implements $StreamingLinkCopyWith<$Res> {
  _$StreamingLinkCopyWithImpl(this._self, this._then);

  final StreamingLink _self;
  final $Res Function(StreamingLink) _then;

  /// Create a copy of StreamingLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StreamingLink implements StreamingLink {
  const _StreamingLink({required this.name, required this.url});
  factory _StreamingLink.fromJson(Map<String, dynamic> json) =>
      _$StreamingLinkFromJson(json);

  @override
  final String name;
  @override
  final String url;

  /// Create a copy of StreamingLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StreamingLinkCopyWith<_StreamingLink> get copyWith =>
      __$StreamingLinkCopyWithImpl<_StreamingLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StreamingLinkToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreamingLink &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @override
  String toString() {
    return 'StreamingLink(name: $name, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$StreamingLinkCopyWith<$Res>
    implements $StreamingLinkCopyWith<$Res> {
  factory _$StreamingLinkCopyWith(
          _StreamingLink value, $Res Function(_StreamingLink) _then) =
      __$StreamingLinkCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$StreamingLinkCopyWithImpl<$Res>
    implements _$StreamingLinkCopyWith<$Res> {
  __$StreamingLinkCopyWithImpl(this._self, this._then);

  final _StreamingLink _self;
  final $Res Function(_StreamingLink) _then;

  /// Create a copy of StreamingLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_StreamingLink(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
