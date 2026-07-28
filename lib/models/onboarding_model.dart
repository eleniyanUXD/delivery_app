class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/image.png',
    title: 'Ordering made easy',
    description: 'Simply browse through our extensive menu...',
  ),
  OnboardingModel(
    image: 'assets/images/image2.png',
    title: 'Real-time Updates',
    description:
        'Curious  about the status of your order? Relax! We provide real-time updates on your delivery so you can track its progress from our kitchen to you',
  ),
  OnboardingModel(
    image: 'assets/images/image3.png',
    title: 'Lightning-fast support',
    description:
        'Our team is here for you! Need assistance or have questions? Shoot us a message, and we’ll respond faster than you can say hungry',
  ),
];
