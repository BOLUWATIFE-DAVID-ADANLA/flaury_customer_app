import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RemindMeToggleState {
  final List<bool> toggleStates;

  RemindMeToggleState(this.toggleStates);

  RemindMeToggleState copyWith({List<bool>? toggleStates}) {
    return RemindMeToggleState(List.from(toggleStates ?? this.toggleStates));
  }
}

class RemindMeToggleNotifier extends StateNotifier<RemindMeToggleState> {
  RemindMeToggleNotifier() : super(RemindMeToggleState([])) {
    _loadToggleStates(); // Load saved state when notifier initializes
  }

  /// Load saved toggle states from SharedPreferences
  Future<void> _loadToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? storedStates = prefs.getStringList('toggleStates');

    if (storedStates != null) {
      state =
          RemindMeToggleState(storedStates.map((e) => e == 'true').toList());
    }
  }

  /// Save toggle states to SharedPreferences
  Future<void> _saveToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringStates =
        state.toggleStates.map((e) => e.toString()).toList();
    await prefs.setStringList('toggleStates', stringStates);
  }

  void toggleSwitch(int index, bool value) async {
    List<bool> newToggleStates = List.from(state.toggleStates);

    // Expand the list if needed
    if (index >= newToggleStates.length) {
      newToggleStates = List<bool>.filled(index + 1, false)
        ..setAll(0, state.toggleStates);
    }

    newToggleStates[index] = value;

    // Update state immutably
    state = state.copyWith(toggleStates: newToggleStates);

    // Save new state to persistent storage
    await _saveToggleStates();
  }
}
