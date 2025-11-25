import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPACEZ Coupons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const CouponsPage(),
    );
  }
}

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  void _showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // First Header: SPACEZ logo and hamburger menu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home_outlined, color: Color(0xFFB85C38), size: 24),
                      const SizedBox(width: 6),
                      const Text(
                        'SPACEZ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB85C38),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Color(0xFFB85C38), size: 24),
                    onPressed: () => _showSuccessMessage(context, 'Menu opened'),
                  ),
                ],
              ),
            ),
            // Divider
            const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
            // Second Header: Back button and Coupons title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
                    onPressed: () => _showSuccessMessage(context, 'Back button pressed'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Coupons',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Separator line after Coupons header
            const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
            // Content - Scrollable coupons section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CouponCard(
                        discount: '₹ 2000',
                        discountText: 'OFF',
                        brandName: 'LONGSTAY',
                        description: '10% off when you book for 3 days or more and 20% off when you book for 14 days or more',
                        discountColor: const Color(0xFFB85C38),
                        onApply: () => _showSuccessMessage(context, 'Coupon applied successfully!'),
                        onReadMore: () => _showSuccessMessage(context, 'Read more clicked'),
                      ),
                      const SizedBox(height: 16),
                      CouponCard(
                        discount: '₹ 1000',
                        discountText: 'OFF',
                        brandName: 'LONGSTAY',
                        description: '10% off when you book for 3 days or more and 20% off when you book for 14 days or more',
                        discountColor: const Color(0xFFB85C38),
                        onApply: () => _showSuccessMessage(context, 'Coupon applied successfully!'),
                        onReadMore: () => _showSuccessMessage(context, 'Read more clicked'),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Payment Offers:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CouponCard(
                        discount: '₹ 1000',
                        discountText: 'OFF',
                        brandName: 'LONGSTAY',
                        description: '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
                        discountColor: const Color(0xFFB85C38),
                        onApply: () => _showSuccessMessage(context, 'Coupon applied successfully!'),
                        onReadMore: () => _showSuccessMessage(context, 'Read more clicked'),
                      ),
                      const SizedBox(height: 16),
                      CouponCard(
                        discount: '₹ 6,900',
                        discountText: 'OFF',
                        brandName: 'LONGSTAY',
                        description: '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
                        discountColor: const Color(0xFFB85C38),
                        onApply: () => _showSuccessMessage(context, 'Coupon applied successfully!'),
                        onReadMore: () => _showSuccessMessage(context, 'Read more clicked'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Full-width bottom Payment Details section
            PaymentDetailsSection(
              originalPrice: '₹19,500',
              discountedPrice: '₹16,000',
              duration: '2 nights',
              dateRange: '24 Apr - 26 Apr',
              guestCount: '8 guests',
              bannerText: 'Book now & Unlock exclusive rewards!',
              onReserve: () => _showSuccessMessage(context, 'Reservation successful!'),
              onEditDetails: () => _showSuccessMessage(context, 'Edit dates/guests clicked'),
            ),
          ],
        ),
      ),
    );
  }
}

class CouponCard extends StatelessWidget {
  final String discount;
  final String discountText;
  final String brandName;
  final String description;
  final Color discountColor;
  final VoidCallback onApply;
  final VoidCallback onReadMore;

  const CouponCard({
    super.key,
    required this.discount,
    required this.discountText,
    required this.brandName,
    required this.description,
    required this.discountColor,
    required this.onApply,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: discountColor,
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Vertical dashed line separator
            CustomPaint(
              size: const Size(1, double.infinity),
              painter: VerticalDashedLinePainter(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          brandName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: onApply,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.local_offer_outlined,
                                  size: 14,
                                  color: Color(0xFFB85C38),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Apply',
                                  style: TextStyle(
                                    color: Color(0xFFB85C38),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF666666),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: onReadMore,
                      child: const Text(
                        'Read more',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB85C38),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentDetailsSection extends StatelessWidget {
  final String originalPrice;
  final String discountedPrice;
  final String duration;
  final String dateRange;
  final String guestCount;
  final String bannerText;
  final VoidCallback onReserve;
  final VoidCallback onEditDetails;

  const PaymentDetailsSection({
    super.key,
    required this.originalPrice,
    required this.discountedPrice,
    required this.duration,
    required this.dateRange,
    required this.guestCount,
    required this.bannerText,
    required this.onReserve,
    required this.onEditDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
      child: Column(
        children: [
          // Green banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFF2D7A4F),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  bannerText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Price and Reserve button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Starts from ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF666666),
                          ),
                        ),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          discountedPrice,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          originalPrice,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF999999),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                ElevatedButton(
                  onPressed: onReserve,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD97942),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Reserve',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Date and Guests section
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Row(
              children: [
                Text(
                  '$dateRange | $guestCount',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: onEditDetails,
                  child: const Icon(
                    Icons.edit,
                    size: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for vertical dashed line (perforated edge)
class VerticalDashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    const dashHeight = 6.0;
    const dashSpace = 3.0;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Custom painter for dashed line
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
