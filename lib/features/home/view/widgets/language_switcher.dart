import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:localboss/features/home/repo/prefrences.dart';
import 'package:localboss/features/home/viewModals/languege_provider.dart';
import 'package:provider/provider.dart';

class LanguageSwitcherScreen extends StatelessWidget {

  const LanguageSwitcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.languagesetting,
            style: const TextStyle(
              fontSize: 32, 
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              Provider.of<LanguageProvider>(context, listen: false).changeLocal("en");
              await Prefrences.setLanguage("en");
              if(context.mounted) context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppLocalizations.of(context)!.language == "English"
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceContainer,
              shape: const ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(16))),
            ),
            child: Row(
              children: [
                const Flag.fromString("US", width: 32, height: 32),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "English",
                  style: TextStyle(
                      color: AppLocalizations.of(context)!.language == "English"
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false).changeLocal("de");
              Prefrences.setLanguage("de");
              if(context.mounted) context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppLocalizations.of(context)!.language == "Deutsch"
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceContainer,
              shape: const ContinuousRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(16))),
            ),
            child: Row(
              children: [
                const Flag.fromString("DE", width: 32, height: 32),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Deutsch",
                  style: TextStyle(
                      color: AppLocalizations.of(context)!.language == "Deutsch"
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}