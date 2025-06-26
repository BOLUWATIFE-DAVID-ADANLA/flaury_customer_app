import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';

final log = Logger();

class ProviderLogger implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log.i(
      'Provider ${provider.name ?? provider.runtimeType} was initialized with value: $value',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log.i(
      'Provider ${provider.name ?? provider.runtimeType} updated from $previousValue to $newValue',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log.d('Provider ${provider.name ?? provider.runtimeType} was disposed');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log.e(
      'Provider ${provider.name ?? provider.runtimeType} threw error: $error\n$stackTrace',
    );
  }
}
