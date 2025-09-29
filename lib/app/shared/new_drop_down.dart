import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flutter/material.dart';

class NewCustomDropdown<T> extends StatefulWidget {
  final T? value;
  final List<T> items;
  final Widget Function(T) menuItemBuilder;
  final Widget Function(dynamic) selectedBuilder;
  final void Function(dynamic) onChanged;

  final bool showSearch;
  final bool showBorder;
  final bool showBoxShadow;
  final double? dropdownWidth;
  final double? radius;

  // Multi-select support
  final bool isMultiSelect;
  final List<T>? selectedValues;
  final bool useCheckbox;
  final Color borderColor;

  const NewCustomDropdown({
    super.key,
    this.value,
    this.borderColor = Colors.grey,
    required this.items,
    required this.menuItemBuilder,
    required this.selectedBuilder,
    required this.onChanged,
    this.showSearch = false,
    this.dropdownWidth,
    this.showBorder = true,
    this.showBoxShadow = true,
    this.radius,
    this.isMultiSelect = false,
    this.selectedValues,
    this.useCheckbox = false,
  });

  @override
  State<NewCustomDropdown<T>> createState() => _NewCustomDropdownState<T>();
}

class _NewCustomDropdownState<T> extends State<NewCustomDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  late List<T> _multiSelectedValues;

  @override
  void initState() {
    super.initState();
    _multiSelectedValues = widget.selectedValues != null
        ? List<T>.from(widget.selectedValues!)
        : [];
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (_) {
        final filtered = widget.items.where((item) {
          return item
              .toString()
              .toLowerCase()
              .contains(_searchQuery.toLowerCase());
        }).toList();

        return Stack(
          children: [
            // Layer to dismiss dropdown
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: _removeDropdown,
              ),
            ),
            // Dropdown content
            Positioned(
              left: offset.dx,
              top: offset.dy + size.height + 2,
              width: widget.dropdownWidth ?? size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 2),
                child: Material(
                  color: AppColors.background,
                  elevation: widget.showBoxShadow ? 4 : 0,
                  borderRadius: BorderRadius.circular(widget.radius ?? 4),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.showSearch)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search...",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (value) {
                                _searchQuery = value;
                                _overlayEntry?.markNeedsBuild();
                              },
                            ),
                          ),
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: filtered.map((item) {
                              final isSelected = widget.isMultiSelect
                                  ? _multiSelectedValues.contains(item)
                                  : widget.value == item;

                              return InkWell(
                                onTap: () {
                                  if (widget.isMultiSelect) {
                                    setState(() {
                                      if (_multiSelectedValues.contains(item)) {
                                        _multiSelectedValues.remove(item);
                                      } else {
                                        _multiSelectedValues.add(item);
                                      }
                                    });
                                    widget.onChanged(_multiSelectedValues);
                                  } else {
                                    widget.onChanged(item);
                                    _removeDropdown();
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: widget.menuItemBuilder(item),
                                    ),
                                    if (widget.isMultiSelect &&
                                        widget.useCheckbox)
                                      Checkbox(
                                        value: isSelected,
                                        onChanged: (val) {
                                          setState(() {
                                            if (val == true) {
                                              _multiSelectedValues.add(item);
                                            } else {
                                              _multiSelectedValues.remove(item);
                                            }
                                          });
                                          widget
                                              .onChanged(_multiSelectedValues);
                                        },
                                      ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _searchQuery = '';
    _searchController.clear();
  }

  @override
  void dispose() {
    _removeDropdown();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayValue = widget.isMultiSelect
        ? (_multiSelectedValues.isEmpty
            ? null
            : _multiSelectedValues.join(', '))
        : widget.value;

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.background,
            border: widget.showBorder
                ? Border.all(color: widget.borderColor, width: 1)
                : null,
            boxShadow: widget.showBoxShadow
                ? [const BoxShadow(blurRadius: 3, color: Colors.black12)]
                : null,
            borderRadius: BorderRadius.circular(widget.radius ?? 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: widget.selectedBuilder(displayValue)),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}
