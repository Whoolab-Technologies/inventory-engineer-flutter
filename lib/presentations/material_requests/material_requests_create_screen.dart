import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/injection/injection.dart';

class MaterialRequestCreateScreen extends StatelessWidget {
  const MaterialRequestCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create MR')),
      body: BlocProvider(
        create: (context) => getIt<MaterialRequestBloc>(),
        child: const MaterialRequestForm(),
      ),
    );
  }
}

class MaterialRequestForm extends StatefulWidget {
  const MaterialRequestForm({super.key});

  @override
  State<MaterialRequestForm> createState() => _MaterialRequestFormState();
}

class _MaterialRequestFormState extends State<MaterialRequestForm> {
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> products = [];
  String? selectedProduct;
  TextEditingController quantityController = TextEditingController();

  void _addProduct() {
    if (selectedProduct != null && quantityController.text.isNotEmpty) {
      setState(() {
        products.add({
          'product': selectedProduct,
          'quantity': int.parse(quantityController.text)
        });
      });
      quantityController.clear();
      selectedProduct = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Product'),
              items: const [
                DropdownMenuItem(value: 'cement', child: Text('Cement')),
                DropdownMenuItem(value: 'sand', child: Text('Sand')),
                DropdownMenuItem(value: 'bricks', child: Text('Bricks')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedProduct = value;
                });
              },
            ),
            TextFormField(
              controller: quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text('Add Product'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index]['product']),
                    subtitle: Text('Quantity: ${products[index]['quantity']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          products.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context
                      .read<MaterialRequestBloc>()
                      .add(const MaterialRequestSubmitted());
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
