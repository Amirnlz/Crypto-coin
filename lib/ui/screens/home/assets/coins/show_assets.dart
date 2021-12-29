import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/coin-wallet/coin_wallet_bloc.dart';
import '../../../../../constant/constans.dart';
import '../bottomSheet/add_coin_bottom_sheet.dart';
import 'asset_coin_list_tile.dart';

class ShowAssets extends StatelessWidget {
  const ShowAssets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Assets',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              addCoin(context, size),
            ],
          ),
          BlocBuilder(
            bloc: BlocProvider.of<CoinWalletBloc>(context)
              ..add(GetCoinWallet()),
            builder: (context, state) {
              if (state is CoinWalletLoading) {
                return buildLoadingWidget(size);
              } else if (state is CoinWalletListLoaded) {
                return buildItems(state, size);
              }
              return const Text('There is no Coin');
            },
          ),
        ],
      ),
    );
  }

  Widget buildItems(CoinWalletListLoaded state, Size size) {
    int length = state.coinsWallet.length;
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          minHeight: size.height * 0.5,
          maxWidth: size.width * 0.9,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: length,
          itemBuilder: (context, index) {
            return AssetCoinListTile(coinWallet: state.coinsWallet[index]);
          },
        ),
      ),
    );
  }

  Center buildLoadingWidget(Size size) {
    return Center(
      child: SizedBox(
        height: size.height * 0.12,
        width: size.width * 0.24,
        child: kLoadingIndecator,
      ),
    );
  }

  Widget addCoin(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) => const AddCoinBottomSheet(),
      ),
      child: Icon(
        Icons.add_outlined,
        size: size.width * 0.07,
      ),
    );
  }
}
