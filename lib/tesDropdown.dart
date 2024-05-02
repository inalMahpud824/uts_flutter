import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Example'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Save the name value
                  },
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                  ),
                  items: ['Male', 'Female'].map((gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (selectedGender) {
                    // Handle gender selection
                  },
                ),
                SizedBox(height: 20.0),
                // Add similar dropdowns for religion and education
                // ...
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
