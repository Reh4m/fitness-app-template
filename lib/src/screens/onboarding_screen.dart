import 'package:fitness_app/src/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: size.height * 0.3,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            bottom: 0,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 100,
                    spreadRadius: 80,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    _buildTitleTexts(theme),
                    const SizedBox(height: 20),
                    _buildSubtitleText(theme),
                    const SizedBox(height: 35),
                    _buildProgressBar(theme),
                    const SizedBox(height: 35),
                    PrimaryButton(
                      text: 'Get Started',
                      onPressed:
                          () => Navigator.pushReplacementNamed(context, '/'),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleTexts(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Wherever You Are ',
          textAlign: TextAlign.center,
          style: theme.textTheme.displayLarge,
        ),
        Text(
          'Health Is Number One',
          textAlign: TextAlign.center,
          style: theme.textTheme.displayLarge,
        ),
      ],
    );
  }

  Widget _buildSubtitleText(ThemeData theme) {
    return Text(
      'There is no instant way to a healthy life',
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.primaryColor.withAlpha(127),
      ),
    );
  }

  Widget _buildProgressBar(ThemeData theme) {
    return Container(
      width: 100,
      height: 5,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 25,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
