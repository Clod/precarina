// Pressure [age] [height] [percentile]
//
// if (height) <= height[edad,0] {
//   if(pressure < pressure[edad][0][0]) {}
//   else if (pressure < pressure[edad][0][1])
//
// }
// else if (height <= height[edad,1])

const List<List<double>> maleHeightsMatrix = [
  [77.2, 78.3, 80.2, 82.4, 84.6, 86.7, 87.9],
  [86.1, 87.4, 89.6, 92.1, 94.7, 97.1, 98.5],
  [92.5, 93.9, 96.3, 99.0, 101.8, 104.3, 105.8],
  [98.5, 100.2, 102.9, 105.9, 108.9, 111.5, 113.2],
  [104.4, 106.2, 109.1, 112.4, 115.7, 118.6, 120.3],
  [110.3, 112.2, 115.3, 118.9, 122.4, 125.6, 127.5],
  [116.1, 118.0, 121.4, 125.1, 128.9, 132.4, 134.5],
  [121.4, 123.5, 127.0, 131.0, 135.1, 138.8, 141.0],
  [126.0, 128.3, 132.1, 136.3, 140.7, 144.7, 147.1],
  [130.2, 132.7, 136.7, 141.3, 145.9, 150.1, 152.7],
  [134.7, 137.3, 141.5, 146.4, 151.3, 155.8, 158.6],
  [140.3, 143.0, 147.5, 152.7, 157.9, 162.6, 165.5],
  [147.0, 150.0, 154.9, 160.3, 165.7, 170.5, 173.4],
  [153.8, 156.9, 162.0, 167.5, 172.7, 177.4, 180.1],
  [159.0, 162.0, 166.9, 172.2, 177.2, 181.6, 184.2],
  [162.1, 165.0, 169.6, 174.6, 179.5, 183.8, 186.4],
  [163.8, 166.5, 170.9, 175.8, 180.7, 184.9, 187.5],
];

const List<List<List<int>>> maleSistPressMatrix = [
  [
    [85, 85, 86, 86, 87, 88, 88],
    [98, 99, 99, 100, 100, 101, 101],
    [102, 102, 103, 103, 104, 105, 105],
    [114, 114, 115, 115, 116, 117, 117]
  ],
  [
    [87, 87, 88, 89, 89, 90, 91],
    [100, 100, 101, 102, 103, 103, 104],
    [104, 105, 105, 106, 107, 107, 108],
    [116, 117, 117, 118, 119, 119, 120]
  ],
  [
    [88, 89, 89, 90, 91, 92, 92],
    [101, 102, 102, 103, 104, 105, 105],
    [106, 106, 107, 107, 108, 109, 109],
    [118, 118, 119, 119, 120, 121, 121]
  ],
  [
    [90, 90, 91, 92, 93, 94, 94],
    [102, 103, 104, 105, 105, 106, 107],
    [107, 107, 108, 108, 109, 110, 110],
    [119, 119, 120, 120, 121, 122, 122]
  ],
  [
    [91, 92, 93, 94, 95, 96, 96],
    [103, 104, 105, 106, 107, 108, 108],
    [107, 108, 109, 109, 110, 111, 112],
    [119, 120, 121, 121, 122, 123, 124]
  ],
  [
    [93, 93, 94, 95, 96, 97, 98],
    [105, 105, 106, 107, 109, 110, 110],
    [108, 109, 110, 111, 112, 113, 114],
    [120, 121, 122, 123, 124, 125, 126]
  ],
  [
    [94, 94, 95, 97, 98, 98, 99],
    [106, 107, 108, 109, 110, 111, 111],
    [110, 110, 111, 112, 114, 115, 116],
    [122, 122, 123, 124, 126, 127, 128]
  ],
  [
    [95, 96, 97, 98, 99, 99, 100],
    [107, 108, 109, 110, 111, 112, 112],
    [111, 112, 112, 114, 115, 116, 117],
    [123, 124, 124, 126, 127, 128, 129]
  ],
  [
    [96, 97, 98, 99, 100, 101, 101],
    [107, 108, 109, 110, 112, 113, 114],
    [112, 112, 113, 115, 116, 118, 119],
    [124, 124, 125, 127, 128, 130, 131]
  ],
  [
    [97, 98, 99, 100, 101, 102, 103],
    [108, 109, 111, 112, 113, 115, 116],
    [112, 113, 114, 116, 118, 120, 121],
    [124, 125, 126, 128, 130, 132, 133]
  ],
  [
    [99, 99, 101, 102, 103, 104, 106],
    [110, 111, 112, 114, 116, 117, 118],
    [114, 114, 116, 118, 120, 123, 124],
    [126, 126, 128, 130, 132, 135, 136]
  ],
  [
    [101, 101, 102, 104, 106, 108, 109],
    [113, 114, 115, 117, 119, 121, 122],
    [116, 117, 118, 121, 124, 126, 128],
    [128, 129, 130, 133, 136, 138, 140]
  ],
  [
    [103, 104, 105, 108, 110, 111, 112],
    [115, 116, 118, 121, 124, 126, 126],
    [119, 120, 122, 125, 128, 130, 131],
    [131, 132, 134, 137, 140, 142, 143]
  ],
  [
    [105, 106, 109, 111, 112, 113, 113],
    [119, 120, 123, 126, 127, 128, 129],
    [123, 125, 127, 130, 132, 133, 134],
    [135, 137, 139, 142, 144, 145, 146]
  ],
  [
    [108, 110, 112, 113, 114, 114, 114],
    [123, 124, 126, 128, 129, 130, 130],
    [127, 129, 131, 132, 134, 135, 135],
    [139, 141, 143, 144, 146, 147, 147]
  ],
  [
    [111, 112, 114, 115, 115, 116, 116],
    [126, 127, 128, 129, 131, 131, 132],
    [130, 131, 133, 134, 135, 136, 137],
    [142, 143, 145, 146, 147, 148, 149]
  ],
  [
    [114, 115, 116, 117, 117, 118, 118],
    [128, 129, 130, 131, 132, 133, 134],
    [132, 133, 134, 135, 137, 138, 138],
    [144, 145, 146, 147, 149, 150, 150]
  ]
];

