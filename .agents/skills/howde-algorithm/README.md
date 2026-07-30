# HoWDe Algorithm Skill

This skill provides domain knowledge and implementation guidance for **HoWDe** (Home and Work location Detection), a validated algorithm for inferring home and work locations from timestamped stop-location data (e.g. from smartphone GPS after stop detection).

## When it applies

- Detecting home or work locations from GPS or stop sequences
- **Stop-location detection** as a prerequisite (e.g. InfoStop) to produce stop-level data for HoWDe
- Implementing or tuning HoWDe in **Python** (official package) or **Rust** (concrete from-spec implementation and quick start in the skill)
- Building human mobility preprocessing pipelines (commuting, employment, accessibility)

## What’s in this skill

- **SKILL.md** – What Cursor uses: when to use HoWDe, prerequisite stop-location detection (InfoStop), Python quick start, Rust quick start, parameter summary
- **reference.md** – Stop-location detection (InfoStop, conversion to HoWDe input), full algorithm workflow, Python API details, Rust implementation guide and core implementation code, links

## Official resources

- **Paper**: [HoWDe: a validated algorithm for Home and Work location Detection](https://arxiv.org/html/2506.20679v2)
- **Python**: HoWDe on [PyPI](https://pypi.org/project/howde/) (`pip install HoWDe`), [GitHub](https://github.com/LLucchini/HoWDe). Stop detection: [InfoStop](https://github.com/ulfaslak/infostop) (`pip install infostop`).
- **Rust**: No official HoWDe or InfoStop crate; the skill and reference include a concrete Rust implementation (data model, core algorithm, and `howde_label` entry point) and a quick-start example for use in Rust or other non-Python stacks.

## Benchmark data

Anonymized stop sequences with ground truth home/work labels: [DTU.28846325](https://doi.org/10.11583/DTU.28846325).
