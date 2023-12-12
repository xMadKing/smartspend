import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddExpensePage extends StatefulWidget {
  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  double _amount = 50.00; // Assuming a default or last entered amount
  String _selectedCategory = 'Food';
  DateTime _selectedDate = DateTime.now();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        backgroundColor: Colors.blueGrey[900], // Adjusted to a dark color
      ),
      body: Container(
        color: Colors.blueGrey[50], // Light background color
        child: ListView(
          // Using ListView for better scrolling behavior
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: '50.00', // Set the initial value
                      decoration: InputDecoration(
                        labelText: 'Amount (SEK)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        setState(() {
                          _amount = double.tryParse(value) ?? 0;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCategory = newValue!;
                        });
                      },
                      items: <String>[
                        'Food',
                        'Transportation',
                        'Entertainment',
                        'Medical'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      title: Text(
                        DateFormat('EEE, MMM d, yyyy').format(
                            _selectedDate), // Use intl package to format the date
                      ),
                      trailing: Icon(Icons.calendar_today),
                      onTap: () => _selectDate(context),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Add expense confirmation logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Button color
                      ),
                      child: Text('Confirm Expense'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}