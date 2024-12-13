import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import '../data/dummy_items.dart';
import '../widgets/new_item.dart';

enum Mode { normal, selection }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = List.from(dummyGroceryItems);
  final Set<int> _selectedIndexes = {};
  Mode _currentMode = Mode.normal;

  void _navigateToAddItem() async {
    final newItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );
    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _toggleSelectionMode(int index) {
    setState(() {
      if (_selectedIndexes.contains(index)) {
        _selectedIndexes.remove(index);
      } else {
        _selectedIndexes.add(index);
      }
    });
  }

  void _deleteSelectedItems() {
    setState(() {
      _groceryItems.removeWhere(
          (item) => _selectedIndexes.contains(_groceryItems.indexOf(item)));
      _selectedIndexes.clear();
      _currentMode = Mode.normal;
    });
  }
  // Handle reordering
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
       
      }
      final item = _groceryItems.removeAt(oldIndex);
      _groceryItems.insert(newIndex, item);
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));
    if (_groceryItems.isNotEmpty) {
      content = _currentMode == Mode.selection
          ? ReorderableListView(
              onReorder: _onReorder,
              children: List.generate(
                _groceryItems.length,
                (index) {
                  final isSelected = _selectedIndexes.contains(index);
                  return GestureDetector(
                    key: ValueKey(_groceryItems[index].name),
                    onLongPress: () {
                      setState(() {
                        _currentMode =
                            Mode.selection; // Switch to selection mode
                      });
                    },
                    onTap: () => _toggleSelectionMode(index),
                    child: ListTile(
                      leading: _currentMode == Mode.selection
                          ? Checkbox(
                            value: isSelected,
                            onChanged: (_) => _toggleSelectionMode(index),
                            )
                          : Container(
                              width: 24,
                              height: 24,
                              color: _groceryItems[index].category.color,
                              padding: const EdgeInsets.all(
                                  10), // Display category color
                            ),
                      title: Text(_groceryItems[index].name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_groceryItems[index].quantity.toString()),
                          const Padding(
                              padding: EdgeInsets.all(10)), // Display quantity
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : ReorderableListView(
              onReorder: _onReorder,
              children: List.generate(
                _groceryItems.length,
                (index) {
                  return GestureDetector(
                    key: ValueKey(_groceryItems[index].name),
                    onLongPress: () {
                      setState(() {
                        _currentMode =
                            Mode.selection; // Switch to selection mode
                      });
                    },
                    onTap: () {
                      // Navigate to edit item when tapped
                      _navigateToEditItem(index);
                    },
                    child: ListTile(
                      leading: Container(
                        width: 24,
                        height: 24,
                        color: _groceryItems[index].category.color,
                        padding: const EdgeInsets.all(10), // Display category color
                      ),
                      title: Text(_groceryItems[index].name),
                      trailing: Padding(
                        padding: const EdgeInsets.only(
                            right:
                                20), // Adjust space to the right of the quantity
                        child: Text(_groceryItems[index]
                            .quantity
                            .toString()), // Show quantity
                      ), // Show quantity
                    ),
                  );
                },
              ),
            );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentMode == Mode.normal
            ? 'Your Groceries'
            : '${_selectedIndexes.length} selected Item(s)'),
        actions: _currentMode == Mode.normal
            ? [
                IconButton(
                  onPressed: _navigateToAddItem,
                  icon: const Icon(Icons.add),
                ),
                ]
              : [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: _deleteSelectedItems,
                ),
              ],
              leading: _currentMode == Mode.selection
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _currentMode = Mode.normal;
                  });
                },
              )
            : null,
      ),
      body: content,
    );
  }

  // Navigate to the edit screen
  void _navigateToEditItem(int index) async {
    final updatedItem = await Navigator.push<GroceryItem>(
      context,
      MaterialPageRoute(
        builder: (context) => NewItem(item: _groceryItems[index]),
      ),
    );
    if (updatedItem != null) {
      setState(() {
        _groceryItems[index] = updatedItem;
      });
    }
  }
}
