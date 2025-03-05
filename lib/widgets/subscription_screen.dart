import 'package:flutter/material.dart';
import 'subscription_card.dart'; // Import the reusable card

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool isYearly = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Toggle Button
        Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade900,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildToggleButton("Monthly", !isYearly, () {
                setState(() => isYearly = false);
              }),
              _buildToggleButton("Yearly (~60%)", isYearly, () {
                setState(() => isYearly = true);
              }),
            ],
          ),
        ),
        SizedBox(height: 20),

        // Subscription Plans
        Column(
          children: (isYearly ? _getYearlyPlans() : _getMonthlyPlans()),
        ),
      ],
    );
  }

  // Toggle Button Widget
  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple.shade500 : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Monthly Plans
  List<Widget> _getMonthlyPlans() {
    return [
      SubscriptionCard(
        title: "Free",
        price: "0", // Should be per month
        billingCycle: "month", // Corrected to show "month"
        isCurrentPlan: true,
        features: [
          "60 credits per month",
          "6 images, or 3 songs, or 2 videos",
        ],
        limitations: [
          "Lower priority processing",
          "Only 2 AI voices",
          "Standard generation speed",
          "Non-commercial use only",
          'Watermarks'
        ],
      ),SizedBox(height: 5,),
      SubscriptionCard(
        title: "Starter",
        price: "7.99", // Monthly price
        billingCycle: "month",
        features: [
          "500 credits per month",
          "50 images, or 25 songs, or 16 videos",
          "High priority processing"
        ],
        limitations: [
          "4 AI voices",
          "Standard generation speed",
          "Non-commercial use only",
          "Watermarks"
        ],
      ),SizedBox(height: 5,),
      SubscriptionCard(
        title: "Creator",
        price: "14.99",
        billingCycle: "month",
        isMostPopular: true,
        features: [
          "1,200 credits per month",
          "120 images, or 60 songs, or 40 videos",
          "8 AI voices",
          "High priority processing",
          "No Watermarks",
          "Fast generation speed",
          "Commercial use allowed"
        ],

      ),SizedBox(height: 5,),
      SubscriptionCard(
        title: "Premium",
        price: "29.99",
        billingCycle: "month",
        features: [
          "2,800 credits per month",
          "280 images, or 140 songs, or 93 videos",
          "All 10 AI voices",
          "High priority processing",
          "No Watermarks",
          "Fastest generation speed",
          "Commercial use allowed",
        ],

      ),
    ];
  }

  List<Widget> _getYearlyPlans() {
    return [
      SubscriptionCard(
        title: "Free",
        price: "0",
        billingCycle: "year",
        isCurrentPlan: true,// Corrected
        features: [
          "60 credits per month (total 720 credits)",
          "72 images, 36 songs, 24 videos",
        ],
        limitations: [
          "Lower priority processing",
          "Only 2 AI voices",
          "Watermarks included",
        ],
      ),
      SizedBox(height: 5,),
      SubscriptionCard(
        title: "Starter",
        price: "79.99", // Yearly price
        billingCycle: "year",
        features: [
          "540 credits per month (total 6,500 credits) ~8% more",
          "650 images, or 325 songs, or 216 videos",
          "High priority processing"
        ],
        limitations: [
          "Standard processing speed",
          "Non-commercial use only",
          "4 AI voices",
          "Watermarks"
        ],
      ),SizedBox(height: 5,),
      SubscriptionCard(
        title: "Creator",
        price: "149.99",
        billingCycle: "year",
        isMostPopular: true,
        features: [
          "1,250 credits per month (total 15,000 credits) ~25% more!",
          "8 AI voices",
          "High priority processing",
          "No watermarks",
          "fast generation speed",
          "Commercial use allowed"
        ],

      ),SizedBox(height: 5,),
      SubscriptionCard(
        title: "Premium",
        price: "299.99",
        billingCycle: "year",
        features: [
          "2,920 credits per month (total 35,000 credits) ~25% more!",
          "Commercial use allowed",
          "3,500 images, or 1,750 songs, or 1,166 videos",
          "All 10 AI voices",
          "High priority processing",
          "No watermarks",
          "Fastest generation speed"
        ],


      ),
    ];
  }


}
