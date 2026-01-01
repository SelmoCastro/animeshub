// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) {
  return _AnimeModel.fromJson(json);
}

/// @nodoc
mixin _$AnimeModel {
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_english')
  String? get titleEnglish => throw _privateConstructorUsedError;
  AnimeImages get images => throw _privateConstructorUsedError;
  String? get synopsis => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  Trailer? get trailer => throw _privateConstructorUsedError;
  List<Genre> get genres => throw _privateConstructorUsedError;
  List<StreamingLink> get streaming => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeModelCopyWith<AnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeModelCopyWith<$Res> {
  factory $AnimeModelCopyWith(
          AnimeModel value, $Res Function(AnimeModel) then) =
      _$AnimeModelCopyWithImpl<$Res, AnimeModel>;
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
class _$AnimeModelCopyWithImpl<$Res, $Val extends AnimeModel>
    implements $AnimeModelCopyWith<$Res> {
  _$AnimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleEnglish: freezed == titleEnglish
          ? _value.titleEnglish
          : titleEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as AnimeImages,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as Trailer?,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      streaming: null == streaming
          ? _value.streaming
          : streaming // ignore: cast_nullable_to_non_nullable
              as List<StreamingLink>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeImagesCopyWith<$Res> get images {
    return $AnimeImagesCopyWith<$Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TrailerCopyWith<$Res>? get trailer {
    if (_value.trailer == null) {
      return null;
    }

    return $TrailerCopyWith<$Res>(_value.trailer!, (value) {
      return _then(_value.copyWith(trailer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeModelImplCopyWith<$Res>
    implements $AnimeModelCopyWith<$Res> {
  factory _$$AnimeModelImplCopyWith(
          _$AnimeModelImpl value, $Res Function(_$AnimeModelImpl) then) =
      __$$AnimeModelImplCopyWithImpl<$Res>;
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
class __$$AnimeModelImplCopyWithImpl<$Res>
    extends _$AnimeModelCopyWithImpl<$Res, _$AnimeModelImpl>
    implements _$$AnimeModelImplCopyWith<$Res> {
  __$$AnimeModelImplCopyWithImpl(
      _$AnimeModelImpl _value, $Res Function(_$AnimeModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$AnimeModelImpl(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleEnglish: freezed == titleEnglish
          ? _value.titleEnglish
          : titleEnglish // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as AnimeImages,
      synopsis: freezed == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      trailer: freezed == trailer
          ? _value.trailer
          : trailer // ignore: cast_nullable_to_non_nullable
              as Trailer?,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      streaming: null == streaming
          ? _value._streaming
          : streaming // ignore: cast_nullable_to_non_nullable
              as List<StreamingLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeModelImpl implements _AnimeModel {
  const _$AnimeModelImpl(
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

  factory _$AnimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeModelImplFromJson(json);

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

  @override
  String toString() {
    return 'AnimeModel(malId: $malId, title: $title, titleEnglish: $titleEnglish, images: $images, synopsis: $synopsis, score: $score, trailer: $trailer, genres: $genres, streaming: $streaming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeModelImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeModelImplCopyWith<_$AnimeModelImpl> get copyWith =>
      __$$AnimeModelImplCopyWithImpl<_$AnimeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeModelImplToJson(
      this,
    );
  }
}

abstract class _AnimeModel implements AnimeModel {
  const factory _AnimeModel(
      {@JsonKey(name: 'mal_id') required final int malId,
      required final String title,
      @JsonKey(name: 'title_english') final String? titleEnglish,
      required final AnimeImages images,
      final String? synopsis,
      final double? score,
      final Trailer? trailer,
      final List<Genre> genres,
      final List<StreamingLink> streaming}) = _$AnimeModelImpl;

  factory _AnimeModel.fromJson(Map<String, dynamic> json) =
      _$AnimeModelImpl.fromJson;

  @override
  @JsonKey(name: 'mal_id')
  int get malId;
  @override
  String get title;
  @override
  @JsonKey(name: 'title_english')
  String? get titleEnglish;
  @override
  AnimeImages get images;
  @override
  String? get synopsis;
  @override
  double? get score;
  @override
  Trailer? get trailer;
  @override
  List<Genre> get genres;
  @override
  List<StreamingLink> get streaming;
  @override
  @JsonKey(ignore: true)
  _$$AnimeModelImplCopyWith<_$AnimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimeImages _$AnimeImagesFromJson(Map<String, dynamic> json) {
  return _AnimeImages.fromJson(json);
}

/// @nodoc
mixin _$AnimeImages {
  ImageType get jpg => throw _privateConstructorUsedError;
  ImageType get webp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeImagesCopyWith<AnimeImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeImagesCopyWith<$Res> {
  factory $AnimeImagesCopyWith(
          AnimeImages value, $Res Function(AnimeImages) then) =
      _$AnimeImagesCopyWithImpl<$Res, AnimeImages>;
  @useResult
  $Res call({ImageType jpg, ImageType webp});

  $ImageTypeCopyWith<$Res> get jpg;
  $ImageTypeCopyWith<$Res> get webp;
}

/// @nodoc
class _$AnimeImagesCopyWithImpl<$Res, $Val extends AnimeImages>
    implements $AnimeImagesCopyWith<$Res> {
  _$AnimeImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jpg = null,
    Object? webp = null,
  }) {
    return _then(_value.copyWith(
      jpg: null == jpg
          ? _value.jpg
          : jpg // ignore: cast_nullable_to_non_nullable
              as ImageType,
      webp: null == webp
          ? _value.webp
          : webp // ignore: cast_nullable_to_non_nullable
              as ImageType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<$Res> get jpg {
    return $ImageTypeCopyWith<$Res>(_value.jpg, (value) {
      return _then(_value.copyWith(jpg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageTypeCopyWith<$Res> get webp {
    return $ImageTypeCopyWith<$Res>(_value.webp, (value) {
      return _then(_value.copyWith(webp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnimeImagesImplCopyWith<$Res>
    implements $AnimeImagesCopyWith<$Res> {
  factory _$$AnimeImagesImplCopyWith(
          _$AnimeImagesImpl value, $Res Function(_$AnimeImagesImpl) then) =
      __$$AnimeImagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageType jpg, ImageType webp});

  @override
  $ImageTypeCopyWith<$Res> get jpg;
  @override
  $ImageTypeCopyWith<$Res> get webp;
}

/// @nodoc
class __$$AnimeImagesImplCopyWithImpl<$Res>
    extends _$AnimeImagesCopyWithImpl<$Res, _$AnimeImagesImpl>
    implements _$$AnimeImagesImplCopyWith<$Res> {
  __$$AnimeImagesImplCopyWithImpl(
      _$AnimeImagesImpl _value, $Res Function(_$AnimeImagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jpg = null,
    Object? webp = null,
  }) {
    return _then(_$AnimeImagesImpl(
      jpg: null == jpg
          ? _value.jpg
          : jpg // ignore: cast_nullable_to_non_nullable
              as ImageType,
      webp: null == webp
          ? _value.webp
          : webp // ignore: cast_nullable_to_non_nullable
              as ImageType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeImagesImpl implements _AnimeImages {
  const _$AnimeImagesImpl({required this.jpg, required this.webp});

  factory _$AnimeImagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeImagesImplFromJson(json);

  @override
  final ImageType jpg;
  @override
  final ImageType webp;

  @override
  String toString() {
    return 'AnimeImages(jpg: $jpg, webp: $webp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeImagesImpl &&
            (identical(other.jpg, jpg) || other.jpg == jpg) &&
            (identical(other.webp, webp) || other.webp == webp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jpg, webp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeImagesImplCopyWith<_$AnimeImagesImpl> get copyWith =>
      __$$AnimeImagesImplCopyWithImpl<_$AnimeImagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeImagesImplToJson(
      this,
    );
  }
}

abstract class _AnimeImages implements AnimeImages {
  const factory _AnimeImages(
      {required final ImageType jpg,
      required final ImageType webp}) = _$AnimeImagesImpl;

  factory _AnimeImages.fromJson(Map<String, dynamic> json) =
      _$AnimeImagesImpl.fromJson;

  @override
  ImageType get jpg;
  @override
  ImageType get webp;
  @override
  @JsonKey(ignore: true)
  _$$AnimeImagesImplCopyWith<_$AnimeImagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageType _$ImageTypeFromJson(Map<String, dynamic> json) {
  return _ImageType.fromJson(json);
}

/// @nodoc
mixin _$ImageType {
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'large_image_url')
  String? get largeImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageTypeCopyWith<ImageType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageTypeCopyWith<$Res> {
  factory $ImageTypeCopyWith(ImageType value, $Res Function(ImageType) then) =
      _$ImageTypeCopyWithImpl<$Res, ImageType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'large_image_url') String? largeImageUrl});
}

/// @nodoc
class _$ImageTypeCopyWithImpl<$Res, $Val extends ImageType>
    implements $ImageTypeCopyWith<$Res> {
  _$ImageTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? largeImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      largeImageUrl: freezed == largeImageUrl
          ? _value.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageTypeImplCopyWith<$Res>
    implements $ImageTypeCopyWith<$Res> {
  factory _$$ImageTypeImplCopyWith(
          _$ImageTypeImpl value, $Res Function(_$ImageTypeImpl) then) =
      __$$ImageTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'large_image_url') String? largeImageUrl});
}

/// @nodoc
class __$$ImageTypeImplCopyWithImpl<$Res>
    extends _$ImageTypeCopyWithImpl<$Res, _$ImageTypeImpl>
    implements _$$ImageTypeImplCopyWith<$Res> {
  __$$ImageTypeImplCopyWithImpl(
      _$ImageTypeImpl _value, $Res Function(_$ImageTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? largeImageUrl = freezed,
  }) {
    return _then(_$ImageTypeImpl(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      largeImageUrl: freezed == largeImageUrl
          ? _value.largeImageUrl
          : largeImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageTypeImpl implements _ImageType {
  const _$ImageTypeImpl(
      {@JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'large_image_url') this.largeImageUrl});

  factory _$ImageTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageTypeImplFromJson(json);

  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'large_image_url')
  final String? largeImageUrl;

  @override
  String toString() {
    return 'ImageType(imageUrl: $imageUrl, largeImageUrl: $largeImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageTypeImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.largeImageUrl, largeImageUrl) ||
                other.largeImageUrl == largeImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, largeImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageTypeImplCopyWith<_$ImageTypeImpl> get copyWith =>
      __$$ImageTypeImplCopyWithImpl<_$ImageTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageTypeImplToJson(
      this,
    );
  }
}

abstract class _ImageType implements ImageType {
  const factory _ImageType(
          {@JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'large_image_url') final String? largeImageUrl}) =
      _$ImageTypeImpl;

  factory _ImageType.fromJson(Map<String, dynamic> json) =
      _$ImageTypeImpl.fromJson;

  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'large_image_url')
  String? get largeImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ImageTypeImplCopyWith<_$ImageTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Trailer _$TrailerFromJson(Map<String, dynamic> json) {
  return _Trailer.fromJson(json);
}

/// @nodoc
mixin _$Trailer {
  @JsonKey(name: 'youtube_id')
  String? get youtubeId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'embed_url')
  String? get embedUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrailerCopyWith<Trailer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrailerCopyWith<$Res> {
  factory $TrailerCopyWith(Trailer value, $Res Function(Trailer) then) =
      _$TrailerCopyWithImpl<$Res, Trailer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'youtube_id') String? youtubeId,
      String? url,
      @JsonKey(name: 'embed_url') String? embedUrl});
}

/// @nodoc
class _$TrailerCopyWithImpl<$Res, $Val extends Trailer>
    implements $TrailerCopyWith<$Res> {
  _$TrailerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? youtubeId = freezed,
    Object? url = freezed,
    Object? embedUrl = freezed,
  }) {
    return _then(_value.copyWith(
      youtubeId: freezed == youtubeId
          ? _value.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      embedUrl: freezed == embedUrl
          ? _value.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrailerImplCopyWith<$Res> implements $TrailerCopyWith<$Res> {
  factory _$$TrailerImplCopyWith(
          _$TrailerImpl value, $Res Function(_$TrailerImpl) then) =
      __$$TrailerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'youtube_id') String? youtubeId,
      String? url,
      @JsonKey(name: 'embed_url') String? embedUrl});
}

/// @nodoc
class __$$TrailerImplCopyWithImpl<$Res>
    extends _$TrailerCopyWithImpl<$Res, _$TrailerImpl>
    implements _$$TrailerImplCopyWith<$Res> {
  __$$TrailerImplCopyWithImpl(
      _$TrailerImpl _value, $Res Function(_$TrailerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? youtubeId = freezed,
    Object? url = freezed,
    Object? embedUrl = freezed,
  }) {
    return _then(_$TrailerImpl(
      youtubeId: freezed == youtubeId
          ? _value.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      embedUrl: freezed == embedUrl
          ? _value.embedUrl
          : embedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrailerImpl implements _Trailer {
  const _$TrailerImpl(
      {@JsonKey(name: 'youtube_id') this.youtubeId,
      this.url,
      @JsonKey(name: 'embed_url') this.embedUrl});

  factory _$TrailerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrailerImplFromJson(json);

  @override
  @JsonKey(name: 'youtube_id')
  final String? youtubeId;
  @override
  final String? url;
  @override
  @JsonKey(name: 'embed_url')
  final String? embedUrl;

  @override
  String toString() {
    return 'Trailer(youtubeId: $youtubeId, url: $url, embedUrl: $embedUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrailerImpl &&
            (identical(other.youtubeId, youtubeId) ||
                other.youtubeId == youtubeId) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.embedUrl, embedUrl) ||
                other.embedUrl == embedUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, youtubeId, url, embedUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrailerImplCopyWith<_$TrailerImpl> get copyWith =>
      __$$TrailerImplCopyWithImpl<_$TrailerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrailerImplToJson(
      this,
    );
  }
}

abstract class _Trailer implements Trailer {
  const factory _Trailer(
      {@JsonKey(name: 'youtube_id') final String? youtubeId,
      final String? url,
      @JsonKey(name: 'embed_url') final String? embedUrl}) = _$TrailerImpl;

  factory _Trailer.fromJson(Map<String, dynamic> json) = _$TrailerImpl.fromJson;

  @override
  @JsonKey(name: 'youtube_id')
  String? get youtubeId;
  @override
  String? get url;
  @override
  @JsonKey(name: 'embed_url')
  String? get embedUrl;
  @override
  @JsonKey(ignore: true)
  _$$TrailerImplCopyWith<_$TrailerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

/// @nodoc
mixin _$Genre {
  @JsonKey(name: 'mal_id')
  int get malId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreCopyWith<Genre> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res, Genre>;
  @useResult
  $Res call({@JsonKey(name: 'mal_id') int malId, String name, String type});
}

/// @nodoc
class _$GenreCopyWithImpl<$Res, $Val extends Genre>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenreImplCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$$GenreImplCopyWith(
          _$GenreImpl value, $Res Function(_$GenreImpl) then) =
      __$$GenreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'mal_id') int malId, String name, String type});
}

/// @nodoc
class __$$GenreImplCopyWithImpl<$Res>
    extends _$GenreCopyWithImpl<$Res, _$GenreImpl>
    implements _$$GenreImplCopyWith<$Res> {
  __$$GenreImplCopyWithImpl(
      _$GenreImpl _value, $Res Function(_$GenreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malId = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$GenreImpl(
      malId: null == malId
          ? _value.malId
          : malId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenreImpl implements _Genre {
  const _$GenreImpl(
      {@JsonKey(name: 'mal_id') required this.malId,
      required this.name,
      required this.type});

  factory _$GenreImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenreImplFromJson(json);

  @override
  @JsonKey(name: 'mal_id')
  final int malId;
  @override
  final String name;
  @override
  final String type;

  @override
  String toString() {
    return 'Genre(malId: $malId, name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenreImpl &&
            (identical(other.malId, malId) || other.malId == malId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, malId, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      __$$GenreImplCopyWithImpl<_$GenreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenreImplToJson(
      this,
    );
  }
}

abstract class _Genre implements Genre {
  const factory _Genre(
      {@JsonKey(name: 'mal_id') required final int malId,
      required final String name,
      required final String type}) = _$GenreImpl;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$GenreImpl.fromJson;

  @override
  @JsonKey(name: 'mal_id')
  int get malId;
  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$GenreImplCopyWith<_$GenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreamingLink _$StreamingLinkFromJson(Map<String, dynamic> json) {
  return _StreamingLink.fromJson(json);
}

/// @nodoc
mixin _$StreamingLink {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreamingLinkCopyWith<StreamingLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamingLinkCopyWith<$Res> {
  factory $StreamingLinkCopyWith(
          StreamingLink value, $Res Function(StreamingLink) then) =
      _$StreamingLinkCopyWithImpl<$Res, StreamingLink>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$StreamingLinkCopyWithImpl<$Res, $Val extends StreamingLink>
    implements $StreamingLinkCopyWith<$Res> {
  _$StreamingLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamingLinkImplCopyWith<$Res>
    implements $StreamingLinkCopyWith<$Res> {
  factory _$$StreamingLinkImplCopyWith(
          _$StreamingLinkImpl value, $Res Function(_$StreamingLinkImpl) then) =
      __$$StreamingLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$StreamingLinkImplCopyWithImpl<$Res>
    extends _$StreamingLinkCopyWithImpl<$Res, _$StreamingLinkImpl>
    implements _$$StreamingLinkImplCopyWith<$Res> {
  __$$StreamingLinkImplCopyWithImpl(
      _$StreamingLinkImpl _value, $Res Function(_$StreamingLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$StreamingLinkImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamingLinkImpl implements _StreamingLink {
  const _$StreamingLinkImpl({required this.name, required this.url});

  factory _$StreamingLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamingLinkImplFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'StreamingLink(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamingLinkImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamingLinkImplCopyWith<_$StreamingLinkImpl> get copyWith =>
      __$$StreamingLinkImplCopyWithImpl<_$StreamingLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamingLinkImplToJson(
      this,
    );
  }
}

abstract class _StreamingLink implements StreamingLink {
  const factory _StreamingLink(
      {required final String name,
      required final String url}) = _$StreamingLinkImpl;

  factory _StreamingLink.fromJson(Map<String, dynamic> json) =
      _$StreamingLinkImpl.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$StreamingLinkImplCopyWith<_$StreamingLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
