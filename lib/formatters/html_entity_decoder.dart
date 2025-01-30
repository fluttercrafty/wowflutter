String decodeHtmlEntities(String text) {
  final htmlEntities = {
    '&lt;br&gt;': "\n",
   
    // Basic symbols
    '&amp;': '&',
    '&lt;': '<',
    '&gt;': '>',
    '&quot;': '"',
    '&#39;': "'", // Single quote
    '&#039;': "'", // Single quote
    '&apos;': "'",

    // Whitespace and spacing
    '&nbsp;': ' ',
    '<br>': '\n',
    '&ensp;': ' ', // En space
    '&emsp;': ' ', // Em space

    // Currency symbols
    '&cent;': '¢',
    '&pound;': '£',
    '&yen;': '¥',
    '&euro;': '€',
    '&dollar;': '\$',

    // Mathematical symbols
    '&plus;': '+',
    '&minus;': '−',
    '&times;': '×',
    '&divide;': '÷',
    '&equals;': '=',
    '&ne;': '≠', // Not equal
    '&le;': '≤', // Less than or equal
    '&ge;': '≥', // Greater than or equal

    // Punctuation
    '&copy;': '©',
    '&reg;': '®',
    '&trade;': '™',
    '&hellip;': '…', // Ellipsis
    '&ndash;': '–', // En dash
    '&mdash;': '—', // Em dash
    '&lsquo;': '‘', // Left single quote
    '&rsquo;': '’', // Right single quote
    '&ldquo;': '“', // Left double quote
    '&rdquo;': '”', // Right double quote

    // Arrows
    '&larr;': '←',
    '&uarr;': '↑',
    '&rarr;': '→',
    '&darr;': '↓',
    '&harr;': '↔',

    // Miscellaneous symbols
    '&deg;': '°', // Degree
    '&permil;': '‰', // Per mille
    '&micro;': 'µ', // Micro
    '&para;': '¶', // Paragraph
    '&sect;': '§', // Section
    '&infin;': '∞', // Infinity
    '&part;': '∂', // Partial differential
    '&sum;': '∑', // Summation
    '&prod;': '∏', // Product
    '&radic;': '√', // Square root
    '&sup2;': '²', // Superscript two
    '&sup3;': '³', // Superscript three
    '&frac12;': '½', // Half
    '&frac14;': '¼', // Quarter
    '&frac34;': '¾', // Three quarters

    // Greek letters
    '&alpha;': 'α',
    '&beta;': 'β',
    '&gamma;': 'γ',
    '&delta;': 'δ',
    '&epsilon;': 'ε',
    '&zeta;': 'ζ',
    '&eta;': 'η',
    '&theta;': 'θ',
    '&iota;': 'ι',
    '&kappa;': 'κ',
    '&lambda;': 'λ',
    '&mu;': 'μ',
    '&nu;': 'ν',
    '&xi;': 'ξ',
    '&omicron;': 'ο',
    '&pi;': 'π',
    '&rho;': 'ρ',
    '&sigma;': 'σ',
    '&tau;': 'τ',
    '&upsilon;': 'υ',
    '&phi;': 'φ',
    '&chi;': 'χ',
    '&psi;': 'ψ',
    '&omega;': 'ω',

    // Additional entities

    '&lsaquo;': '‹', // Single left angle quote
    '&rsaquo;': '›', // Single right angle quote
    '&oline;': '‾', // Overline
    '&caret;': '⁁', // Caret
    '&spades;': '♠', // Spade suit
    '&clubs;': '♣', // Club suit
    '&hearts;': '♥', // Heart suit
    '&diams;': '♦', // Diamond suit
  };

  htmlEntities.forEach((entity, replacement) {
    text = text.replaceAll(entity, replacement);
  });

  return text;
}
