import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemindMeToggleState {
  final List<bool> toggleStates;

  RemindMeToggleState(this.toggleStates);

  // Create a copyWith method
  RemindMeToggleState copyWith({List<bool>? toggleStates}) {
    return RemindMeToggleState(toggleStates ?? this.toggleStates);
  }
}

class RemindMeToggleNotifier extends StateNotifier<RemindMeToggleState> {
  RemindMeToggleNotifier() : super(RemindMeToggleState([]));

  void toggleSwitch(int index, bool value) {
    List<bool> newToggleStates = List.from(state.toggleStates);

    // Ensure the list is long enough to accommodate the index
    if (index < newToggleStates.length) {
      newToggleStates[index] = value;
    } else {
      // Grow the list if necessary
      newToggleStates = List.filled(index + 1, false)..[index] = value;
    }

    // Use the copyWith method to update state immutably
    state = state.copyWith(toggleStates: newToggleStates);
  }
}
