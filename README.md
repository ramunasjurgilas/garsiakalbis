# Lautsprecher

![Music Albums](Screenshots/screen-1.png?raw=true "Music Albums")
![Album Artwork](Screenshots/screen-2.png?raw=true "Album Artwork")

- Not needed code in SwiftUI was removed.
- Introduced state view representation.
- Introduced protocol ViewStateRepresenter to reduce code duplication.
- LTNetworking module was added

# LTNetworking

This module responsible for networking task.

## API Requests

- GetMusicAlbumsRequest: responsible for getting music albums from backend.
- GetCoverArtRequest: responsible for getting covert artwork for the album.

## Usage

```
@Published var viewState: ViewState<[MusicAlbum]>    
var cancellable = [AnyCancellable]()

GetMusicAlbumsRequest().exe()
    .map { self.mapViewState($0) }
    .assign(to: \.viewState, on: self)
    .store(in: &cancellable)
```

## Unit test

Contains one unmocked unit test for GetMusicAlbumRequest.

