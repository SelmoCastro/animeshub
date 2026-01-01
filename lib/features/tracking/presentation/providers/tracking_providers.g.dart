// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trackingStatusHash() => r'a9f7d6cb26c74cb6d9a929b00511a3f0ce23685d';

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

/// See also [trackingStatus].
@ProviderFor(trackingStatus)
const trackingStatusProvider = TrackingStatusFamily();

/// See also [trackingStatus].
class TrackingStatusFamily extends Family<AsyncValue<TrackingStatus?>> {
  /// See also [trackingStatus].
  const TrackingStatusFamily();

  /// See also [trackingStatus].
  TrackingStatusProvider call(
    int malId,
  ) {
    return TrackingStatusProvider(
      malId,
    );
  }

  @override
  TrackingStatusProvider getProviderOverride(
    covariant TrackingStatusProvider provider,
  ) {
    return call(
      provider.malId,
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
  String? get name => r'trackingStatusProvider';
}

/// See also [trackingStatus].
class TrackingStatusProvider
    extends AutoDisposeStreamProvider<TrackingStatus?> {
  /// See also [trackingStatus].
  TrackingStatusProvider(
    int malId,
  ) : this._internal(
          (ref) => trackingStatus(
            ref as TrackingStatusRef,
            malId,
          ),
          from: trackingStatusProvider,
          name: r'trackingStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trackingStatusHash,
          dependencies: TrackingStatusFamily._dependencies,
          allTransitiveDependencies:
              TrackingStatusFamily._allTransitiveDependencies,
          malId: malId,
        );

  TrackingStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.malId,
  }) : super.internal();

  final int malId;

  @override
  Override overrideWith(
    Stream<TrackingStatus?> Function(TrackingStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TrackingStatusProvider._internal(
        (ref) => create(ref as TrackingStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        malId: malId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<TrackingStatus?> createElement() {
    return _TrackingStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrackingStatusProvider && other.malId == malId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, malId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrackingStatusRef on AutoDisposeStreamProviderRef<TrackingStatus?> {
  /// The parameter `malId` of this provider.
  int get malId;
}

class _TrackingStatusProviderElement
    extends AutoDisposeStreamProviderElement<TrackingStatus?>
    with TrackingStatusRef {
  _TrackingStatusProviderElement(super.provider);

  @override
  int get malId => (origin as TrackingStatusProvider).malId;
}

String _$myListHash() => r'c407cc9eecff5e9880e9d0f307a10fb1f80d91bd';

/// See also [myList].
@ProviderFor(myList)
const myListProvider = MyListFamily();

/// See also [myList].
class MyListFamily extends Family<AsyncValue<List<AnimeHiveModel>>> {
  /// See also [myList].
  const MyListFamily();

  /// See also [myList].
  MyListProvider call(
    TrackingStatus status,
  ) {
    return MyListProvider(
      status,
    );
  }

  @override
  MyListProvider getProviderOverride(
    covariant MyListProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'myListProvider';
}

/// See also [myList].
class MyListProvider extends AutoDisposeFutureProvider<List<AnimeHiveModel>> {
  /// See also [myList].
  MyListProvider(
    TrackingStatus status,
  ) : this._internal(
          (ref) => myList(
            ref as MyListRef,
            status,
          ),
          from: myListProvider,
          name: r'myListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myListHash,
          dependencies: MyListFamily._dependencies,
          allTransitiveDependencies: MyListFamily._allTransitiveDependencies,
          status: status,
        );

  MyListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final TrackingStatus status;

  @override
  Override overrideWith(
    FutureOr<List<AnimeHiveModel>> Function(MyListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyListProvider._internal(
        (ref) => create(ref as MyListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AnimeHiveModel>> createElement() {
    return _MyListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyListProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyListRef on AutoDisposeFutureProviderRef<List<AnimeHiveModel>> {
  /// The parameter `status` of this provider.
  TrackingStatus get status;
}

class _MyListProviderElement
    extends AutoDisposeFutureProviderElement<List<AnimeHiveModel>>
    with MyListRef {
  _MyListProviderElement(super.provider);

  @override
  TrackingStatus get status => (origin as MyListProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
