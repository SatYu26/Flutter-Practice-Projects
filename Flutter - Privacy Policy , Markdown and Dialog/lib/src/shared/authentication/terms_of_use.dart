import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project001/src/shared/dialogs/policy_dialog.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "By creating an account, you are agreeing to our\n",
          style: Theme.of(context).textTheme.bodyText1,
          children: [
            TextSpan(
              text: "Terms & Conditions ",
              style: TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Open dialog of terms and conditions
                  showModal(
                      context: context,
                      configuration: FadeScaleTransitionConfiguration(),
                      builder: (context) {
                        return PolicyDialog(
                          mdFileName: 'terms_and_conditions.md',
                        );
                      });
                },
            ),
            TextSpan(text: "and "),
            TextSpan(
              text: "Privacy Policy! ",
              style: TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Open dialog of terms and conditions
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PolicyDialog(
                          mdFileName: 'privacy_policy.md',
                        );
                      });
                },
            ),
          ],
        ),
      ),
    );
  }
}
