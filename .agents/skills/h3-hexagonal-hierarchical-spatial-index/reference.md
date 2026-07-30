# H3 Reference

## Official resources

- **Documentation and API**: https://h3geo.org/
- **Core library (C)**: https://github.com/uber/h3
- **Uber blog (design rationale)**: https://www.uber.com/en-IE/blog/h3/
- **Community bindings**: https://h3geo.org/docs/community/bindings

## Bindings (use these; do not call C directly)

| Language       | Repo / package                       | Notes            |
| -------------- | ------------------------------------ | ---------------- |
| Python         | https://github.com/uber/h3-py / `h3` | `pip install h3` |
| JavaScript     | https://github.com/uber/h3-js        | Node / browser   |
| Java           | https://github.com/uber/h3-java      | Uber-maintained  |
| Go, Rust, etc. | See community bindings on H3 docs    |                  |

## Core API (concept → typical name)

- **Lat/lon → cell**: `geo_to_h3(lat, lon, resolution)` (Python: `h3.geo_to_h3`; JS: `h3.latLngToCell`).
- **Cell → center**: `h3_to_geo(index)` → (lat, lon).
- **Cell → boundary**: `h3_to_geo_boundary(index)` → list of (lat, lon) for polygon.
- **Neighbors at distance k**: `k_ring(index, k)` (Python: `h3.k_ring`; JS: `h3.gridDisk`).
- **Compact / uncompact**: `compact(set of indexes)`, `uncompact(set, resolution)` for storage-efficient representation of regions.
- **Resolution**: `get_resolution(index)`; parent/children for hierarchy.

## Index representation

- **64-bit integer** (e.g. `0x8928308280fffff`).
- String form is often hex; truncation by resolution is a bitwise operation on the integer.
- Directed edges are also 64-bit; different mode bits than cell indexes.

## Resolution and scale

- Resolution 0: coarsest (e.g. very large cells).
- Resolution 15: finest (e.g. ~0.9 m² per cell at equator).
- Common urban analysis: resolutions 7–10 (e.g. ~5 km² down to ~0.1 km² per cell, ballpark).
- Each step finer ≈ 1/7 area; exact area varies with latitude.

## When to apply this skill

- User asks about H3, Uber’s grid, or hexagonal spatial index.
- User needs to bucket lat/lon into cells, do radius/neighbor queries, or aggregate by area.
- User mentions geospatial indexing, surge grids, or compact hexagon sets.