const List<List<List<int>>> maleDiastPressMatrix = [
  [
    [40, 40, 40, 41, 41, 42, 42],
    [52, 52, 53, 53, 54, 54, 54],
    [54, 54, 55, 55, 56, 57, 57],
    [66, 66, 67, 67, 68, 69, 69],
  ],
  [
    [43, 43, 44, 44, 45, 46, 46],
    [55, 55, 56, 56, 57, 58, 58],
    [57, 58, 58, 59, 60, 61, 61],
    [69, 70, 70, 71, 72, 73, 73],
  ],
  [
    [45, 46, 46, 47, 48, 49, 49],
    [58, 58, 59, 59, 60, 61, 61],
    [60, 61, 61, 62, 63, 64, 64],
    [72, 73, 73, 74, 75, 76, 76],
  ],
  [
    [48, 49, 49, 50, 51, 52, 52],
    [60, 61, 62, 62, 63, 64, 64],
    [63, 64, 65, 66, 67, 67, 68],
    [75, 76, 77, 78, 79, 79, 80],
  ],
  [
    [51, 51, 52, 53, 54, 55, 55],
    [63, 64, 65, 65, 66, 67, 67],
    [66, 67, 68, 69, 70, 70, 71],
    [78, 79, 80, 81, 82, 82, 83],
  ],
  [
    [54, 54, 55, 56, 57, 57, 58],
    [66, 66, 67, 68, 68, 69, 69],
    [69, 70, 70, 71, 72, 72, 73],
    [81, 82, 82, 83, 84, 84, 85],
  ],
  [
    [56, 56, 57, 58, 58, 59, 59],
    [68, 68, 69, 70, 70, 71, 71],
    [71, 71, 72, 73, 73, 74, 74],
    [83, 83, 84, 85, 85, 86, 86],
  ],
  [
    [57, 57, 58, 59, 59, 60, 60],
    [69, 70, 70, 71, 72, 72, 73],
    [72, 73, 73, 74, 75, 75, 75],
    [84, 85, 85, 86, 87, 87, 87],
  ],
  [
    [57, 58, 59, 60, 61, 62, 62],
    [70, 71, 72, 73, 74, 74, 74],
    [74, 74, 75, 76, 76, 77, 77],
    [86, 86, 87, 88, 88, 89, 89],
  ],
  [
    [59, 60, 61, 62, 63, 63, 64],
    [72, 73, 74, 74, 75, 75, 76],
    [76, 76, 77, 77, 78, 78, 78],
    [88, 88, 89, 89, 90, 90, 90],
  ],
  [
    [61, 61, 62, 63, 63, 63, 63],
    [74, 74, 75, 75, 75, 76, 76],
    [77, 78, 78, 78, 78, 78, 78],
    [89, 90, 90, 90, 90, 90, 90],
  ],
  [
    [61, 62, 62, 62, 62, 63, 63],
    [75, 75, 75, 75, 75, 76, 76],
    [78, 78, 78, 78, 78, 79, 79],
    [90, 90, 90, 90, 90, 91, 91],
  ],
  [
    [60, 60, 61, 62, 63, 64, 65],
    [74, 74, 74, 75, 76, 77, 77],
    [78, 78, 78, 78, 80, 81, 81],
    [90, 90, 90, 90, 92, 93, 93],
  ],
  [
    [60, 60, 62, 64, 65, 66, 67],
    [74, 74, 75, 77, 78, 79, 80],
    [77, 78, 79, 81, 82, 83, 84],
    [89, 90, 91, 93, 94, 95, 96],
  ],
  [
    [61, 62, 64, 65, 66, 67, 68],
    [75, 76, 78, 79, 80, 81, 81],
    [78, 79, 81, 83, 84, 85, 85],
    [90, 91, 93, 95, 96, 97, 97],
  ],
  [
    [63, 64, 66, 67, 68, 69, 69],
    [77, 78, 79, 80, 81, 82, 82],
    [80, 81, 83, 84, 85, 86, 86],
    [92, 93, 95, 96, 97, 98, 98],
  ],
  [
    [65, 66, 67, 68, 69, 70, 70],
    [78, 79, 80, 81, 82, 82, 83],
    [81, 82, 84, 85, 86, 86, 87],
    [93, 94, 96, 97, 98, 98, 99],
  ],
];

