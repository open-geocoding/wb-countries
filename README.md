# wb-countries
This repository is to manage countries' vector tiles of World Bank

## Tileset Specification

- metadata.json

```bash
https://open-geocoding.github.io/wb-countries/tiles/metadata.json
```

- Tileset URL

```bash
https://open-geocoding.github.io/wb-countries/tiles/{z}/{x}/{y}.pbf
```

## Original Data

This tilesets was generated from `World Country Polygons - Very High Definition` owned by World Bank.

You may download the shapefile from [here](https://datacatalog.worldbank.org/search/dataset/0038272).

## Generate Country Tiles

- Install NPM packages

```bash
npm i
```

- Generate

```bash
npm run build
```

## Deploy to Github Pages

```bash
npm run deploy
```

## License

About the license of source code and scripts, please see [License](./LICENSE) file.

However, the license of country polygons data belong to World Bank, please follow their license and use their attribution (eg. `©WorldBank`).
