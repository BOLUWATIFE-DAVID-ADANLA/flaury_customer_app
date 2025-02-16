import 'package:hooks_riverpod/hooks_riverpod.dart';

class RemindMeToggleState {
  final List<bool> toggleStates;

  RemindMeToggleState(this.toggleStates);

  RemindMeToggleState copyWith({List<bool>? toggleStates}) {
    return RemindMeToggleState(List.from(toggleStates ?? this.toggleStates));
  }
}

class RemindMeToggleNotifier extends StateNotifier<RemindMeToggleState> {
  RemindMeToggleNotifier() : super(RemindMeToggleState([]));

  void toggleSwitch(int index, bool value) {
    List<bool> newToggleStates = List.from(state.toggleStates);

    // Expand the list if the index is out of bounds
    if (index >= newToggleStates.length) {
      newToggleStates = List<bool>.filled(index + 1, false)
        ..setAll(0, state.toggleStates); // Copy old values
    }

    newToggleStates[index] = value; // Toggle the value at the given index

    state = state.copyWith(toggleStates: newToggleStates);
  }
}
