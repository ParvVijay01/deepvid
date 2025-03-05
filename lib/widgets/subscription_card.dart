import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String billingCycle;
  final List<String> features;
  final List<String>? limitations; // Made limitations optional
  final bool isCurrentPlan;
  final bool isMostPopular;

  const SubscriptionCard({
    Key? key,
    required this.title,
    required this.price,
    required this.billingCycle,
    required this.features,
    this.limitations, // Now nullable
    this.isCurrentPlan = false,
    this.isMostPopular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedBillingCycle =
    billingCycle.toLowerCase() == "month" ? "Billed Monthly" : "Billed Yearly";

    return Stack(
      clipBehavior: Clip.none, // Allows badge to overflow
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple.shade700),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.card_giftcard, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Text(
                formattedBillingCycle,
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 10),
              Text(
                "\$$price / $billingCycle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.white24),
              SizedBox(height: 10),
              Text(
                "Features",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              ...features.map((feature) => Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 16),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )),
              SizedBox(height: 10),

              // Only show limitations if they exist
              if (limitations != null && limitations!.isNotEmpty) ...[
                Text(
                  "Limitations",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                ...limitations!.map((limitation) => Row(
                  children: [
                    Icon(Icons.star_border, color: Colors.white38, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        limitation,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 10),
              ],

              // Full-width button
              SizedBox(
                width: double.infinity, // Makes the button take full width
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isCurrentPlan ? "✔ Current Plan" : "Choose Plan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),

        // "Most Popular" Badge
        if (isMostPopular)
          Positioned(
            top: -5,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Most Popular",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
