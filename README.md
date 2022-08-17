# Card games

The idea here is to have a [redbean](https://justine.lol/redbean2/) loaded with card games, both playable in
your shell and in a GUI (aka your browser via localhost).

Starting small, I will introduce a couple [patience games](<https://en.wikipedia.org/wiki/Patience_(game)>), followed up by 2+ player games against an AI. With those in place, I can consider handling wetware multiplayer (though maybe only in the GUI).

```bash
$ make test
    🂱: 🃁
    🂲: 🃂
    🂳: 🃃🂶🂹
    🂴: 🃄🂸🂽
    [🂵🂷🂺🂻] [🂾]
```

## ♡ TODO

#### [Calculation](<https://en.wikipedia.org/wiki/Calculation_(card_game)>) (patience)

-   [x] Render unicode playing cards instead of indexes
-   [x] Validate placement of cards in foundations
-   [x] Render cards in the browser
-   [x] Add drag/drop events
-   [ ] Handle winning
-   [ ] Handle losing

## ♢ Developer Documentation

-   https://redbean.dev/
-   https://github.com/pkulchenko/fullmoon/

## ♧ Lua Documentation

-   https://devdocs.io/lua~5.4/
-   https://learnxinyminutes.com/docs/lua/

## ♤ Sqlite Documentation

-   https://devdocs.io/sqlite/
-   https://learnxinyminutes.com/docs/sql/

-----

#### Example of drag and drop

https://html.spec.whatwg.org/multipage/dnd.html#drag-and-drop-processing-model

https://user-images.githubusercontent.com/118710/185034491-11b5eb0e-0441-4f7a-8ee5-720b699457ef.mp4
