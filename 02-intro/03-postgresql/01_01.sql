SELECT jsonb_pretty(data)
FROM magic.cards
WHERE data @> '{
            "type": "Enchantment",
            "artist": "Jim Murray",
            "colors": ["White"]
          }';
