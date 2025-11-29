import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AboutSubSection extends StatefulWidget {
  AboutSubSection({Key? key}) : super(key: key);

  @override
  _AboutSubSectionState createState() => _AboutSubSectionState();
}

class _AboutSubSectionState extends State<AboutSubSection> {
  Map<String, String> _previewImages = {};
  Set<String> _loadingUrls = {};

  @override
  void initState() {
    super.initState();
    _fetchPreviews();
  }

  Future<void> _fetchPreviews() async {
    for (var item in portfolio) {
      final url = item['URL']!;
      if (mounted) {
        setState(() {
          _loadingUrls.add(url);
        });
      }
      try {
        final previewUrl = await _getWebsitePreview(url);
        if (mounted) {
          setState(() {
            _loadingUrls.remove(url);
            if (previewUrl != null) {
              _previewImages[url] = previewUrl;
            }
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _loadingUrls.remove(url);
          });
        }
        print('Error fetching preview for $url: $e');
      }
    }
  }

  Future<String?> _getWebsitePreview(String url) async {
    try {
      // Use a screenshot service API
      // Option 1: Using screenshotapi.net (requires API key, but has free tier)
      // Option 2: Using image.thum.io (free but limited)
      // Option 3: Using microlink.io API (free)

      // Using microlink.io which provides link previews
      final apiUrl = 'https://api.microlink.io?url=${Uri.encodeComponent(url)}';
      final response = await http.get(Uri.parse(apiUrl)).timeout(
            Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['data'] != null && data['data']['image'] != null) {
          return data['data']['image']['url'] as String;
        }
      }
    } catch (e) {
      print('Error getting preview: $e');
    }

    // Fallback: Try to get screenshot using thum.io (free service)
    try {
      return 'https://image.thum.io/get/width/800/crop/800/${Uri.encodeComponent(url)}';
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  var portfolio = [
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747918758/Guava/wd5nzo87znds8mw7sesf.png',
      'NAME': 'Pollinet',
      'URL': 'https://pollinet.xyz',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747918758/Guava/wd5nzo87znds8mw7sesf.png',
      'NAME': 'Guava Finance',
      'URL': 'https://guava.finance/',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747919091/Guava/nb6pxyrjo8zciinw5v6y.png',
      'NAME': 'De-escrow',
      'URL': 'https://de-escrow.vercel.app/',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747919091/Guava/nb6pxyrjo8zciinw5v6y.png',
      'NAME': 'Excrow Bot',
      'URL': 'https://bot.excrow.co',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747934355/Guava/kfkupn4bov6bav2sp7z2.png',
      'NAME': 'Trigger - End of Life Service',
      'URL':
          'https://apps.apple.com/ng/app/trigger-end-of-life-service/id6448679624',
    },
    {
      'IMAGE':
          'https://res.cloudinary.com/oghenekparobor/image/upload/v1747919205/Guava/qn9ekcuh5gzr5ofyxabn.png',
      'NAME': 'Renmoney MFB',
      'URL': 'https://renmoney.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 500;
    
    return Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: SlideInUp(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 12 : 20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: isMobile ? 12 : 20,
              mainAxisSpacing: isMobile ? 12 : 20,
              childAspectRatio: isMobile ? 0.85 : 0.75,
            ),
            itemCount: portfolio.length,
            itemBuilder: (context, index) {
              final url = portfolio[index]['URL']!;
              final previewImage =
                  _previewImages[url] ?? portfolio[index]['IMAGE']!;
              final isLoading = _loadingUrls.contains(url);
              return _PortfolioCard(
                name: portfolio[index]['NAME']!,
                image: previewImage,
                url: url,
                index: index,
                isLoading: isLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PortfolioCard extends StatefulWidget {
  final String name;
  final String image;
  final String url;
  final int index;
  final bool isLoading;

  const _PortfolioCard({
    required this.name,
    required this.image,
    required this.url,
    required this.index,
    this.isLoading = false,
  });

  @override
  State<_PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<_PortfolioCard> {
  bool _isHovered = false;

  bool _isSvgImage(String url) {
    return url.toLowerCase().endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Color(0xffC59344).withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.3),
                blurRadius: _isHovered ? 30 : 20,
                offset: Offset(0, _isHovered ? 15 : 10),
              ),
            ],
            border: Border.all(
              color: _isHovered
                  ? Color(0xffC59344).withValues(alpha: 0.5)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AnimatedScale(
                          scale: _isHovered ? 1.05 : 1.0,
                          duration: Duration(milliseconds: 300),
                          child: _isSvgImage(widget.image)
                              ? SvgPicture.network(
                                  widget.image,
                                  fit: BoxFit.cover,
                                  placeholderBuilder: (context) => Container(
                                    color: Color(0xFF2A2A2A),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xffC59344),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Image.network(
                                  widget.image,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      color: Color(0xFF2A2A2A),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress.expectedTotalBytes!
                                              : null,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Color(0xffC59344),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Color(0xFF2A2A2A),
                                      child: Icon(
                                        Icons.image_not_supported,
                                        color: Colors.white38,
                                        size: 48,
                                      ),
                                    );
                                  },
                                ),
                        ),
                        if (widget.isLoading)
                          Container(
                            color: Colors.black.withValues(alpha: 0.3),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xffC59344),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  widget.name,
                  style: GoogleFonts.abel(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
