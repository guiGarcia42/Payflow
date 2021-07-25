import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

import '../boleto_list/boleto_list_controller.dart';

class PaidBoletoList extends StatefulWidget {
  final BoletoListController controller;
  const PaidBoletoList({Key? key, required this.controller}) : super(key: key);

  @override
  _PaidBoletoListState createState() => _PaidBoletoListState();
}

class _PaidBoletoListState extends State<PaidBoletoList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletosPagosNotifier,
        builder: (_, boletos, __) => AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: Column(
                  children: boletos
                      .map((e) => BoletoTileWidget(
                            data: e,
                          ))
                      .toList()),
            ));
  }
}
