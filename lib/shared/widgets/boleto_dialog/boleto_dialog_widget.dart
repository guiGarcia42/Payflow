import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class BoletoDialog extends StatelessWidget {
  final BoletoModel e;
  const BoletoDialog({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BoletoListController();

    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        color: Colors.white,
        height: 280,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 160, vertical: 15),
              child: Divider(
                color: AppColors.stroke,
                height: 1,
                thickness: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 78, left: 78, top: 10, bottom: 25),
              child: Text.rich(
                TextSpan(
                  text: 'O boleto ',
                  style: TextStyles.titleBody,
                  children: [
                    TextSpan(
                      text: '${e.name}',
                      style: TextStyles.titleBoldHeading,
                    ),
                    TextSpan(
                        text: ' no valor de R\$ ', style: TextStyles.titleBody),
                    TextSpan(
                        text: '${e.value}', style: TextStyles.titleBoldHeading),
                    TextSpan(text: ' Foi pago?', style: TextStyles.titleBody),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: LabelButton(
                      label: 'Ainda não',
                      boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.fromBorderSide(
                              BorderSide(color: AppColors.stroke)),
                          color: AppColors.background),
                      onPressed: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName("/home"));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: LabelButton(
                      label: 'Sim',
                      style: TextStyles.buttonBackground,
                      onPressed: () {
                        controller.setarEstado('${e.name}', true);
                        Navigator.pop(context);
                      },
                      boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primary),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
            InkWell(
              splashColor: AppColors.delete.withOpacity(0.8),
              onTap: () async {
                bool deletou = await controller.delBoleto(e);
                if (deletou) Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.trashAlt,
                      color: AppColors.delete,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Deletar boleto",
                      style: TextStyles.deleteText,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
