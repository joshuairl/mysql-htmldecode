CREATE FUNCTION HTMLDecode (InputString TEXT)
  RETURNS TEXT
  BEGIN
    DECLARE vcResult VARCHAR(4000);
    DECLARE vcCrLf VARCHAR(2);
    DECLARE siPos SMALLINT;
    DECLARE vcEncoded VARCHAR(7);
    DECLARE siChar SMALLINT;
    
    SET vcCrLF = CHAR(13) + CHAR(10);
    
    SELECT InputString INTO vcResult;
    SELECT PATINDEX('%&#___;%', vcResult) INTO siPos;
        WHILE (siPos > 0)
        DO
          SELECT SUBSTRING(vcResult, siPos, 6) INTO vcEncoded;
          SELECT SUBSTRING(vcEncoded, 3, 3) INTO siChar;
          SELECT REPLACE(vcResult, vcEncoded, CHAR(siChar)) INTO vcResult;
          SELECT PATINDEX('%&#___;%', vcResult) INTO siPos;
        END WHILE;
    
    SELECT PATINDEX('%&#____;%', vcResult) INTO siPos;
    WHILE (siPos > 0)
    DO
      SELECT SUBSTRING(vcResult, siPos, 7) INTO vcEncoded;
      SELECT SUBSTRING(vcEncoded, 3, 4) INTO siChar;
      SELECT REPLACE(vcResult, vcEncoded, CHAR(siChar)) INTO vcResult;
      SELECT PATINDEX('%&#____;%', vcResult) INTO siPos;
    END WHILE;
    
    SELECT REPLACE(vcResult, '&quot;', CHAR(0x0022)) INTO vcResult;
    SELECT REPLACE(vcResult, '&amp;', CHAR(0x0026)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lt;', CHAR(0x003c)) INTO vcResult;
    SELECT REPLACE(vcResult, '&gt;', CHAR(0x003e)) INTO vcResult;
    SELECT REPLACE(vcResult, '&nbsp;', CHAR(0x00a0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&iexcl;', CHAR(0x00a1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&cent;', CHAR(0x00a2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&pound;', CHAR(0x00a3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&curren;', CHAR(0x00a4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&yen;', CHAR(0x00a5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&brvbar;', CHAR(0x00a6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sect;', CHAR(0x00a7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&uml;', CHAR(0x00a8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&copy;', CHAR(0x00a9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ordf;', CHAR(0x00aa)) INTO vcResult;
    SELECT REPLACE(vcResult, '&laquo;', CHAR(0x00ab)) INTO vcResult;
    SELECT REPLACE(vcResult, '&not;', CHAR(0x00ac)) INTO vcResult;
    SELECT REPLACE(vcResult, '&shy;', CHAR(0x00ad)) INTO vcResult;
    SELECT REPLACE(vcResult, '&reg;', CHAR(0x00ae)) INTO vcResult;
    SELECT REPLACE(vcResult, '&macr;', CHAR(0x00af)) INTO vcResult;
    SELECT REPLACE(vcResult, '&deg;', CHAR(0x00b0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&plusmn;', CHAR(0x00b1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sup2;', CHAR(0x00b2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sup3;', CHAR(0x00b3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&acute;', CHAR(0x00b4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&micro;', CHAR(0x00b5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&para;', CHAR(0x00b6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&middot;', CHAR(0x00b7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&cedil;', CHAR(0x00b8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sup1;', CHAR(0x00b9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ordm;', CHAR(0x00ba)) INTO vcResult;
    SELECT REPLACE(vcResult, '&raquo;', CHAR(0x00bb)) INTO vcResult;
    SELECT REPLACE(vcResult, '&frac14;', CHAR(0x00bc)) INTO vcResult;
    SELECT REPLACE(vcResult, '&frac12;', CHAR(0x00bd)) INTO vcResult;
    SELECT REPLACE(vcResult, '&frac34;', CHAR(0x00be)) INTO vcResult;
    SELECT REPLACE(vcResult, '&iquest;', CHAR(0x00bf)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Agrave;', CHAR(0x00c0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Aacute;', CHAR(0x00c1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Acirc;', CHAR(0x00c2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Atilde;', CHAR(0x00c3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Auml;', CHAR(0x00c4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Aring;', CHAR(0x00c5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&AElig;', CHAR(0x00c6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ccedil;', CHAR(0x00c7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Egrave;', CHAR(0x00c8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Eacute;', CHAR(0x00c9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ecirc;', CHAR(0x00ca)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Euml;', CHAR(0x00cb)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Igrave;', CHAR(0x00cc)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Iacute;', CHAR(0x00cd)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Icirc;', CHAR(0x00ce )) INTO vcResult;
    SELECT REPLACE(vcResult, '&Iuml;', CHAR(0x00cf)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ETH;', CHAR(0x00d0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ntilde;', CHAR(0x00d1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ograve;', CHAR(0x00d2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Oacute;', CHAR(0x00d3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ocirc;', CHAR(0x00d4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Otilde;', CHAR(0x00d5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ouml;', CHAR(0x00d6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&times;', CHAR(0x00d7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Oslash;', CHAR(0x00d8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ugrave;', CHAR(0x00d9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Uacute;', CHAR(0x00da)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Ucirc;', CHAR(0x00db)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Uuml;', CHAR(0x00dc)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Yacute;', CHAR(0x00dd)) INTO vcResult;
    SELECT REPLACE(vcResult, '&THORN;', CHAR(0x00de)) INTO vcResult;
    SELECT REPLACE(vcResult, '&szlig;', CHAR(0x00df)) INTO vcResult;
    SELECT REPLACE(vcResult, '&agrave;', CHAR(0x00e0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&aacute;', CHAR(0x00e1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&acirc;', CHAR(0x00e2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&atilde;', CHAR(0x00e3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&auml;', CHAR(0x00e4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&aring;', CHAR(0x00e5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&aelig;', CHAR(0x00e6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ccedil;', CHAR(0x00e7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&egrave;', CHAR(0x00e8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&eacute;', CHAR(0x00e9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ecirc;', CHAR(0x00ea)) INTO vcResult;
    SELECT REPLACE(vcResult, '&euml;', CHAR(0x00eb)) INTO vcResult;
    SELECT REPLACE(vcResult, '&igrave;', CHAR(0x00ec)) INTO vcResult;
    SELECT REPLACE(vcResult, '&iacute;', CHAR(0x00ed)) INTO vcResult;
    SELECT REPLACE(vcResult, '&icirc;', CHAR(0x00ee)) INTO vcResult;
    SELECT REPLACE(vcResult, '&iuml;', CHAR(0x00ef)) INTO vcResult;
    SELECT REPLACE(vcResult, '&eth;', CHAR(0x00f0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ntilde;', CHAR(0x00f1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ograve;', CHAR(0x00f2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&oacute;', CHAR(0x00f3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ocirc;', CHAR(0x00f4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&otilde;', CHAR(0x00f5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ouml;', CHAR(0x00f6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&divide;', CHAR(0x00f7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&oslash;', CHAR(0x00f8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ugrave;', CHAR(0x00f9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&uacute;', CHAR(0x00fa)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ucirc;', CHAR(0x00fb)) INTO vcResult;
    SELECT REPLACE(vcResult, '&uuml;', CHAR(0x00fc)) INTO vcResult;
    SELECT REPLACE(vcResult, '&yacute;', CHAR(0x00fd)) INTO vcResult;
    SELECT REPLACE(vcResult, '&thorn;', CHAR(0x00fe)) INTO vcResult;
    SELECT REPLACE(vcResult, '&yuml;', CHAR(0x00ff)) INTO vcResult;
    SELECT REPLACE(vcResult, '&OElig;', CHAR(0x0152)) INTO vcResult;
    SELECT REPLACE(vcResult, '&oelig;', CHAR(0x0153)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Scaron;', CHAR(0x0160)) INTO vcResult;
    SELECT REPLACE(vcResult, '&scaron;', CHAR(0x0161)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Yuml;', CHAR(0x0178)) INTO vcResult;
    SELECT REPLACE(vcResult, '&fnof;', CHAR(0x0192)) INTO vcResult;
    SELECT REPLACE(vcResult, '&circ;', CHAR(0x02c6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&tilde;', CHAR(0x02dc)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Alpha;', CHAR(0x0391)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Beta;', CHAR(0x0392)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Gamma;', CHAR(0x0393)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Delta;', CHAR(0x0394)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Epsilon;', CHAR(0x0395)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Zeta;', CHAR(0x0396)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Eta;', CHAR(0x0397)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Theta;', CHAR(0x0398)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Iota;', CHAR(0x0399)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Kappa;', CHAR(0x039a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Lambda;', CHAR(0x039b)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Mu;', CHAR(0x039c)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Nu;', CHAR(0x039d)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Xi;', CHAR(0x039e)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Omicron;', CHAR(0x039f)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Pi;', CHAR(0x03a0)) INTO vcResult;
    SELECT REPLACE(vcResult, '& Rho ;', CHAR(0x03a1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Sigma;', CHAR(0x03a3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Tau;', CHAR(0x03a4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Upsilon;', CHAR(0x03a5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Phi;', CHAR(0x03a6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Chi;', CHAR(0x03a7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Psi;', CHAR(0x03a8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Omega;', CHAR(0x03a9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&alpha;', CHAR(0x03b1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&beta;', CHAR(0x03b2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&gamma;', CHAR(0x03b3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&delta;', CHAR(0x03b4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&epsilon;', CHAR(0x03b5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&zeta;', CHAR(0x03b6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&eta;', CHAR(0x03b7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&theta;', CHAR(0x03b8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&iota;', CHAR(0x03b9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&kappa;', CHAR(0x03ba)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lambda;', CHAR(0x03bb)) INTO vcResult;
    SELECT REPLACE(vcResult, '&mu;', CHAR(0x03bc)) INTO vcResult;
    SELECT REPLACE(vcResult, '&nu;', CHAR(0x03bd)) INTO vcResult;
    SELECT REPLACE(vcResult, '&xi;', CHAR(0x03be)) INTO vcResult;
    SELECT REPLACE(vcResult, '&omicron;', CHAR(0x03bf)) INTO vcResult;
    SELECT REPLACE(vcResult, '&pi;', CHAR(0x03c0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rho;', CHAR(0x03c1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sigmaf;', CHAR(0x03c2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sigma;', CHAR(0x03c3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&tau;', CHAR(0x03c4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&upsilon;', CHAR(0x03c5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&phi;', CHAR(0x03c6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&chi;', CHAR(0x03c7)) INTO vcResult;
    SELECT REPLACE(vcResult, '&psi;', CHAR(0x03c8)) INTO vcResult;
    SELECT REPLACE(vcResult, '&omega;', CHAR(0x03c9)) INTO vcResult;
    SELECT REPLACE(vcResult, '&thetasym;', CHAR(0x03d1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&upsih;', CHAR(0x03d2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&piv;', CHAR(0x03d6)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ensp;', CHAR(0x2002)) INTO vcResult;
    SELECT REPLACE(vcResult, '&emsp;', CHAR(0x2003)) INTO vcResult;
    SELECT REPLACE(vcResult, '&thinsp;', CHAR(0x2009)) INTO vcResult;
    SELECT REPLACE(vcResult, '&zwnj;', CHAR(0x200c)) INTO vcResult;
    SELECT REPLACE(vcResult, '&zwj;', CHAR(0x200d)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lrm;', CHAR(0x200e)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rlm;', CHAR(0x200f)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ndash;', CHAR(0x2013)) INTO vcResult;
    SELECT REPLACE(vcResult, '&mdash;', CHAR(0x2014)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lsquo;', CHAR(0x2018)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rsquo;', CHAR(0x2019)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sbquo;', CHAR(0x201a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ldquo;', CHAR(0x201c)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rdquo;', CHAR(0x201d)) INTO vcResult;
    SELECT REPLACE(vcResult, '&bdquo;', CHAR(0x201e)) INTO vcResult;
    SELECT REPLACE(vcResult, '&dagger;', CHAR(0x2020)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Dagger;', CHAR(0x2021)) INTO vcResult;
    SELECT REPLACE(vcResult, '&bull;', CHAR(0x2022)) INTO vcResult;
    SELECT REPLACE(vcResult, '&hellip;', CHAR(0x2026)) INTO vcResult;
    SELECT REPLACE(vcResult, '&permil;', CHAR(0x2030)) INTO vcResult;
    SELECT REPLACE(vcResult, '&prime;', CHAR(0x2032)) INTO vcResult;
    SELECT REPLACE(vcResult, '&Prime;', CHAR(0x2033)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lsaquo;', CHAR(0x2039)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rsaquo;', CHAR(0x203a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&oline;', CHAR(0x203e)) INTO vcResult;
    SELECT REPLACE(vcResult, '&frasl;', CHAR(0x2044)) INTO vcResult;
    SELECT REPLACE(vcResult, '&euro;', CHAR(0x20ac)) INTO vcResult;
    SELECT REPLACE(vcResult, '&image;', CHAR(0x2111)) INTO vcResult;
    SELECT REPLACE(vcResult, '&weierp;', CHAR(0x2118)) INTO vcResult;
    SELECT REPLACE(vcResult, '&real;', CHAR(0x211c)) INTO vcResult;
    SELECT REPLACE(vcResult, '&trade;', CHAR(0x2122)) INTO vcResult;
    SELECT REPLACE(vcResult, '&alefsym;', CHAR(0x2135)) INTO vcResult;
    SELECT REPLACE(vcResult, '&larr;', CHAR(0x2190)) INTO vcResult;
    SELECT REPLACE(vcResult, '&uarr;', CHAR(0x2191)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rarr;', CHAR(0x2192)) INTO vcResult;
    SELECT REPLACE(vcResult, '&darr;', CHAR(0x2193)) INTO vcResult;
    SELECT REPLACE(vcResult, '&harr;', CHAR(0x2194)) INTO vcResult;
    SELECT REPLACE(vcResult, '&crarr;', CHAR(0x21b5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lArr;', CHAR(0x21d0)) INTO vcResult;
    SELECT REPLACE(vcResult, '&uArr;', CHAR(0x21d1)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rArr;', CHAR(0x21d2)) INTO vcResult;
    SELECT REPLACE(vcResult, '&dArr;', CHAR(0x21d3)) INTO vcResult;
    SELECT REPLACE(vcResult, '&hArr;', CHAR(0x21d4)) INTO vcResult;
    SELECT REPLACE(vcResult, '&forall;', CHAR(0x2200)) INTO vcResult;
    SELECT REPLACE(vcResult, '&part;', CHAR(0x2202)) INTO vcResult;
    SELECT REPLACE(vcResult, '&exist;', CHAR(0x2203)) INTO vcResult;
    SELECT REPLACE(vcResult, '&empty;', CHAR(0x2205)) INTO vcResult;
    SELECT REPLACE(vcResult, '&nabla;', CHAR(0x2207)) INTO vcResult;
    SELECT REPLACE(vcResult, '&isin;', CHAR(0x2208)) INTO vcResult;
    SELECT REPLACE(vcResult, '&notin;', CHAR(0x2209)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ni;', CHAR(0x220b)) INTO vcResult;
    SELECT REPLACE(vcResult, '&prod;', CHAR(0x220f)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sum;', CHAR(0x2211)) INTO vcResult;
    SELECT REPLACE(vcResult, '&minus;', CHAR(0x2212)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lowast;', CHAR(0x2217)) INTO vcResult;
    SELECT REPLACE(vcResult, '&radic;', CHAR(0x221a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&prop;', CHAR(0x221d)) INTO vcResult;
    SELECT REPLACE(vcResult, '&infin;', CHAR(0x221e)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ang;', CHAR(0x2220)) INTO vcResult;
    SELECT REPLACE(vcResult, '&and;', CHAR(0x2227)) INTO vcResult;
    SELECT REPLACE(vcResult, '&or;', CHAR(0x2228)) INTO vcResult;
    SELECT REPLACE(vcResult, '&cap;', CHAR(0x2229)) INTO vcResult;
    SELECT REPLACE(vcResult, '&cup;', CHAR(0x222a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&int;', CHAR(0x222b)) INTO vcResult;
    SELECT REPLACE(vcResult, '&there4;', CHAR(0x2234)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sim;', CHAR(0x223c)) INTO vcResult;
    SELECT REPLACE(vcResult, '&cong;', CHAR(0x2245)) INTO vcResult;
    SELECT REPLACE(vcResult, '&asymp;', CHAR(0x2248)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ne;', CHAR(0x2260)) INTO vcResult;
    SELECT REPLACE(vcResult, '&equiv;', CHAR(0x2261)) INTO vcResult;
    SELECT REPLACE(vcResult, '&le;', CHAR(0x2264)) INTO vcResult;
    SELECT REPLACE(vcResult, '&ge;', CHAR(0x2265)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sub;', CHAR(0x2282)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sup;', CHAR(0x2283)) INTO vcResult;
    SELECT REPLACE(vcResult, '&nsub;', CHAR(0x2284)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sube;', CHAR(0x2286)) INTO vcResult;
    SELECT REPLACE(vcResult, '&supe;', CHAR(0x2287)) INTO vcResult;
    SELECT REPLACE(vcResult, '&oplus;', CHAR(0x2295)) INTO vcResult;
    SELECT REPLACE(vcResult, '&otimes;', CHAR(0x2297)) INTO vcResult;
    SELECT REPLACE(vcResult, '&perp;', CHAR(0x22a5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&sdot;', CHAR(0x22c5)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lceil;', CHAR(0x2308)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rceil;', CHAR(0x2309)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lfloor;', CHAR(0x230a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rfloor;', CHAR(0x230b)) INTO vcResult;
    SELECT REPLACE(vcResult, '&lang;', CHAR(0x2329)) INTO vcResult;
    SELECT REPLACE(vcResult, '&rang;', CHAR(0x232a)) INTO vcResult;
    SELECT REPLACE(vcResult, '&loz;', CHAR(0x25ca)) INTO vcResult;
    SELECT REPLACE(vcResult, '&spades;', CHAR(0x2660)) INTO vcResult;
    SELECT REPLACE(vcResult, '&clubs;', CHAR(0x2663)) INTO vcResult;
    SELECT REPLACE(vcResult, '&hearts;', CHAR(0x2665)) INTO vcResult;
    SELECT REPLACE(vcResult, '&diams;', CHAR(0x2666)) INTO vcResult;
    
    SELECT REPLACE(vcResult, '<P>', vcCrLf) INTO vcResult;
    
    RETURN vcResult;
  END