const List<List<double>> femaleHeightsMatrix = [
  [75.4, 76.6, 78.6, 80.8, 83, 84.9, 86.1],
  [84.9, 86.3, 88.6, 91.1, 93.7, 96, 97.4],
  [91, 92.4, 94.9, 97.6, 100.5, 103.1, 104.6],
  [97.2, 98.8, 101.4, 104.5, 107.6, 110.5, 112.2],
  [103.6, 105.3, 108.2, 111.5, 114.9, 118.1, 120],
  [110, 111.8, 114.9, 118.4, 122.1, 125.6, 127.7],
  [115.9, 117.8, 121.1, 124.9, 128.8, 132.5, 134.7],
  [121, 123, 126.5, 130.6, 134.7, 138.5, 140.9],
  [125.3, 127.6, 131.3, 135.6, 140.1, 144.1, 146.6],
  [129.7, 132.2, 136.3, 141, 145.8, 150.2, 152.8],
  [135.6, 138.3, 142.8, 147.8, 152.8, 157.3, 160],
  [142.8, 145.5, 149.9, 154.8, 159.6, 163.8, 166.4],
  [148.1, 150.6, 154.7, 159.2, 163.7, 167.8, 170.2],
  [150.6, 153, 156.9, 161.3, 165.7, 169.7, 172.1],
  [151.7, 154, 157.9, 162.3, 166.7, 170.6, 173],
  [152.1, 154.5, 158.4, 162.8, 167.1, 171.1, 173.4],
  [152.4, 154.7, 158.7, 163, 167.4, 171.3, 173.7],
];

