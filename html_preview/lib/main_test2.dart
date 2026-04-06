import 'package:flutter/material.dart';
import 'preview_shell.dart';

void main() => runApp(PreviewShell(pages: [_content()]));

Widget _content() => UnconstrainedBox(
  alignment: Alignment.topLeft,
  child: LayoutBuilder(
  builder: (context, constraints) {
    final availableWidth = constraints.maxWidth;

    final fixedTotal = 1996.0;
    final flexSpace = availableWidth.isInfinite ? 0.0 : (availableWidth - fixedTotal).clamp(0.0, double.infinity);
    final flexUnit = availableWidth.isInfinite ? 200.0 : flexSpace / 0.001000;
    final colWidths = <double>[
      185.0,
      41.0,
      54.0,
      60.0,
      107.0,
      41.0,
      105.0,
      177.0,
      92.0,
      106.0,
      105.0,
      41.0,
      76.0,
      63.0,
      49.0,
      68.0,
      41.0,
      41.0,
      41.0,
      49.0,
      49.0,
      48.0,
      57.0,
      57.0,
      66.0,
      41.0,
      52.0,
      84.0,
    ];

    final rowHeights = <double>[76.0, 76.0, 65.0, 34.0, 66.0, 87.0, 63.0, 96.0, 54.0, 52.0, 34.0, 35.0, 43.0, 85.0, 66.0, 50.0, 96.0, 96.0, 126.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 96.0, 36.0, 126.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 36.0, 96.0, 36.0, 63.0, 150.0, 54.0, 66.0, 66.0, 216.0, 96.0, 66.0, 46.0, 64.0, 65.0, 65.0, 65.0, 64.0, 65.0, 65.0, 65.0];

    final cs = <double>[0.0];
    for (final w in colWidths) { cs.add(cs.last + w); }
    final rs = <double>[0.0];
    for (final h in rowHeights) { rs.add(rs.last + h); }

    final totalWidth = cs.last;
    final totalHeight = rs.last;

    Positioned cell(int c, int r, int ce, int re,
        {Border? border, Color? bg, EdgeInsets pad = EdgeInsets.zero,
        Alignment align = Alignment.centerLeft, required Widget child}) =>
      Positioned(left: cs[c], top: rs[r], width: cs[ce] - cs[c], height: rs[re] - rs[r],
          child: Container(
              decoration: (border != null || bg != null) ? BoxDecoration(border: border, color: bg) : null,
              padding: pad, alignment: align, child: child));

    final matrixData = <List<int>>[
      <int>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
      <int>[29, 30, 31, 32, 33, 34, 35, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 50, 51, 51, 51, 51],
      <int>[52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79],
      <int>[80, 80, 80, 80, 81, 81, 82, 82, 82, 82, 82, 82, 82, 82, 82, 82, 83, 83, 83, 83, 83, 83, 84, 84, 84, 85, 85, 85],
      <int>[86, 86, 86, 86, 87, 87, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 89, 89, 89, 89, 89, 89, 90, 90, 90, 91, 91, 91],
      <int>[86, 86, 86, 86, 87, 87, 88, 88, 88, 88, 88, 88, 88, 88, 88, 88, 89, 89, 89, 89, 89, 89, 92, 92, 92, 93, 93, 93],
      <int>[94, 94, 94, 94, 95, 95, 95, 95, 96, 97, 97, 97, 97, 97, 97, 98, 99, 99, 99, 99, 99, 99, 99, 100, 100, 100, 100, 100],
      <int>[101, 101, 101, 101, 102, 102, 102, 102, 103, 104, 104, 104, 104, 104, 104, 105, 106, 106, 106, 106, 106, 106, 106, 107, 107, 107, 107, 107],
      <int>[101, 101, 101, 101, 102, 102, 102, 102, 108, 104, 104, 104, 104, 104, 104, 109, 106, 106, 106, 106, 106, 106, 106, 107, 107, 107, 107, 107],
      <int>[101, 101, 101, 101, 102, 102, 102, 102, 110, 104, 104, 104, 104, 104, 104, 111, 106, 106, 106, 106, 106, 106, 106, 107, 107, 107, 107, 107],
      <int>[112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 129, 129, 129, 129, 129, 129, 129, 130, 130, 130],
      <int>[131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131, 131],
      <int>[132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132, 132],
      <int>[133, 133, 133, 133, 133, 133, 133, 133, 134, 134, 134, 134, 134, 134, 134, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146],
      <int>[147, 147, 147, 147, 147, 147, 147, 147, 148, 148, 148, 148, 148, 148, 148, 148, 149, 149, 149, 149, 149, 149, 149, 149, 149, 149, 149, 149],
      <int>[150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 151, 151, 151, 151, 152, 152, 152, 152],
      <int>[153, 154, 155, 155, 155, 156, 156, 156, 157, 157, 157, 158, 158, 158, 158, 158, 158, 158, 158, 158, 159, 159, 160, 161, 162, 163, 164, 164],
      <int>[153, 154, 155, 155, 155, 156, 156, 156, 165, 166, 167, 158, 158, 158, 158, 158, 158, 158, 158, 158, 159, 159, 160, 161, 162, 163, 164, 164],
      <int>[168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168, 168],
      <int>[169, 170, 171, 171, 171, 172, 172, 172, 173, 174, 175, 176, 176, 176, 176, 176, 176, 176, 176, 176, 177, 177, 178, 179, 180, 181, 182, 182],
      <int>[169, 183, 184, 184, 184, 185, 185, 185, 186, 187, 188, 189, 189, 189, 189, 189, 189, 189, 189, 189, 190, 190, 191, 192, 193, 194, 195, 195],
      <int>[196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196, 196],
      <int>[197, 198, 199, 199, 199, 200, 200, 200, 201, 202, 203, 204, 204, 204, 204, 204, 204, 204, 204, 204, 205, 205, 206, 207, 208, 209, 210, 210],
      <int>[197, 211, 212, 212, 212, 213, 213, 213, 214, 215, 216, 217, 217, 217, 217, 217, 217, 217, 217, 217, 218, 218, 219, 220, 221, 222, 223, 223],
      <int>[224, 225, 226, 226, 226, 227, 227, 227, 228, 229, 230, 231, 231, 231, 231, 231, 231, 231, 231, 231, 232, 232, 233, 234, 235, 236, 237, 237],
      <int>[224, 238, 239, 239, 239, 240, 240, 240, 241, 242, 243, 244, 244, 244, 244, 244, 244, 244, 244, 244, 245, 245, 246, 247, 248, 249, 250, 250],
      <int>[251, 252, 253, 253, 253, 254, 254, 254, 255, 256, 257, 258, 258, 258, 258, 258, 258, 258, 258, 258, 259, 259, 260, 261, 262, 263, 264, 264],
      <int>[251, 265, 266, 266, 266, 267, 267, 267, 268, 269, 270, 271, 271, 271, 271, 271, 271, 271, 271, 271, 272, 272, 273, 274, 275, 276, 277, 277],
      <int>[278, 279, 280, 280, 280, 281, 281, 281, 282, 283, 284, 285, 285, 285, 285, 285, 285, 285, 285, 285, 286, 286, 287, 288, 289, 290, 291, 291],
      <int>[278, 292, 293, 293, 293, 294, 294, 294, 295, 296, 297, 298, 298, 298, 298, 298, 298, 298, 298, 298, 299, 299, 300, 301, 302, 303, 304, 304],
      <int>[305, 306, 307, 307, 307, 308, 308, 308, 309, 310, 311, 312, 312, 312, 312, 312, 312, 312, 312, 312, 313, 313, 314, 315, 316, 317, 318, 318],
      <int>[305, 319, 320, 320, 320, 321, 321, 321, 322, 323, 324, 325, 325, 325, 325, 325, 325, 325, 325, 325, 326, 326, 327, 328, 329, 330, 331, 331],
      <int>[332, 333, 333, 333, 333, 334, 334, 334, 334, 334, 334, 335, 335, 335, 335, 335, 335, 335, 335, 335, 336, 336, 337, 338, 339, 340, 341, 341],
      <int>[342, 343, 344, 344, 344, 345, 345, 345, 345, 345, 345, 346, 346, 346, 346, 346, 346, 346, 346, 346, 347, 347, 348, 349, 350, 351, 352, 352],
      <int>[342, 353, 354, 354, 354, 355, 355, 355, 355, 355, 355, 356, 356, 356, 356, 356, 356, 356, 356, 356, 357, 357, 358, 359, 360, 361, 362, 362],
      <int>[363, 364, 365, 365, 365, 366, 366, 366, 366, 366, 366, 367, 367, 367, 367, 367, 367, 367, 367, 367, 368, 368, 369, 370, 371, 372, 373, 373],
      <int>[363, 374, 375, 375, 375, 376, 376, 376, 376, 376, 376, 377, 377, 377, 377, 377, 377, 377, 377, 377, 378, 378, 379, 380, 381, 382, 383, 383],
      <int>[384, 385, 386, 386, 386, 387, 387, 387, 387, 387, 387, 388, 388, 388, 388, 388, 388, 388, 388, 388, 389, 389, 390, 391, 392, 393, 394, 394],
      <int>[384, 395, 396, 396, 396, 397, 397, 397, 397, 397, 397, 398, 398, 398, 398, 398, 398, 398, 398, 398, 399, 399, 400, 401, 402, 403, 404, 404],
      <int>[405, 406, 407, 407, 407, 408, 408, 408, 408, 408, 408, 409, 409, 409, 409, 409, 409, 409, 409, 409, 410, 410, 411, 412, 413, 414, 415, 415],
      <int>[405, 416, 417, 417, 417, 418, 418, 418, 418, 418, 418, 419, 419, 419, 419, 419, 419, 419, 419, 419, 420, 420, 421, 422, 423, 424, 425, 425],
      <int>[426, 427, 428, 428, 428, 429, 429, 429, 429, 429, 429, 430, 430, 430, 430, 430, 430, 430, 430, 430, 431, 431, 432, 433, 434, 435, 436, 436],
      <int>[426, 437, 438, 438, 438, 439, 439, 439, 439, 439, 439, 440, 440, 440, 440, 440, 440, 440, 440, 440, 441, 441, 442, 443, 444, 445, 446, 446],
      <int>[447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474],
      <int>[475, 475, 475, 475, 475, 475, 475, 475, 476, 476, 476, 476, 476, 476, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489],
      <int>[475, 475, 475, 475, 475, 475, 475, 475, 490, 491, 492, 493, 493, 494, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507],
      <int>[475, 475, 475, 475, 475, 475, 475, 475, 508, 509, 510, 511, 511, 512, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525],
      <int>[475, 475, 475, 475, 475, 475, 475, 475, 526, 527, 528, 529, 529, 530, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543],
      <int>[475, 475, 475, 475, 475, 475, 475, 475, 544, 545, 546, 547, 547, 548, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561],
      <int>[475, 475, 475, 475, 475, 475, 475, 475, 562, 563, 564, 565, 565, 566, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579],
      <int>[580, 581, 582, 582, 583, 583, 583, 583, 584, 585, 586, 587, 587, 588, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601],
      <int>[580, 581, 602, 602, 603, 603, 603, 603, 584, 585, 586, 587, 587, 588, 588, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616],
      <int>[580, 617, 618, 618, 619, 619, 619, 619, 620, 621, 622, 623, 623, 624, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637],
      <int>[580, 617, 638, 638, 639, 639, 639, 639, 620, 621, 622, 623, 623, 624, 624, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652],
      <int>[580, 653, 654, 654, 655, 655, 655, 655, 656, 657, 658, 659, 659, 660, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673],
      <int>[580, 653, 674, 674, 675, 675, 675, 675, 656, 657, 658, 659, 659, 660, 660, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688],
      <int>[580, 689, 690, 690, 691, 691, 691, 691, 692, 693, 694, 695, 695, 696, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709],
      <int>[580, 689, 710, 710, 711, 711, 711, 711, 692, 693, 694, 695, 695, 696, 696, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724],
      <int>[580, 725, 726, 726, 727, 727, 727, 727, 728, 729, 730, 731, 731, 732, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745],
      <int>[580, 725, 746, 746, 747, 747, 747, 747, 728, 729, 730, 731, 731, 732, 732, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760],
    ];

    return SizedBox(
      width: totalWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          cell(0, 0, 28, 1, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 47.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('QUALITY MANAGEMENT SYSTEM AND ITS PROCESS : (PROCESS APPROACH)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              )),
          cell(0, 1, 1, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(1, 1, 2, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(2, 1, 3, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(3, 1, 4, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(4, 1, 5, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(5, 1, 6, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(6, 1, 7, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(7, 1, 8, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(8, 1, 9, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(9, 1, 10, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(10, 1, 11, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(11, 1, 12, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(12, 1, 13, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(13, 1, 14, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(14, 1, 15, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(15, 1, 16, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(16, 1, 17, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(17, 1, 18, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(18, 1, 19, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(19, 1, 20, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(20, 1, 21, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(21, 1, 22, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(22, 1, 23, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(23, 1, 24, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(24, 1, 25, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(25, 1, 26, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(26, 1, 27, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(27, 1, 28, 2, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),






          cell(6, 2, 8, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(8, 2, 9, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(9, 2, 10, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), child: const SizedBox.shrink()),
          cell(10, 2, 11, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(11, 2, 12, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(12, 2, 13, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), child: const SizedBox.shrink()),
          cell(13, 2, 14, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(14, 2, 15, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(15, 2, 16, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(16, 2, 17, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(17, 2, 18, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(18, 2, 19, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(19, 2, 20, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(20, 2, 21, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          cell(21, 2, 22, 3, bg: Color(0xFFFFFFFF), pad: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), align: Alignment.center, child: const SizedBox.shrink()),
          Positioned(left: cs[22], top: rs[2], width: cs[24] - cs[22], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Division / Team', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[24], top: rs[2], width: cs[28] - cs[24], height: rs[3] - rs[2], child: Container(
              decoration: BoxDecoration(color: Color(0xFFF2F2F2), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[3], width: cs[1] - cs[0], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[3], width: cs[2] - cs[1], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[3], width: cs[3] - cs[2], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[3], width: cs[4] - cs[3], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[3], width: cs[5] - cs[4], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[3], width: cs[6] - cs[5], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[3], width: cs[7] - cs[6], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[3], width: cs[8] - cs[7], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[3], width: cs[9] - cs[8], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[3], width: cs[10] - cs[9], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[3], width: cs[11] - cs[10], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[3], width: cs[12] - cs[11], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[12], top: rs[3], width: cs[13] - cs[12], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[13], top: rs[3], width: cs[14] - cs[13], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[14], top: rs[3], width: cs[15] - cs[14], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[3], width: cs[16] - cs[15], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[3], width: cs[17] - cs[16], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[17], top: rs[3], width: cs[18] - cs[17], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[18], top: rs[3], width: cs[19] - cs[18], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[19], top: rs[3], width: cs[20] - cs[19], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[3], width: cs[21] - cs[20], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[21], top: rs[3], width: cs[22] - cs[21], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[3], width: cs[23] - cs[22], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[3], width: cs[24] - cs[23], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[3], width: cs[25] - cs[24], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[3], width: cs[26] - cs[25], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[3], width: cs[27] - cs[26], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[27], top: rs[3], width: cs[28] - cs[27], height: rs[4] - rs[3], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[4], width: cs[4] - cs[0], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ทรัพยากรที่ต้องใช้ (Resources)', sz: 20.0, color: Color(0xFF000000), align: TextAlign.center))),
          Positioned(left: cs[4], top: rs[4], width: cs[6] - cs[4], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'จำนวน (amount)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[6], top: rs[4], width: cs[16] - cs[6], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('อำนาจหน้าที่ความรับผิดชอบ (Person in charge)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[16], top: rs[4], width: cs[22] - cs[16], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('อุปกรณ์ (equipment)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[22], top: rs[4], width: cs[25] - cs[22], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Prepare by', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[4], width: cs[28] - cs[25], height: rs[5] - rs[4], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Approved by', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[0], top: rs[5], width: cs[4] - cs[0], height: rs[7] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[5], width: cs[6] - cs[4], height: rs[7] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[5], width: cs[16] - cs[6], height: rs[7] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[5], width: cs[22] - cs[16], height: rs[7] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[5], width: cs[25] - cs[22], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[5], width: cs[28] - cs[25], height: rs[6] - rs[5], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[6], width: cs[25] - cs[22], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Date :', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[25], top: rs[6], width: cs[28] - cs[25], height: rs[7] - rs[6], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Date :', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[0], top: rs[7], width: cs[4] - cs[0], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ความสัมพันธ์กับกระบวนการอื่นๆ (Relationship with other processes)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[4], top: rs[7], width: cs[8] - cs[4], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('In put', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),

          Positioned(left: cs[9], top: rs[7], width: cs[15] - cs[9], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('↑', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[15], top: rs[7], width: cs[16] - cs[15], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[7], width: cs[23] - cs[16], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Out put', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[23], top: rs[7], width: cs[28] - cs[23], height: rs[8] - rs[7], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ความสัมพันธ์กับกระบวนการอื่นๆ (Relationship with other processes)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[8], width: cs[4] - cs[0], height: rs[11] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[8], width: cs[8] - cs[4], height: rs[11] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[8], width: cs[9] - cs[8], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[8], width: cs[15] - cs[9], height: rs[11] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[8], width: cs[16] - cs[15], height: rs[9] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[8], width: cs[23] - cs[16], height: rs[11] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[8], width: cs[28] - cs[23], height: rs[11] - rs[8], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[9], width: cs[9] - cs[8], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('←', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[15], top: rs[9], width: cs[16] - cs[15], height: rs[10] - rs[9], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('→', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[8], top: rs[10], width: cs[9] - cs[8], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[10], width: cs[16] - cs[15], height: rs[11] - rs[10], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[11], width: cs[1] - cs[0], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[11], width: cs[2] - cs[1], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[11], width: cs[3] - cs[2], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[11], width: cs[4] - cs[3], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[11], width: cs[5] - cs[4], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[11], width: cs[6] - cs[5], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[11], width: cs[7] - cs[6], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[11], width: cs[8] - cs[7], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[11], width: cs[9] - cs[8], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[11], width: cs[10] - cs[9], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[11], width: cs[11] - cs[10], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[11], width: cs[12] - cs[11], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[12], top: rs[11], width: cs[13] - cs[12], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[13], top: rs[11], width: cs[14] - cs[13], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[14], top: rs[11], width: cs[15] - cs[14], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[15], top: rs[11], width: cs[16] - cs[15], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[11], width: cs[17] - cs[16], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[17], top: rs[11], width: cs[25] - cs[17], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[11], width: cs[28] - cs[25], height: rs[12] - rs[11], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[12], width: cs[28] - cs[0], height: rs[13] - rs[12], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('1. เกณฑ์และวิธีการ/ ความรู้ที่จำเป็นในการควบคุม กระบวนการนี้ (Criteria and methods / knowledge needed to control this process.)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[0], top: rs[13], width: cs[28] - cs[0], height: rs[14] - rs[13], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[14], width: cs[8] - cs[0], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('2. ดัชนีชี้วัดสมรรถนะและประเมินผลของกระบวนการ (Key Performance Indicator (KPI))', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[8], top: rs[14], width: cs[16] - cs[8], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('เป้าหมาย (Target)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[16], top: rs[14], width: cs[17] - cs[16], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Jan', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[17], top: rs[14], width: cs[18] - cs[17], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Feb', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[18], top: rs[14], width: cs[19] - cs[18], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Mar', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[19], top: rs[14], width: cs[20] - cs[19], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Apr', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[20], top: rs[14], width: cs[21] - cs[20], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('May', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[21], top: rs[14], width: cs[22] - cs[21], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Jun', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[22], top: rs[14], width: cs[23] - cs[22], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Jul', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[23], top: rs[14], width: cs[24] - cs[23], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Aug', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[24], top: rs[14], width: cs[25] - cs[24], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Sep', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[14], width: cs[26] - cs[25], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Oct', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[26], top: rs[14], width: cs[27] - cs[26], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Nov', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[27], top: rs[14], width: cs[28] - cs[27], height: rs[15] - rs[14], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('Dec', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[0], top: rs[15], width: cs[8] - cs[0], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[15], width: cs[16] - cs[8], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[16], top: rs[15], width: cs[28] - cs[16], height: rs[16] - rs[15], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[16], width: cs[20] - cs[0], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: '3.ความเสี่ยง / โอกาส ที่มีผลต่อความสอดคล้องของสินค้าและบริการ และความพึงพอใจของลูกค้า (Risks / Opportunities that Affect Product and Service Needs and Customer) Satisfaction', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[20], top: rs[16], width: cs[24] - cs[20], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('แผนงาน (Plan)', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[24], top: rs[16], width: cs[28] - cs[24], height: rs[17] - rs[16], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'การประเมินประสิทธิผล (Evaluation of Effectiveness)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[17], width: cs[1] - cs[0], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'หัวข้อที่ใช้ประเมินความเสี่ยง Risk Evaluation Points', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[17], width: cs[2] - cs[1], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ข้อที่', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[17], width: cs[5] - cs[2], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'จุดอ่อนของกระบวนการ (Weak point )', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[17], width: cs[8] - cs[5], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ประเด็นความเสี่ยงที่พิจารณา Risk factors considered in the assessment', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[8], top: rs[17], width: cs[11] - cs[8], height: rs[18] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('คะแนนประเมินความเสี่ยง', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[17], width: cs[20] - cs[11], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แนวทางการจัดการความเสี่ยง ( Action to address risk )', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[20], top: rs[17], width: cs[22] - cs[20], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ผู้รับผิดชอบ (PIC)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[22], top: rs[17], width: cs[23] - cs[22], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'เริ่ม (Start)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[23], top: rs[17], width: cs[24] - cs[23], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'เสร็จ (Finish)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[24], top: rs[17], width: cs[25] - cs[24], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('YES', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[17], width: cs[26] - cs[25], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('NO', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[26], top: rs[17], width: cs[28] - cs[26], height: rs[19] - rs[17], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แผนปรับปรุง Next Action', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[8], top: rs[18], width: cs[9] - cs[8], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'โอกาสเกิด (Likelihood)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[9], top: rs[18], width: cs[10] - cs[9], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ผลกระทบ (Impact)', sz: 20.0, color: Color(0xFF000000), align: TextAlign.center))),
          Positioned(left: cs[10], top: rs[18], width: cs[11] - cs[10], height: rs[19] - rs[18], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFDEADA), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ระดับความเสี่ยง (L x I)', sz: 20.0, color: Color(0xFF000000), align: TextAlign.center))),
          Positioned(left: cs[0], top: rs[19], width: cs[28] - cs[0], height: rs[20] - rs[19], child: Container(
              decoration: BoxDecoration(color: Color(0xFFD9D9D9), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('ความเสี่ยงต่อเป้าหมาย', sz: 20.0))),
          Positioned(left: cs[0], top: rs[20], width: cs[1] - cs[0], height: rs[22] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[20], width: cs[2] - cs[1], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('1', sz: 20.0, align: TextAlign.center))),
          Positioned(left: cs[2], top: rs[20], width: cs[5] - cs[2], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[20], width: cs[8] - cs[5], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[20], width: cs[9] - cs[8], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[20], width: cs[10] - cs[9], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[20], width: cs[11] - cs[10], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[20], width: cs[20] - cs[11], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[20], width: cs[22] - cs[20], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[20], width: cs[23] - cs[22], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[20], width: cs[24] - cs[23], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[20], width: cs[25] - cs[24], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[20], width: cs[26] - cs[25], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[20], width: cs[28] - cs[26], height: rs[21] - rs[20], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[21], width: cs[2] - cs[1], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[21], width: cs[5] - cs[2], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[21], width: cs[8] - cs[5], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[21], width: cs[9] - cs[8], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[21], width: cs[10] - cs[9], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[21], width: cs[11] - cs[10], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[21], width: cs[20] - cs[11], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[21], width: cs[22] - cs[20], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[21], width: cs[23] - cs[22], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[21], width: cs[24] - cs[23], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[21], width: cs[25] - cs[24], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[21], width: cs[26] - cs[25], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[21], width: cs[28] - cs[26], height: rs[22] - rs[21], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[22], width: cs[28] - cs[0], height: rs[23] - rs[22], child: Container(
              decoration: BoxDecoration(color: Color(0xFFD9D9D9), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('ความเสี่ยงต่อกระบวนการ', sz: 20.0))),
          Positioned(left: cs[0], top: rs[23], width: cs[1] - cs[0], height: rs[25] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Man (คน)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[23], width: cs[2] - cs[1], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[23], width: cs[5] - cs[2], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[23], width: cs[8] - cs[5], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[23], width: cs[9] - cs[8], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[23], width: cs[10] - cs[9], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[23], width: cs[11] - cs[10], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[23], width: cs[20] - cs[11], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[23], width: cs[22] - cs[20], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[23], width: cs[23] - cs[22], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[23], width: cs[24] - cs[23], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[23], width: cs[25] - cs[24], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[23], width: cs[26] - cs[25], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[23], width: cs[28] - cs[26], height: rs[24] - rs[23], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[24], width: cs[2] - cs[1], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[24], width: cs[5] - cs[2], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[24], width: cs[8] - cs[5], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[24], width: cs[9] - cs[8], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[24], width: cs[10] - cs[9], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[24], width: cs[11] - cs[10], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[24], width: cs[20] - cs[11], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[24], width: cs[22] - cs[20], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[24], width: cs[23] - cs[22], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[24], width: cs[24] - cs[23], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[24], width: cs[25] - cs[24], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[24], width: cs[26] - cs[25], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[24], width: cs[28] - cs[26], height: rs[25] - rs[24], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[25], width: cs[1] - cs[0], height: rs[27] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Machine (อุปกรณ์)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[25], width: cs[2] - cs[1], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[25], width: cs[5] - cs[2], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[25], width: cs[8] - cs[5], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[25], width: cs[9] - cs[8], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[25], width: cs[10] - cs[9], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[25], width: cs[11] - cs[10], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[25], width: cs[20] - cs[11], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[25], width: cs[22] - cs[20], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[25], width: cs[23] - cs[22], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[25], width: cs[24] - cs[23], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[25], width: cs[25] - cs[24], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[25], width: cs[26] - cs[25], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[25], width: cs[28] - cs[26], height: rs[26] - rs[25], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[26], width: cs[2] - cs[1], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[26], width: cs[5] - cs[2], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[26], width: cs[8] - cs[5], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[26], width: cs[9] - cs[8], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[26], width: cs[10] - cs[9], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[26], width: cs[11] - cs[10], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[26], width: cs[20] - cs[11], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[26], width: cs[22] - cs[20], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[26], width: cs[23] - cs[22], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[26], width: cs[24] - cs[23], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[26], width: cs[25] - cs[24], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[26], width: cs[26] - cs[25], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[26], width: cs[28] - cs[26], height: rs[27] - rs[26], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[27], width: cs[1] - cs[0], height: rs[29] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Method (วิธีการ)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[27], width: cs[2] - cs[1], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[27], width: cs[5] - cs[2], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[27], width: cs[8] - cs[5], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[27], width: cs[9] - cs[8], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[27], width: cs[10] - cs[9], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[27], width: cs[11] - cs[10], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[27], width: cs[20] - cs[11], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[27], width: cs[22] - cs[20], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[27], width: cs[23] - cs[22], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[27], width: cs[24] - cs[23], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[27], width: cs[25] - cs[24], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[27], width: cs[26] - cs[25], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[27], width: cs[28] - cs[26], height: rs[28] - rs[27], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[28], width: cs[2] - cs[1], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[28], width: cs[5] - cs[2], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[28], width: cs[8] - cs[5], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[28], width: cs[9] - cs[8], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[28], width: cs[10] - cs[9], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[28], width: cs[11] - cs[10], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[28], width: cs[20] - cs[11], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[28], width: cs[22] - cs[20], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[28], width: cs[23] - cs[22], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[28], width: cs[24] - cs[23], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[28], width: cs[25] - cs[24], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[28], width: cs[26] - cs[25], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[28], width: cs[28] - cs[26], height: rs[29] - rs[28], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[29], width: cs[1] - cs[0], height: rs[31] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Material (วัสดุ)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[29], width: cs[2] - cs[1], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[29], width: cs[5] - cs[2], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[29], width: cs[8] - cs[5], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[29], width: cs[9] - cs[8], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[29], width: cs[10] - cs[9], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[29], width: cs[11] - cs[10], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[29], width: cs[20] - cs[11], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[29], width: cs[22] - cs[20], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[29], width: cs[23] - cs[22], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[29], width: cs[24] - cs[23], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[29], width: cs[25] - cs[24], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[29], width: cs[26] - cs[25], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[29], width: cs[28] - cs[26], height: rs[30] - rs[29], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[30], width: cs[2] - cs[1], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[30], width: cs[5] - cs[2], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[30], width: cs[8] - cs[5], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[30], width: cs[9] - cs[8], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[30], width: cs[10] - cs[9], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[30], width: cs[11] - cs[10], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[30], width: cs[20] - cs[11], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[30], width: cs[22] - cs[20], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[30], width: cs[23] - cs[22], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[30], width: cs[24] - cs[23], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[30], width: cs[25] - cs[24], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[30], width: cs[26] - cs[25], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[30], width: cs[28] - cs[26], height: rs[31] - rs[30], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[31], width: cs[1] - cs[0], height: rs[33] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Environment (สภาพแวดล้อมในการทำงาน)', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[1], top: rs[31], width: cs[2] - cs[1], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[31], width: cs[5] - cs[2], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[31], width: cs[8] - cs[5], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[31], width: cs[9] - cs[8], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[31], width: cs[10] - cs[9], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[31], width: cs[11] - cs[10], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[31], width: cs[20] - cs[11], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[31], width: cs[22] - cs[20], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[31], width: cs[23] - cs[22], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[31], width: cs[24] - cs[23], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[31], width: cs[25] - cs[24], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[31], width: cs[26] - cs[25], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[31], width: cs[28] - cs[26], height: rs[32] - rs[31], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[32], width: cs[2] - cs[1], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[32], width: cs[5] - cs[2], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[32], width: cs[8] - cs[5], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[32], width: cs[9] - cs[8], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[32], width: cs[10] - cs[9], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[32], width: cs[11] - cs[10], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('0', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[32], width: cs[20] - cs[11], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[32], width: cs[22] - cs[20], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[32], width: cs[23] - cs[22], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[32], width: cs[24] - cs[23], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[32], width: cs[25] - cs[24], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[32], width: cs[26] - cs[25], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[32], width: cs[28] - cs[26], height: rs[33] - rs[32], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[33], width: cs[1] - cs[0], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'หัวข้อที่ใช้ประเมินโอกาส Opportunities Evaluation Points', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[1], top: rs[33], width: cs[5] - cs[1], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'จุดแข็งของกระบวนการ (Strong point)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[5], top: rs[33], width: cs[11] - cs[5], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'โอกาสที่องค์กรได้รับ (Opportunities)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[11], top: rs[33], width: cs[20] - cs[11], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แนวทางการจัดการโอกาส (Action to address Opportunities )', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[20], top: rs[33], width: cs[22] - cs[20], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'ผู้รับผิดชอบ (PIC)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[22], top: rs[33], width: cs[23] - cs[22], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'เริ่ม (Start)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[23], top: rs[33], width: cs[24] - cs[23], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'เสร็จ (Finish)', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[24], top: rs[33], width: cs[25] - cs[24], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('YES', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[25], top: rs[33], width: cs[26] - cs[25], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('NO', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[26], top: rs[33], width: cs[28] - cs[26], height: rs[34] - rs[33], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFCD5B5), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แผนปรับปรุง Next Action', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[0], top: rs[34], width: cs[1] - cs[0], height: rs[36] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Man (คน)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[34], width: cs[2] - cs[1], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[34], width: cs[5] - cs[2], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[34], width: cs[11] - cs[5], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[34], width: cs[20] - cs[11], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[34], width: cs[22] - cs[20], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[34], width: cs[23] - cs[22], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[34], width: cs[24] - cs[23], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[34], width: cs[25] - cs[24], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[34], width: cs[26] - cs[25], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[34], width: cs[28] - cs[26], height: rs[35] - rs[34], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[35], width: cs[2] - cs[1], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[35], width: cs[5] - cs[2], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[35], width: cs[11] - cs[5], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[35], width: cs[20] - cs[11], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[35], width: cs[22] - cs[20], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[35], width: cs[23] - cs[22], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[35], width: cs[24] - cs[23], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[35], width: cs[25] - cs[24], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[35], width: cs[26] - cs[25], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[35], width: cs[28] - cs[26], height: rs[36] - rs[35], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[36], width: cs[1] - cs[0], height: rs[38] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Machine (อุปกรณ์)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[36], width: cs[2] - cs[1], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[36], width: cs[5] - cs[2], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[36], width: cs[11] - cs[5], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[36], width: cs[20] - cs[11], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[36], width: cs[22] - cs[20], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[36], width: cs[23] - cs[22], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[36], width: cs[24] - cs[23], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[36], width: cs[25] - cs[24], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[36], width: cs[26] - cs[25], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[36], width: cs[28] - cs[26], height: rs[37] - rs[36], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[37], width: cs[2] - cs[1], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[37], width: cs[5] - cs[2], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[37], width: cs[11] - cs[5], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[37], width: cs[20] - cs[11], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[37], width: cs[22] - cs[20], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[37], width: cs[23] - cs[22], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[37], width: cs[24] - cs[23], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[37], width: cs[25] - cs[24], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[37], width: cs[26] - cs[25], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[37], width: cs[28] - cs[26], height: rs[38] - rs[37], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[38], width: cs[1] - cs[0], height: rs[40] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Method (วิธีการ)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[38], width: cs[2] - cs[1], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[38], width: cs[5] - cs[2], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[38], width: cs[11] - cs[5], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[38], width: cs[20] - cs[11], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[38], width: cs[22] - cs[20], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[38], width: cs[23] - cs[22], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[38], width: cs[24] - cs[23], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[38], width: cs[25] - cs[24], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[38], width: cs[26] - cs[25], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[38], width: cs[28] - cs[26], height: rs[39] - rs[38], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[39], width: cs[2] - cs[1], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[39], width: cs[5] - cs[2], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[39], width: cs[11] - cs[5], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[39], width: cs[20] - cs[11], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[39], width: cs[22] - cs[20], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[39], width: cs[23] - cs[22], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[39], width: cs[24] - cs[23], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[39], width: cs[25] - cs[24], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[39], width: cs[26] - cs[25], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[39], width: cs[28] - cs[26], height: rs[40] - rs[39], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[40], width: cs[1] - cs[0], height: rs[42] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Material (วัสดุ)', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[40], width: cs[2] - cs[1], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[40], width: cs[5] - cs[2], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[40], width: cs[11] - cs[5], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[40], width: cs[20] - cs[11], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[40], width: cs[22] - cs[20], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[40], width: cs[23] - cs[22], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[40], width: cs[24] - cs[23], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[40], width: cs[25] - cs[24], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[40], width: cs[26] - cs[25], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[40], width: cs[28] - cs[26], height: rs[41] - rs[40], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[41], width: cs[2] - cs[1], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[41], width: cs[5] - cs[2], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[41], width: cs[11] - cs[5], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[41], width: cs[20] - cs[11], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[41], width: cs[22] - cs[20], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[41], width: cs[23] - cs[22], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[41], width: cs[24] - cs[23], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[41], width: cs[25] - cs[24], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[41], width: cs[26] - cs[25], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[41], width: cs[28] - cs[26], height: rs[42] - rs[41], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[42], width: cs[1] - cs[0], height: rs[44] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: _t('Environment (สภาพแวดล้อมในการทำงาน)', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[1], top: rs[42], width: cs[2] - cs[1], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[42], width: cs[5] - cs[2], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[42], width: cs[11] - cs[5], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[42], width: cs[20] - cs[11], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[42], width: cs[22] - cs[20], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[42], width: cs[23] - cs[22], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[42], width: cs[24] - cs[23], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[42], width: cs[25] - cs[24], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[42], width: cs[26] - cs[25], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[42], width: cs[28] - cs[26], height: rs[43] - rs[42], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[1], top: rs[43], width: cs[2] - cs[1], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[43], width: cs[5] - cs[2], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[43], width: cs[11] - cs[5], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[43], width: cs[20] - cs[11], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[20], top: rs[43], width: cs[22] - cs[20], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[22], top: rs[43], width: cs[23] - cs[22], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[23], top: rs[43], width: cs[24] - cs[23], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[24], top: rs[43], width: cs[25] - cs[24], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[25], top: rs[43], width: cs[26] - cs[25], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[26], top: rs[43], width: cs[28] - cs[26], height: rs[44] - rs[43], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[0], top: rs[44], width: cs[1] - cs[0], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFFFF0000)),
                child: Text('เอกสารแนบ', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),
          Positioned(left: cs[1], top: rs[44], width: cs[2] - cs[1], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[2], top: rs[44], width: cs[3] - cs[2], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[3], top: rs[44], width: cs[4] - cs[3], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[4], top: rs[44], width: cs[5] - cs[4], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[5], top: rs[44], width: cs[6] - cs[5], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[6], top: rs[44], width: cs[7] - cs[6], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[7], top: rs[44], width: cs[8] - cs[7], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[8], top: rs[44], width: cs[9] - cs[8], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[9], top: rs[44], width: cs[10] - cs[9], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[10], top: rs[44], width: cs[11] - cs[10], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[11], top: rs[44], width: cs[12] - cs[11], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[12], top: rs[44], width: cs[13] - cs[12], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[13], top: rs[44], width: cs[14] - cs[13], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),
          Positioned(left: cs[14], top: rs[44], width: cs[15] - cs[14], height: rs[45] - rs[44], child: Container(
              decoration: BoxDecoration(color: Colors.transparent, border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.centerLeft, child: const SizedBox.shrink())),













          Positioned(left: cs[0], top: rs[45], width: cs[8] - cs[0], height: rs[51] - rs[45], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 47.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'RISK MATRIX (การประเมินความเสี่ยง)', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 47.9, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),
          Positioned(left: cs[8], top: rs[45], width: cs[15] - cs[8], height: rs[46] - rs[45], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(text: 'โอกาสที่จะเกิดความเสี่ยง ( Likelihood )', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),













          Positioned(left: cs[8], top: rs[46], width: cs[9] - cs[8], height: rs[47] - rs[46], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[46], width: cs[10] - cs[9], height: rs[47] - rs[46], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[46], width: cs[11] - cs[10], height: rs[47] - rs[46], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('3', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[46], width: cs[13] - cs[11], height: rs[47] - rs[46], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('4', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[46], width: cs[15] - cs[13], height: rs[47] - rs[46], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('5', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[8], top: rs[47], width: cs[9] - cs[8], height: rs[48] - rs[47], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Rare', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[47], width: cs[10] - cs[9], height: rs[48] - rs[47], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Unlikely', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[47], width: cs[11] - cs[10], height: rs[48] - rs[47], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Possible', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[47], width: cs[13] - cs[11], height: rs[48] - rs[47], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Likely', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[47], width: cs[15] - cs[13], height: rs[48] - rs[47], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Almost Certain', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[8], top: rs[48], width: cs[9] - cs[8], height: rs[49] - rs[48], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('น้อยมาก', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[48], width: cs[10] - cs[9], height: rs[49] - rs[48], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ไม่ค่อย', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[48], width: cs[11] - cs[10], height: rs[49] - rs[48], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('บางที', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[48], width: cs[13] - cs[11], height: rs[49] - rs[48], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('บ่อย', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[48], width: cs[15] - cs[13], height: rs[49] - rs[48], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                  children: [
                    TextSpan(text: 'แน่นอน เป็นประจำ', style: TextStyle(color: Color(0xFF000000), fontSize: 20.0, fontFamily: 'Browallia New')),
                  ],
                ),
              ))),













          Positioned(left: cs[8], top: rs[49], width: cs[9] - cs[8], height: rs[50] - rs[49], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('May occur only in exceptional circumstances', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[9], top: rs[49], width: cs[10] - cs[9], height: rs[50] - rs[49], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('Could occur at some time', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[10], top: rs[49], width: cs[11] - cs[10], height: rs[50] - rs[49], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('Might occur at some time', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[11], top: rs[49], width: cs[13] - cs[11], height: rs[50] - rs[49], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('Will Probably occur in most circumstances', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[13], top: rs[49], width: cs[15] - cs[13], height: rs[50] - rs[49], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('Is expected to occur in most circumstances', sz: 20.0, color: Color(0xFF000000)))),













          Positioned(left: cs[8], top: rs[50], width: cs[9] - cs[8], height: rs[51] - rs[50], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('( 1 ครั้งในรอบ 6-12 เดือน )', sz: 20.0, color: Color(0xFFFF0000), align: TextAlign.center))),
          Positioned(left: cs[9], top: rs[50], width: cs[10] - cs[9], height: rs[51] - rs[50], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('( 1 ครั้งในรอบ 4-6 เดือน )', sz: 20.0, color: Color(0xFFFF0000), align: TextAlign.center))),
          Positioned(left: cs[10], top: rs[50], width: cs[11] - cs[10], height: rs[51] - rs[50], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('( 1 ครั้งในรอบ 1-3 เดือน )', sz: 20.0, color: Color(0xFFFF0000), align: TextAlign.center))),
          Positioned(left: cs[11], top: rs[50], width: cs[13] - cs[11], height: rs[51] - rs[50], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('(1-3 ครั้ง/ เดือน)', sz: 20.0, color: Color(0xFFFF0000), align: TextAlign.center))),
          Positioned(left: cs[13], top: rs[50], width: cs[15] - cs[13], height: rs[51] - rs[50], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('( >4 ครั้ง/เดือน)', sz: 20.0, color: Color(0xFFFF0000), align: TextAlign.center))),













          Positioned(left: cs[0], top: rs[51], width: cs[1] - cs[0], height: rs[61] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFAC090), border: Border(left: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: _t('ความรุนแรงของความเสี่ยง (Impact )', sz: 20.0, bold: true, align: TextAlign.center))),
          Positioned(left: cs[1], top: rs[51], width: cs[2] - cs[1], height: rs[53] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[51], width: cs[4] - cs[2], height: rs[52] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Insignificant', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[51], width: cs[8] - cs[4], height: rs[52] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('ไม่มีผลกระทบ / ความล้มเหลวต่อผลิตภัณฑ์หรือสมรรถนะกระบวนการไม่ชัดเจน', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[8], top: rs[51], width: cs[9] - cs[8], height: rs[53] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('1', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[51], width: cs[10] - cs[9], height: rs[53] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[51], width: cs[11] - cs[10], height: rs[53] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('3', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[51], width: cs[13] - cs[11], height: rs[53] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('4', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[51], width: cs[15] - cs[13], height: rs[53] - rs[51], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('5', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[2], top: rs[52], width: cs[4] - cs[2], height: rs[53] - rs[52], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ไม่มีผล', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[52], width: cs[8] - cs[4], height: rs[53] - rs[52], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFFFF0000)),
                child: Text('( ไม่สามารถประเมินความเสียหายเป็นเงินได้ )', softWrap: false, overflow: TextOverflow.ellipsis),
              ))),













          Positioned(left: cs[1], top: rs[53], width: cs[2] - cs[1], height: rs[55] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[53], width: cs[4] - cs[2], height: rs[54] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Minor', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[53], width: cs[8] - cs[4], height: rs[54] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('ผลิตภัณฑ์ไม่จำเป็นต้องแก้ไข /กระทบเล็กน้อยต่อผลิตภัณฑ์หรือสมรรถนะกระบวนการ', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[8], top: rs[53], width: cs[9] - cs[8], height: rs[55] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('2', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[53], width: cs[10] - cs[9], height: rs[55] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('4', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[53], width: cs[11] - cs[10], height: rs[55] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('6', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[53], width: cs[13] - cs[11], height: rs[55] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('8', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[53], width: cs[15] - cs[13], height: rs[55] - rs[53], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('10', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[2], top: rs[54], width: cs[4] - cs[2], height: rs[55] - rs[54], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('เล็กน้อย', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[54], width: cs[8] - cs[4], height: rs[55] - rs[54], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFFFF0000)),
                child: Text('( ประเมินความเสียหายเป็นเงินได้< 5000 บาทต่อเดือน )', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[1], top: rs[55], width: cs[2] - cs[1], height: rs[57] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('3', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[55], width: cs[4] - cs[2], height: rs[56] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(top: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Moderate', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[55], width: cs[8] - cs[4], height: rs[56] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ประสิทธิภาพของกระบวนการลดลง แต่ดำเนินการได้ปกติ', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[8], top: rs[55], width: cs[9] - cs[8], height: rs[57] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('3', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[55], width: cs[10] - cs[9], height: rs[57] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('6', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[55], width: cs[11] - cs[10], height: rs[57] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('9', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[55], width: cs[13] - cs[11], height: rs[57] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('12', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[55], width: cs[15] - cs[13], height: rs[57] - rs[55], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('15', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[2], top: rs[56], width: cs[4] - cs[2], height: rs[57] - rs[56], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ปานกลาง', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[56], width: cs[8] - cs[4], height: rs[57] - rs[56], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFFFF0000)),
                child: Text('( ประเมินความเสียหายเป็นเงินได้ 5,000-15,000 บาทต่อเดือน )', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[1], top: rs[57], width: cs[2] - cs[1], height: rs[59] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('4', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[57], width: cs[4] - cs[2], height: rs[58] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Major', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[57], width: cs[8] - cs[4], height: rs[58] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topLeft, child: _t('จำเป็นต้องปรับ/แก้ไขผลิตภัณฑ์ บริการ หรือกระทบต่อสมรรถนะกระบวนการมาก', sz: 20.0, color: Color(0xFF000000)))),
          Positioned(left: cs[8], top: rs[57], width: cs[9] - cs[8], height: rs[59] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFF92D050), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('4', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[57], width: cs[10] - cs[9], height: rs[59] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('8', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[57], width: cs[11] - cs[10], height: rs[59] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('12', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[57], width: cs[13] - cs[11], height: rs[59] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('16', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[57], width: cs[15] - cs[13], height: rs[59] - rs[57], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('20', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[2], top: rs[58], width: cs[4] - cs[2], height: rs[59] - rs[58], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('มาก', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[58], width: cs[8] - cs[4], height: rs[59] - rs[58], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFFFF0000)),
                child: Text('( ประเมินความเสียหายเป็นเงินได้ 15,000-50,000 บาทต่อเดือน )', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[1], top: rs[59], width: cs[2] - cs[1], height: rs[61] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFF808080), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 31.9, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('5', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[2], top: rs[59], width: cs[4] - cs[2], height: rs[60] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(top: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('Catastrophic', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[59], width: cs[8] - cs[4], height: rs[60] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('ประสิทธิภาพหรือสมรรถนะกระบวนการล้มเหลว , อันตรายต่อธุรกิจ', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[8], top: rs[59], width: cs[9] - cs[8], height: rs[61] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFF00), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('5', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[9], top: rs[59], width: cs[10] - cs[9], height: rs[61] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('10', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[10], top: rs[59], width: cs[11] - cs[10], height: rs[61] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('15', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[11], top: rs[59], width: cs[13] - cs[11], height: rs[61] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('20', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[13], top: rs[59], width: cs[15] - cs[13], height: rs[61] - rs[59], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF0000), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                child: Text('25', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned(left: cs[2], top: rs[60], width: cs[4] - cs[2], height: rs[61] - rs[60], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(bottom: BorderSide(color: Color(0xFF000000), width: 1), right: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.center, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFF000000)),
                child: Text('สูงมาก', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),
          Positioned(left: cs[4], top: rs[60], width: cs[8] - cs[4], height: rs[61] - rs[60], child: Container(
              decoration: BoxDecoration(color: Color(0xFFFFFFFF), border: Border(right: BorderSide(color: Color(0xFF000000), width: 1), bottom: BorderSide(color: Color(0xFF000000), width: 1))),
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), alignment: Alignment.topCenter, child: DefaultTextStyle.merge(
                style: TextStyle(fontFamily: 'Browallia New', fontSize: 20.0, color: Color(0xFFFF0000)),
                child: Text('( ประเมินความเสียหายเป็นเงินได้ >50,000 บาทต่อเดือน )', softWrap: false, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
              ))),













          Positioned.fill(
            child: CustomPaint(
              painter: _TableGridPainter(
                colStarts: cs,
                rowStarts: rs,
                borderColor: Colors.black,
                borderWidth: 0.0,
                matrixData: matrixData,
                numRows: 61,
                numCols: 28,
              ),
            ),
          ),
        ],
      ),
    );
  },
),
);

// ============ HELPER CLASSES ============
// ── Text helpers ──────────────────────────────────────────────────────────────

Widget _t(String s, {double sz = 16, bool bold = false, Color? color, String ff = 'Browallia New', TextAlign? align}) =>
    Text(s, style: TextStyle(fontFamily: ff, fontSize: sz, fontWeight: bold ? FontWeight.bold : FontWeight.normal, color: color), softWrap: true, overflow: TextOverflow.clip, textAlign: align);

Widget _rt(List<(String, bool)> spans, {double sz = 16, String ff = 'Browallia New', TextAlign align = TextAlign.start}) =>
    RichText(softWrap: true, overflow: TextOverflow.clip, textAlign: align,
        text: TextSpan(style: TextStyle(fontFamily: ff, fontSize: sz),
            children: [for (final (t, b) in spans) TextSpan(text: t, style: b ? const TextStyle(fontWeight: FontWeight.bold) : null)]));

// ── Border helpers ────────────────────────────────────────────────────────────

const _bk = Colors.black;

class _TableGridPainter extends CustomPainter {
  final List<double> colStarts;
  final List<double> rowStarts;
  final Color borderColor;
  final double borderWidth;
  final List<List<int>> matrixData;
  final int numRows;
  final int numCols;

  const _TableGridPainter({
    required this.colStarts,
    required this.rowStarts,
    required this.borderColor,
    required this.borderWidth,
    required this.matrixData,
    required this.numRows,
    required this.numCols,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (borderWidth == 0) return;
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;
    for (int r = 0; r < numRows; r++) {
      for (int c = 0; c < numCols; c++) {
        if (c >= colStarts.length - 1 || r >= rowStarts.length - 1) continue;
        final idx = (r < matrixData.length && c < matrixData[r].length)
            ? matrixData[r][c]
            : -1;
        if (idx < 0) continue;
        final sameAsLeft  = c > 0 && matrixData[r][c - 1] == idx;
        final sameAsAbove = r > 0 && matrixData[r - 1][c] == idx;
        if (sameAsLeft || sameAsAbove) continue;
        int endC = c + 1;
        while (endC < numCols && endC < matrixData[r].length && matrixData[r][endC] == idx) endC++;
        int endR = r + 1;
        while (endR < numRows && endR < matrixData.length && matrixData[endR][c] == idx) endR++;
        final right  = endC < colStarts.length ? colStarts[endC] : colStarts.last;
        final bottom = endR < rowStarts.length ? rowStarts[endR] : rowStarts.last;
        canvas.drawRect(Rect.fromLTRB(colStarts[c], rowStarts[r], right, bottom), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_TableGridPainter old) =>
      old.borderColor != borderColor || old.borderWidth != borderWidth;
}