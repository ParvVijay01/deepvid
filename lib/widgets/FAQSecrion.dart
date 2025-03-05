import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Frequently asked questions",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "All information you need to know",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Divider(color: Colors.grey),
          _buildFAQItem(
            "How does the AI content generation work?",
            "Our AI-powered platform leverages state-of-the-art machine learning algorithms and neural networks to analyze your creative input and generate professional-quality content personalized to your vision. The AI understands nuanced context, style preferences, and creative direction to produce engaging content across music and comedy.",
          ),
          _buildFAQItem(
            "What type of content can I create?",
            "Our versatile platform enables you to create a wide range of content including custom music tracks, comedy scripts, viral short-form videos, and live performance materials. With support for multiple formats, styles, and creative directions, you can bring any creative vision to life.",
          ),
          _buildFAQItem(
            "How do I get started?",
            "Getting started is simple - create your free account, select your preferred content type from our intuitive dashboard, and begin creating! Our AI assistant guides you through each step with smart suggestions and real-time feedback to help you achieve the best results.",
          ),
          _buildFAQItem(
            "Can I collaborate with other creators?",
            "Absolutely! Our platform features robust real-time collaboration tools that let you seamlessly work with other creators. Share projects, provide feedback, and create content together in our collaborative workspace designed for creative teams.",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            answer,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
