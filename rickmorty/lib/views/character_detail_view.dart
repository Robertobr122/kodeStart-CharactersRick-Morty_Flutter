import 'package:flutter/material.dart';
import '../models/character.dart';
import '../widgets/app_header.dart';

class CharacterDetailView extends StatelessWidget {
  final Character character;
  const CharacterDetailView({super.key, required this.character});

  static const _sidePadding = 20.0;
  static const _topFromHeader = 17.0;
  static const _cardW = 320.0;
  static const _cardH = 470.0;
  static const _radius = 16.0;

  static const _imgW = 320.0;
  static const _imgH = 160.0;

  static const _panelColor = Color(0xFF87A1FA);

  static const _nameStyle = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );
  static const _valueStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const _mutedStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w300,
    color: Colors.white70,
  );

  static const _leftInset = 16.0;
  static const _gapNameToSpecies = 38.0;
  static const _gapRow = 12.0;
  static const _gapLabelToValue = 4.0;
  static const _groupGap = 15.0;
  static const _panelBottomGap = 43.0;

  static const _dotOuter = 12.0;
  static const _dotInner = 6.0;
  static const _dotBorder = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        leftIcon: Icons.arrow_back,
        onLeftTap: () => Navigator.of(context).maybePop(),
        rightImageAsset: 'assets/images/icon.png',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _sidePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: _topFromHeader),

              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_radius),
                  child: Container(
                    width: _cardW,
                    height: _cardH,
                    color: _panelColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(_radius),
                          child: Image.network(
                            character.image,
                            width: _imgW,
                            height: _imgH,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: _leftInset,
                            right: 12,
                            top: 12,
                            bottom: _panelBottomGap,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name.toUpperCase(),
                                style: _nameStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: _gapNameToSpecies),

                              Row(
                                children: [
                                  Container(
                                    width: _dotOuter,
                                    height: _dotOuter,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: _dotBorder,
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: _dotInner,
                                        height: _dotInner,
                                        decoration: BoxDecoration(
                                          color: _statusColor(character.status),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      '${_cap(character.status)} - ${_cap(character.species)}',
                                      style: _valueStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: _groupGap),

                              _infoRow('Gender:', _cap(character.gender)),
                              const SizedBox(height: _gapRow),

                              _infoRow('Origin:', character.origin),
                              const SizedBox(height: _groupGap),

                              Text('Last known location:', style: _mutedStyle),
                              const SizedBox(height: _gapLabelToValue),
                              Text(
                                character.location,
                                style: _valueStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: _groupGap),

                              Text('First seen in:', style: _mutedStyle),
                              const SizedBox(height: _gapLabelToValue),
                              Text(
                                character.firstEpisode,
                                style: _valueStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: _mutedStyle),
      const SizedBox(width: 6),
      Expanded(
        child: Text(
          value,
          style: _valueStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

  static Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return const Color(0xFF4CAF50);
      case 'dead':
        return const Color(0xFFE53935);
      default:
        return const Color(0xFFBDBDBD);
    }
  }

  static String _cap(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();
}
