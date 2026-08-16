# Technical Writing — Examples

Before/after rewrites. Rules live in [SKILL.md](SKILL.md) and reference files.

---

## 1. Active voice + short sentences

**Before**

> An error was encountered when the configuration was being loaded by the system
> and it is recommended that verification of the file is performed.

**After**

> The system could not load the configuration file. Verify that `config.yaml`
> exists and is valid YAML.

---

## 2. Terminology + pronouns

**Before**

> When the user opens it, they can edit the thing and submit it so it updates.

**After**

> When the editor opens the draft, they can edit the document and submit it to
> update the published page.

---

## 3. Lists over prose

**Before**

> To deploy, build the image, push it to the registry, update the manifest, and
> apply it to the cluster carefully checking the version.

**After**

> To deploy:
>
> 1. Build the image.
> 2. Push the image to the registry.
> 3. Update the deploy manifest version.
> 4. Apply the manifest to the cluster.

---

## 4. Error message (cause + fix)

**Before**

> Invalid input.

**After**

> The postal code `4872953` has 7 digits. Enter a postal code with 5 or 9 digits.

---

## 5. Error message (constraint)

**Before**

> Permission denied.

**After**

> You need the `billing-admins` role to view this report. Ask an organization
> admin to grant access, or open a report you own.

---

## 6. Microsoft voice / brevity (UI-adjacent)

**Before**

> If you're ready to purchase Office 365 for your organization, contact your
> Microsoft account representative.

**After**

> Ready to buy? Contact us.

(Prefer fuller clarity when the text must survive translation — see
[reference-global-inclusive.md](reference-global-inclusive.md).)

---

## 7. CL / PR first line

**Before**

> Fixed stuff related to auth.

**After**

> Require refresh-token rotation on reuse detection for OAuth clients.
>
> Why: reuse indicates token theft; revoke the token family and force re-auth.
> Tested: unit tests for reuse path; staging login smoke.

---

## 8. Front-loaded paragraph

**Before**

> There are many considerations when configuring the cache. Historically teams
> used TTL-only approaches. Today you should prefer event-driven invalidation
> for mutable entities.

**After**

> Prefer event-driven cache invalidation for mutable entities. TTL-only policies
> leave stale reads under write traffic. Use TTL as a safety net, not the only
> signal.
