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
