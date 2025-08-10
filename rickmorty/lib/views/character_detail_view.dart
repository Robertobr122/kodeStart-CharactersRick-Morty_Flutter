import 'package:flutter/material.dart';
import '../models/character.dart';
import '../widgets/app_header.dart';

class CharacterDetailView extends StatelessWidget {
  final Character character;
  const CharacterDetailView({super.key, required this.character});

  static const _sidePadding = 20.0;
  static const _topFromHeader = 17.0;
  static const _cardW = 320.0;
  static const _cardH = 410.0;
  static const _radius = 16.0;
  static const _imgW = 320.0;
  static const _imgH = 160.0;

  static const _panelColor = Color(0xFF87A1FA);

  static const _nameStyle = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w900,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  static const _valueStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  static const _labelStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w300,
    color: Color.fromARGB(255, 255, 255, 255),
  );
  static const _linkStyle = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static const _leftInset = 16.0;
  static const _gapNameToSpecies = 38.0;
  static const _gapSpeciesToLastSeenLabel = 15.0;
  static const _gapLastSeenLabelToValue = 4.0;
  static const _gapFirstSeenLabelFromLastSeenValue = 15.0;
  static const _gapFirstSeenLabelToValue = 4.0;
  static const _panelBottomGap = 43.0;

  static const _dotOuter = 9.0;
  static const _dotInner = 6.0;
  static const _dotBorder = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        leftIcon: Icons.arrow_back,
        rightIcon: Icons.account_circle_outlined,
        onLeftTap: () => Navigator.of(context).maybePop(),
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
                            errorBuilder: (_, __, ___) => Container(
                              width: _imgW,
                              height: _imgH,
                              color: const Color(0xFF2A2A2A),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.white54,
                              ),
                            ),
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
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
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

                              const SizedBox(
                                height: _gapSpeciesToLastSeenLabel,
                              ),

                              const Text(
                                'Last know location:',
                                style: _labelStyle,
                              ),
                              const SizedBox(height: _gapLastSeenLabelToValue),
                              Text(
                                character.location,
                                style: _linkStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(
                                height: _gapFirstSeenLabelFromLastSeenValue,
                              ),

                              const Text('First seen in:', style: _labelStyle),
                              const SizedBox(height: _gapFirstSeenLabelToValue),
                              Text(
                                character.firstEpisode,
                                style: _linkStyle,
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

  static String _cap(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1).toLowerCase();
}
