# Card games

The idea here is to have a [redbean](https://justine.lol/redbean2/) loaded with card games, both playable in
your shell and in a GUI (aka your browser via localhost).

Starting small, I will introduce a couple [patience games](https://en.wikipedia.org/wiki/Patience_(game)), followed up by 2+ player games against an AI. With those in place, I can consider handling wetware multiplayer (though maybe only in the GUI).

```bash
$ make test
    🂱: 🃁
    🂲: 🃂
    🂳: 🃃🂶🂹
    🂴: 🃄🂸🂽
    [🂵🂷🂺🂻] [🂾]
```

## ♡ TODO

#### [Calculation](https://en.wikipedia.org/wiki/Calculation_(card_game)) (patience)
- [x] Render unicode playing cards instead of indexes
- [x] Validate placement of cards in foundations
- [ ] Handle winning
- [ ] Handle losing

## ♢ Developer Documentation
- https://redbean.dev/
- https://github.com/pkulchenko/fullmoon/

## ♧ Lua Documentation
- https://devdocs.io/lua~5.4/
- https://learnxinyminutes.com/docs/lua/

## ♤ Sqlite Documentation
- https://devdocs.io/sqlite/
- https://learnxinyminutes.com/docs/sql/
