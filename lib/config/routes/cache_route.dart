// features/router/cached_route_state.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:collection';

/// Priority levels for cached routes
enum CachePriority { low, medium, high }

/// Manages the cache of frequently accessed routes
class CachedRouteManager {
  // Cache capacity
  static const int _maxCacheSize = 10;

  // LRU cache for routes, with path as key and cached data as value
  static final LinkedHashMap<String, _CachedRouteData> _cache =
      LinkedHashMap<String, _CachedRouteData>();

  // Notifier for route cache changes
  static final _notifier = CachedRouteNotifier();

  /// Cache a route for faster access
  static void cacheRoute(
    String path, {
    CachePriority priority = CachePriority.medium,
    Map<String, dynamic>? data,
  }) {
    // If cache is full, remove the least recently used item
    if (_cache.length >= _maxCacheSize && !_cache.containsKey(path)) {
      _removeLowestPriorityRoute();
    }

    // Add or update the route in cache
    _cache[path] = _CachedRouteData(
      path: path,
      priority: priority,
      data: data,
      lastAccessed: DateTime.now(),
    );

    // Notify listeners
    _notifier.notifyListeners();
  }

  /// Get a cached route if it exists
  // ignore: library_private_types_in_public_api
  static _CachedRouteData? getCachedRoute(String path) {
    final cachedData = _cache[path];

    if (cachedData != null) {
      // Update last accessed time
      _cache[path] = cachedData.copyWith(lastAccessed: DateTime.now());
      return cachedData;
    }
    return null;
  }

  /// Remove a route from cache
  static void removeCachedRoute(String path) {
    _cache.remove(path);
    _notifier.notifyListeners();
  }

  /// Clear the entire cache
  static void clearCache() {
    _cache.clear();
    _notifier.notifyListeners();
  }

  /// Remove the lowest priority route from cache
  static void _removeLowestPriorityRoute() {
    if (_cache.isEmpty) return;

    // First try to remove low priority routes
    String? candidateKey;
    DateTime oldestAccess = DateTime.now();

    // First pass: look for low priority items
    for (final entry in _cache.entries) {
      if (entry.value.priority == CachePriority.low &&
          entry.value.lastAccessed.isBefore(oldestAccess)) {
        candidateKey = entry.key;
        oldestAccess = entry.value.lastAccessed;
      }
    }

    // Second pass: look for medium priority items if no low priority found
    if (candidateKey == null) {
      for (final entry in _cache.entries) {
        if (entry.value.priority == CachePriority.medium &&
            entry.value.lastAccessed.isBefore(oldestAccess)) {
          candidateKey = entry.key;
          oldestAccess = entry.value.lastAccessed;
        }
      }
    }

    // Last pass: look for any item if no medium priority found
    candidateKey ??= _cache.keys.first;

    // Remove the selected item
    _cache.remove(candidateKey);
  }
}

/// Data structure for cached route information
class _CachedRouteData {
  final String path;
  final CachePriority priority;
  final Map<String, dynamic>? data;
  final DateTime lastAccessed;

  _CachedRouteData({
    required this.path,
    required this.priority,
    required this.lastAccessed,
    this.data,
  });

  _CachedRouteData copyWith({
    String? path,
    CachePriority? priority,
    Map<String, dynamic>? data,
    DateTime? lastAccessed,
  }) {
    return _CachedRouteData(
      path: path ?? this.path,
      priority: priority ?? this.priority,
      data: data ?? this.data,
      lastAccessed: lastAccessed ?? this.lastAccessed,
    );
  }
}

/// Notifier for cache changes that can be used as a RefreshListenable for GoRouter
class CachedRouteNotifier extends ChangeNotifier {
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}