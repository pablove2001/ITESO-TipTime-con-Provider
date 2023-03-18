import 'package:calandoprov/providers/tip_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Cost of service',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          Column(
            children: context
                .read<TipTimeProvider>()
                .radioGroupValues
                .entries
                .map(
                  (e) => ListTile(
                    leading: Radio(
                      value: e.key,
                      groupValue:
                          context.watch<TipTimeProvider>().getSelectionRadio,
                      onChanged: (newVal) {
                        context
                            .read<TipTimeProvider>()
                            .setSelectedRadio(newVal);
                      },
                    ),
                    title: Text("${e.value}"),
                  ),
                )
                .toList(),
          ),
          Text("Aqui agregar el GRUPO de radio buttons"),
          SwitchListTile(
            secondary: Icon(Icons.credit_card),
            title: Text("Round up tip"),
            value: context.watch<TipTimeProvider>().isSelected,
            onChanged: (newVal) {
              // _isSelected = newVal;
              context.read<TipTimeProvider>().setIsSelected(newVal);
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: Text("CALCULATE"),
            onPressed: () {
              context.read<TipTimeProvider>().tipCalculation(12);
            },
          ),
          Text("Tip amount: \$${context.watch<TipTimeProvider>().tipAmount}"),
        ],
      ),
    );
  }
}
