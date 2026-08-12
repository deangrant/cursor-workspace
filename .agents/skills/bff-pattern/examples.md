# BFF Pattern — Examples

**Prefer:** `mobile-bff` returns a single “home feed” DTO assembled from catalog,
recs, and user services.

**Avoid:** stuffing payment ledger rules inside the BFF because “the app needs it.”