const List<List<List<int>>> femaleSistPressMatrix = [
  [
    [84, 85, 86, 86, 87, 88, 88],
    [98, 99, 99, 100, 101, 102, 102],
    [101, 102, 102, 103, 104, 105, 105],
    [113, 114, 114, 115, 116, 117, 117]
  ],
  [
    [87, 87, 88, 89, 90, 91, 91],
    [101, 101, 102, 103, 104, 105, 106],
    [104, 105, 106, 106, 107, 108, 109],
    [116, 117, 118, 118, 119, 120, 121]
  ],
  [
    [88, 89, 89, 90, 91, 92, 93],
    [102, 103, 104, 104, 105, 106, 107],
    [106, 106, 107, 108, 109, 110, 110],
    [118, 118, 119, 120, 121, 122, 122]
  ],
  [
    [89, 90, 91, 92, 93, 94, 94],
    [103, 104, 105, 106, 107, 108, 108],
    [107, 108, 109, 109, 110, 111, 112],
    [119, 120, 121, 121, 122, 123, 124]
  ],
  [
    [90, 91, 92, 93, 94, 95, 96],
    [104, 105, 106, 107, 108, 109, 110],
    [108, 109, 109, 110, 111, 112, 113],
    [120, 121, 121, 122, 123, 124, 125]
  ],
  [
    [92, 92, 93, 94, 96, 97, 97],
    [105, 106, 107, 108, 109, 110, 111],
    [109, 109, 110, 111, 112, 113, 114],
    [121, 121, 122, 123, 124, 125, 126]
  ],
  [
    [92, 93, 94, 95, 97, 98, 99],
    [106, 106, 107, 109, 110, 111, 112],
    [109, 110, 111, 112, 113, 114, 115],
    [121, 122, 123, 124, 125, 126, 127]
  ],
  [
    [93, 94, 95, 97, 98, 99, 100],
    [107, 107, 108, 110, 111, 112, 113],
    [110, 111, 112, 113, 115, 116, 117],
    [122, 123, 124, 125, 127, 128, 129]
  ],
  [
    [95, 95, 97, 98, 99, 100, 101],
    [108, 108, 109, 111, 112, 113, 114],
    [112, 112, 113, 114, 116, 117, 118],
    [124, 124, 125, 126, 128, 129, 130]
  ],
  [
    [96, 97, 98, 99, 101, 102, 103],
    [109, 110, 111, 112, 113, 115, 116],
    [113, 114, 114, 116, 117, 119, 120],
    [125, 126, 126, 128, 129, 131, 132]
  ],
  [
    [98, 99, 101, 102, 104, 105, 106],
    [111, 112, 113, 114, 116, 118, 120],
    [115, 116, 117, 118, 120, 123, 124],
    [127, 128, 129, 130, 132, 135, 136]
  ],
  [
    [102, 102, 104, 105, 107, 108, 108],
    [114, 115, 116, 118, 120, 122, 122],
    [118, 119, 120, 122, 124, 125, 126],
    [130, 131, 132, 134, 136, 137, 138]
  ],
  [
    [104, 105, 106, 107, 108, 108, 109],
    [116, 117, 119, 121, 122, 123, 123],
    [121, 122, 123, 124, 126, 126, 127],
    [133, 134, 135, 136, 138, 138, 139]
  ],
  [
    [105, 106, 107, 108, 109, 109, 109],
    [118, 118, 120, 122, 123, 123, 123],
    [123, 123, 124, 125, 126, 127, 127],
    [135, 135, 136, 137, 138, 139, 139]
  ],
  [
    [105, 106, 107, 108, 109, 109, 109],
    [118, 119, 121, 122, 123, 123, 124],
    [124, 124, 125, 126, 127, 127, 128],
    [136, 136, 137, 138, 139, 139, 140]
  ],
  [
    [106, 107, 108, 109, 109, 110, 110],
    [119, 120, 122, 123, 124, 124, 124],
    [124, 125, 125, 127, 127, 128, 128],
    [136, 137, 137, 139, 139, 140, 140]
  ],
  [
    [107, 108, 109, 110, 110, 110, 111],
    [120, 121, 123, 124, 124, 125, 125],
    [125, 125, 126, 127, 128, 128, 128],
    [137, 137, 138, 139, 140, 140, 140]
  ]
];

