import 'package:flutter/cupertino.dart';
import 'package:localboss/features/home/view/pages/home_layout.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrCodeContainer extends StatelessWidget {
  final String link;
  const QrCodeContainer({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: HomeLayout.blueWh,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                AppLocalizations.of(context)!.scanqrcodetoleaveareview,
                style: TextStyle(
                  color: HomeLayout.blueDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 200,
              child: QrImageView(
                data: link,
                version: QrVersions.auto,
                backgroundColor: HomeLayout.blueWh,
                //   size: 250,
              ),
            )
          ],
        ),
      ),
    );
  }
}
