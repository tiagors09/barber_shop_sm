import 'package:barber_shop_sm/models/haircut.dart';
import 'package:barber_shop_sm/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HaircutForm extends StatefulWidget {
  final Haircut haircut;

  const HaircutForm({
    super.key,
    required this.haircut,
  });

  @override
  State<HaircutForm> createState() => _HaircutFormState();
}

class _HaircutFormState extends State<HaircutForm> {
  var haircutCout = 1;
  var date = DateTime.now();

  _onPressed(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then(
      (value) => setState(() {
        date = value!;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var total = haircutCout * widget.haircut.price;

    const textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

    return Container(
      margin: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.haircut.description,
                style: textStyle,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (haircutCout > 1) {
                          haircutCout--;
                        }
                      });
                    },
                    icon: const Icon(Icons.exposure_minus_1),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      '$haircutCout corte${haircutCout > 1 ? 's' : ''}',
                      style: textStyle,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        haircutCout++;
                      });
                    },
                    icon: const Icon(Icons.plus_one),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Agendar para:',
                style: textStyle,
              ),
              TextButton(
                onPressed: () {
                  _onPressed(context);
                },
                child: Text(
                  DateFormat('dd/MM/yyyy').format(date),
                  style: textStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: textStyle,
              ),
              Text(
                'R\$ $total',
                style: textStyle,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(
                Order(haircut: widget.haircut, time: date, total: total),
              );
            },
            child: const Text('Agendar'),
          ),
        ],
      ),
    );
  }
}
