---
name: h3-hexagonal-hierarchical-spatial-index
description: Provides domain knowledge for Uber's H3 hexagonal hierarchical spatial index. Use when working with H3, hexagonal geospatial grids, location bucketing, geo-indexing, surge/pricing grids, or when the user mentions H3, Uber's grid system, or hexagonal spatial indexing.
---

# H3: Hexagonal Hierarchical Spatial Index

When to use this skill: H3, hexagonal grids, geospatial indexing, location bucketing, grid-based analysis of lat/lon data, k-ring neighbors, compact/uncompact hexagon sets, or directed edges between cells.

## What H3 Is

H3 is Uber's open-source **global grid system** that partitions the Earth into **hexagonal cells** with a **hierarchical index**. It is used for bucketing events (rides, dispatch, demand/supply) into comparable, uniformly shaped areas for analysis (e.g. surge pricing, clustering).

- **Why grids**: Bucketing points into cells makes city-wide analysis practical; raw point-level analysis is expensive and noisy.
- **Why hexagons**: Single distance to all 6 neighbors (squares have 4 edge-neighbors + 4 vertex-neighbors). Hexagons minimize quantization error for moving users and approximate circles/radii well (e.g. radius queries).
- **Why hierarchical**: Coarse/fine resolutions allow truncating or expanding index precision efficiently; child cells have ~1/7 the area of parent (not perfect subdivision).

## Core Design (from Uber blog)

- **Projection**: Gnomonic projections centered on **icosahedron faces** (Earth → 20-faced platonic solid). Forms a geodesic discrete global grid system; grid lives on the icosahedron faces, not a single unfolded map.
- **Base grid**: **122 base cells** over the Earth (~10 per face). **12 pentagons** (one per icosahedron vertex); vertices use Fuller orientation (in water) so pentagons rarely appear in land analysis.
- **Resolutions**: **16 levels**, 0 (coarsest) to 15 (finest). Resolution 0 = coarsest; 15 = finest. Each finer resolution has cells with ~1/7 the area of the coarser. Child cells are only approximately contained in a parent; truncating an index to a coarser resolution causes a fixed, bounded shape distortion.
- **Index**: **64-bit H3 index** identifies a single cell (or directed edge). Truncation by resolution is a bitwise operation; useful for indexing and aggregation at multiple scales.

## Key API Concepts

- **Indexing**: `geoToH3(lat, lon, resolution)` → 64-bit H3 index. Resolution in [0, 15].
- **Inverse**: `h3ToGeo(index)` → center (lat, lon); `h3ToGeoBoundary(index)` → outline of the cell.
- **Neighbors**: `kRing(originIndex, k)` → all cells within grid distance k (approximates circles; k=0 is just the origin, k=1 is origin + 6 neighbors, etc.).
- **Hierarchy**: Truncate index to coarser resolution (bitwise); expand to finer resolution (children). **compact** / **uncompact**: convert between a set of hexagons at one resolution (uncompact) and a minimal set of hexagons at mixed resolutions that cover the same cells (compact)—fewer indexes for storage.
- **Directed edges**: Represent movement from one cell to a neighbor. Stored as 64-bit; obtain from two neighboring cells or from all edges of a cell; can recover origin/destination indexes.

## Implementation Notes

- **Library**: Core in C; use **language bindings** (e.g. [h3-py](https://github.com/uber/h3-py) for Python, [h3-js](https://github.com/uber/h3-js) for JavaScript, [h3-java](https://github.com/uber/h3-java), others on [H3 docs](https://h3geo.org/docs)).
- **Typical workflow**: (1) Choose a resolution for analysis. (2) Convert (lat, lon) → H3 index with `geoToH3`. (3) Aggregate or analyze by index (e.g. count events per cell, kRing for radius). (4) Optionally compact sets for storage; truncate for coarser summaries.
- **Alternatives**: Polygons (e.g. postal codes) are irregular and change over time; operator-drawn zones need manual updates. H3 gives uniform, stable, globally consistent cells.

## Quick Reference

- Official docs and API: https://h3geo.org/
- GitHub: https://github.com/uber/h3
- Blog (design rationale): https://www.uber.com/en-IE/blog/h3/

For API details, bindings, and examples, see [reference.md](reference.md).
