# H3 Hexagonal Hierarchical Spatial Index (Skill)

Agent skill that provides domain knowledge for **Uber's H3** hexagonal hierarchical spatial index. Use this skill when working with H3, hexagonal geospatial grids, location bucketing, geo-indexing, surge/pricing grids, or when the user mentions H3, Uber's grid system, or hexagonal spatial indexing.

## When to use

- **H3** — Uber's grid system or hexagonal spatial index
- **Hexagonal grids** — geospatial indexing, location bucketing
- **Grid-based analysis** — bucketing lat/lon into comparable areas
- **Neighbors & radius** — k-ring neighbors, compact/uncompact hexagon sets
- **Directed edges** — movement between cells, edge indexes

## What this skill covers

- **What H3 is** — global hexagonal grid over the Earth, hierarchical resolutions (0–15), 64-bit cell indexes
- **Design** — gnomonic projection on icosahedron faces, 122 base cells, 12 pentagons, truncation/children
- **Core API** — `geoToH3` / `h3ToGeo`, `kRing`, compact/uncompact, directed edges
- **Implementation** — C core with bindings (Python `h3`, JS `h3-js`, Java, etc.), typical workflow and alternatives

## Files

| File | Purpose |
|------|--------|
| [SKILL.md](SKILL.md) | Skill definition and full domain content (used by the agent) |
| [reference.md](reference.md) | Quick reference: official links, bindings, API names, resolution scale |

## Official resources

- **Docs & API**: https://h3geo.org/
- **GitHub**: https://github.com/uber/h3
- **Uber blog (design)**: https://www.uber.com/en-IE/blog/h3/

## Quick API reference

- **Lat/lon → cell**: `geo_to_h3(lat, lon, resolution)` (Python: `h3.geo_to_h3`; JS: `h3.latLngToCell`)
- **Cell → center**: `h3_to_geo(index)` → (lat, lon)
- **Neighbors**: `k_ring(index, k)` (Python: `h3.k_ring`; JS: `h3.gridDisk`)
- **Compact/uncompact**: for storage-efficient region representation

Resolutions 0 (coarsest) to 15 (finest); urban analysis often uses 7–10. See [reference.md](reference.md) for bindings and more detail.