const List<List<List<int>>> femaleDiastPressMatrix = [
  [
    [41, 42, 42, 43, 44, 45, 46],
    [54, 55, 56, 56, 57, 58, 58],
    [59, 59, 60, 60, 61, 62, 62],
    [71, 71, 72, 72, 73, 74, 74]
  ],
  [
    [45, 46, 47, 48, 49, 50, 51],
    [58, 58, 59, 60, 61, 62, 62],
    [62, 63, 63, 64, 65, 66, 66],
    [74, 75, 75, 76, 77, 78, 78]
  ],
  [
    [48, 48, 49, 50, 51, 53, 53],
    [60, 61, 61, 62, 63, 64, 65],
    [64, 65, 65, 66, 67, 68, 69],
    [76, 77, 77, 78, 79, 80, 81]
  ],
  [
    [50, 51, 51, 53, 54, 55, 55],
    [62, 63, 64, 65, 66, 67, 67],
    [66, 67, 68, 69, 70, 70, 71],
    [78, 79, 80, 81, 82, 82, 83]
  ],
  [
    [52, 52, 53, 55, 56, 57, 57],
    [64, 65, 66, 67, 68, 69, 70],
    [68, 69, 70, 71, 72, 73, 73],
    [80, 81, 82, 83, 84, 85, 85]
  ],
  [
    [54, 54, 55, 56, 57, 58, 59],
    [67, 67, 68, 69, 70, 71, 71],
    [70, 71, 72, 72, 73, 74, 74],
    [82, 83, 84, 84, 85, 86, 86]
  ],
  [
    [55, 55, 56, 57, 58, 59, 60],
    [68, 68, 69, 70, 71, 72, 72],
    [72, 72, 73, 73, 74, 74, 75],
    [84, 84, 85, 85, 86, 86, 87]
  ],
  [
    [56, 56, 57, 59, 60, 61, 61],
    [69, 70, 71, 72, 72, 73, 73],
    [72, 73, 74, 74, 75, 75, 75],
    [84, 85, 86, 86, 87, 87, 87]
  ],
  [
    [57, 58, 59, 60, 60, 61, 61],
    [71, 71, 72, 73, 73, 73, 73],
    [74, 74, 75, 75, 75, 75, 75],
    [86, 86, 87, 87, 87, 87, 87]
  ],
  [
    [58, 59, 59, 60, 61, 61, 62],
    [72, 73, 73, 73, 73, 73, 73],
    [75, 75, 76, 76, 76, 76, 76],
    [87, 87, 88, 88, 88, 88, 88]
  ],
  [
    [60, 60, 60, 61, 62, 63, 64],
    [74, 74, 74, 74, 74, 75, 75],
    [76, 77, 77, 77, 77, 77, 77],
    [88, 89, 89, 89, 89, 89, 89]
  ],
  [
    [61, 61, 61, 62, 64, 65, 65],
    [75, 75, 75, 75, 76, 76, 76],
    [78, 78, 78, 78, 79, 79, 79],
    [90, 90, 90, 90, 91, 91, 91]
  ],
  [
    [62, 62, 63, 64, 65, 65, 66],
    [75, 75, 75, 76, 76, 76, 76],
    [79, 79, 79, 79, 80, 80, 81],
    [91, 91, 91, 91, 92, 92, 93]
  ],
  [
    [63, 63, 64, 65, 66, 66, 66],
    [76, 76, 76, 76, 77, 77, 77],
    [80, 80, 80, 80, 81, 81, 82],
    [92, 92, 92, 92, 93, 93, 94]
  ],
  [
    [64, 64, 64, 65, 66, 67, 67],
    [76, 76, 76, 77, 77, 78, 78],
    [80, 80, 80, 81, 82, 82, 82],
    [92, 92, 92, 93, 94, 94, 94]
  ],
  [
    [64, 64, 65, 66, 66, 67, 67],
    [76, 76, 76, 77, 78, 78, 78],
    [80, 80, 80, 81, 82, 82, 82],
    [92, 92, 92, 93, 94, 94, 94]
  ],
  [
    [64, 64, 65, 66, 66, 66, 67],
    [76, 76, 77, 77, 78, 78, 78],
    [80, 80, 80, 81, 82, 82, 82],
    [92, 92, 92, 93, 94, 94, 94]
  ]
];

const Map<String, List<List<double>>> heightBoth = {
  "males": maleHeightsMatrix,
  "females": femaleHeightsMatrix,
};

const Map<String, List<List<List<int>>>> sistolicBoth = {
  "males": maleSistPressMatrix,
  "females": femaleSistPressMatrix,
};

const Map<String, List<List<List<int>>>> diastolicBoth = {
  "males": maleDiastPressMatrix,
  "females": femaleDiastPressMatrix,
};
