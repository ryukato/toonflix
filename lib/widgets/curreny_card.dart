import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final int order;

  final _blackColor = const Color(0xFF1F2123);
  final _whiteColor = Colors.white;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.order,
  }) : assert(order > 0);

  Color resolveColor() {
    return isInverted() ? _whiteColor : _blackColor;
  }

  Offset resolveOffset() {
    return Offset(0, -20 * (order - 1));
  }

  bool isInverted() {
    return order % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: resolveOffset(),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted() ? _whiteColor : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted() ? _blackColor : _whiteColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted() ? _blackColor : _whiteColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted()
                              ? _blackColor.withOpacity(0.8)
                              : _whiteColor.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(0, 12),
                  child: Icon(
                    icon,
                    color: isInverted() ? _blackColor : _whiteColor,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
