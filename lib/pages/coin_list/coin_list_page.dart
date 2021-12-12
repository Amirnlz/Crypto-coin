import 'package:crypto_coin/helpers/constans.dart';
import 'package:crypto_coin/helpers/extension.dart';
import 'package:crypto_coin/model/coin.dart';
import 'package:crypto_coin/service/coin_services.dart';
import 'package:crypto_coin/pages/coin_list/coin_card.dart';
import 'package:flutter/material.dart';

class CoinListPage extends StatelessWidget {
  const CoinListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: CoinServices().getCoinsList(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Text('Check your Internet connection.'),
                  );
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: SizedBox(
                      height: context.height * 0.15,
                      width: context.width * 0.3,
                      child: kLoadingIndecator,
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                      ),
                    );
                  } else if (snapshot.hasData) {
                    List<Coin> coins = snapshot.data! as List<Coin>;
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: context.height,
                        maxWidth: context.width,
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: coins.length,
                        itemBuilder: (context, index) {
                          final coin = coins[index];
                          return CoinCard(
                            coin: coin,
                          );
                        },
                      ),
                    );
                  }
              }
              return const Center(
                child: Text('is null.'),
              );
            },
          ),
        ),
      ),
    );
  }
}
