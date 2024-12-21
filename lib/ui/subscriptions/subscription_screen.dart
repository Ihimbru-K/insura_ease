import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/subscription_provider.dart';
import '../widgets/subscription_card.dart';

class SubscriptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return FutureBuilder(
      future: subscriptionProvider.fetchSubscriptions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: subscriptionProvider.subscriptions.length,
            itemBuilder: (context, index) {
              return SubscriptionCard(subscription: subscriptionProvider.subscriptions[index]);
            },
          );
        }
      },
    );
  }
}
