// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seasonalAnimesHash() => r'04c6b58f3ddd9d15228ed0292d000252ce096240';

/// See also [seasonalAnimes].
@ProviderFor(seasonalAnimes)
final seasonalAnimesProvider = AutoDisposeFutureProvider<List<Anime>>.internal(
  seasonalAnimes,
  name: r'seasonalAnimesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$seasonalAnimesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SeasonalAnimesRef = AutoDisposeFutureProviderRef<List<Anime>>;
String _$searchAnimesHash() => r'2542de7e26899e9131e86e42fafb854ecd541781';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [searchAnimes].
@ProviderFor(searchAnimes)
const searchAnimesProvider = SearchAnimesFamily();

/// See also [searchAnimes].
class SearchAnimesFamily extends Family<AsyncValue<List<Anime>>> {
  /// See also [searchAnimes].
  const SearchAnimesFamily();

  /// See also [searchAnimes].
  SearchAnimesProvider call(
    String query,
  ) {
    return SearchAnimesProvider(
      query,
    );
  }

  @override
  SearchAnimesProvider getProviderOverride(
    covariant SearchAnimesProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchAnimesProvider';
}

/// See also [searchAnimes].
class SearchAnimesProvider extends AutoDisposeFutureProvider<List<Anime>> {
  /// See also [searchAnimes].
  SearchAnimesProvider(
    String query,
  ) : this._internal(
          (ref) => searchAnimes(
            ref as SearchAnimesRef,
            query,
          ),
          from: searchAnimesProvider,
          name: r'searchAnimesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchAnimesHash,
          dependencies: SearchAnimesFamily._dependencies,
          allTransitiveDependencies:
              SearchAnimesFamily._allTransitiveDependencies,
          query: query,
        );

  SearchAnimesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Anime>> Function(SearchAnimesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchAnimesProvider._internal(
        (ref) => create(ref as SearchAnimesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Anime>> createElement() {
    return _SearchAnimesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchAnimesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchAnimesRef on AutoDisposeFutureProviderRef<List<Anime>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchAnimesProviderElement
    extends AutoDisposeFutureProviderElement<List<Anime>> with SearchAnimesRef {
  _SearchAnimesProviderElement(super.provider);

  @override
  String get query => (origin as SearchAnimesProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
