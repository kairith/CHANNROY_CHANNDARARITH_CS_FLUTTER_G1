import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  final GroceryItem? item;

  const NewItem({super.key, this.item});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _quantityController;
  GroceryCategory? _selectedCategory;
  @override

  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item?.name ?? '');
    _quantityController = TextEditingController(text: widget.item?.quantity.toString() ?? '');
    _selectedCategory = widget.item?.category;
  }

  void _addOrUpdateItem() {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
      final newItem = GroceryItem(
        id: widget.item?.id ?? const Uuid().v4(),
        name: _nameController.text,
        quantity: int.parse(_quantityController.text),
        category: _selectedCategory!,
      );
      Navigator.pop(context, newItem);
    } else if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Add a new item' : 'Edit item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input the name';
                  }
                  return null;
                },
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _quantityController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input the quantity';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(label: Text('Quantity')),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
                      items: GroceryCategory.values.map((category) {
                        return DropdownMenuItem<GroceryCategory>(
                          value: category,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: category.color,
                              ),
                              const SizedBox(width: 6),
                              Text(category.label),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      decoration:
                          const InputDecoration(label: Text('Category')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        if (!_formKey.currentState!.validate() && _selectedCategory != null) {
                          _nameController = TextEditingController(
                              text: widget.item?.name ?? '');
                          _quantityController = TextEditingController(
                              text: widget.item?.quantity.toString() ?? '');
                              
                            // _selectedCategory = widget.item!.category;
                            // _selectedCategory = null;

                        }
                      });
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _addOrUpdateItem,
                    child: Text(widget.item == null ? 'Add Item' : 'Edit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
