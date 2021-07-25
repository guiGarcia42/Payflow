import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/boleto_dialog/boleto_dialog_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final VoidCallback? onUpdate;
  final BoletoListController controller;
  // final BoletoModel boleto;
  const BoletoListWidget({Key? key, required this.controller, this.onUpdate})
      : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: controller.boletosNaoPagosNotifier,
        builder: (_, boletos, __) => AnimatedCard(
              direction: AnimatedCardDirection.left,
              child: Column(
                  children: boletos
                      .map((e) => InkWell(
                          focusColor: AppColors.primary,
                          onTap: () async {
                            await showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) => BoletoDialog(e: e));
                            controller.getnaopagos();
                          },
                          child: BoletoTileWidget(
                            data: e,
                          )))
                      .toList()),
            ));
  }
}
