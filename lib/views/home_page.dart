import 'package:calandoprov/providers/tip_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TipTimeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip time'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(
                controller: context.watch<TipTimeProvider>().costController,
                decoration: InputDecoration(
                  labelText: 'Cost of service',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          const ListTile(
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
                    title: Text(e.value),
                  ),
                )
                .toList(),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.credit_card),
            title: const Text("Round up tip"),
            value: context.watch<TipTimeProvider>().getIsSelected,
            onChanged: (newVal) {
              context.read<TipTimeProvider>().setIsSelected(newVal);
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: const Text("CALCULATE"),
            onPressed: () {
              context.read<TipTimeProvider>().tipCalculation(context);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Tip amount: \$${context.watch<TipTimeProvider>().getTipAmount}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
