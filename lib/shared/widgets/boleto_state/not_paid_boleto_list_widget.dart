import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

import '../boleto_list/boleto_list_controller.dart';

class NotPaidBoletoList extends StatefulWidget {
  final BoletoListController controller;
  const NotPaidBoletoList({Key? key, required this.controller})
      : super(key: key);

  @override
  _NotPaidBoletoListState createState() => _NotPaidBoletoListState();
}

class _NotPaidBoletoListState extends State<NotPaidBoletoList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: widget.controller.boletosNaoPagosNotifier,
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
