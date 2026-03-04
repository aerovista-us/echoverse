# SVG Assets Integration

## Summary

SVG assets have been integrated across all pages to enhance visual design and provide better look and feel.

---

## Changes Made

### 1. Docker Configuration
- Updated `dockerfile` to copy assets from `asset/` folder to `/usr/share/nginx/html/assets/` in container
- Assets are now properly included in Docker builds

### 2. Home Page (index.html)
- ✅ **Hero Banner** - Added `hero-aurora.svg` above the first big card
  - Full width banner with opacity 0.85
  - Positioned above the hero grid section

### 3. About Page (about.html)
- ✅ **Smaller Hero Banner** - Added `hero-aurora.svg` with reduced height
  - Max height: 180px
  - Opacity: 0.75
  - Positioned at top of hero section
- ✅ **Divider Wave** - Added `divider-wave.svg` between major sections
  - Between hero section and grid section
  - Opacity: 0.9
  - Margin: 14px 0

### 4. Downloads Page (downloads.html)
- ✅ **Icon in Header** - Added `icon-downloads.svg` in page header
  - Size: 24x24px
  - Opacity: 0.9
  - Positioned next to logo in brand section
- ✅ **Divider Wave** - Added before vault structure section
  - Before "Vault Structure" card
  - Opacity: 0.9
  - Margin: 14px 0

### 5. Tools Page (tools.html)
- ✅ **Icon in Header** - Added `icon-tools.svg` in page header
  - Size: 24x24px
  - Opacity: 0.9
  - Positioned next to logo in brand section
- ✅ **Background Grid** - Added `bg-grid.svg` as very faint background
  - Fixed position overlay
  - Opacity: 0.06 (very faint)
  - Background size: 120px 120px
  - Uses `body::before` pseudo-element

### 6. Projects Page (projects.html)
- ✅ **Icon in Header** - Added `icon-projects.svg` in page header
  - Size: 24x24px
  - Opacity: 0.9
  - Positioned next to logo in brand section
- ✅ **Divider Wave** - Added between board and Definition of Done
  - Between roadmap board and DoD section
  - Opacity: 0.9
  - Margin: 14px 0

---

## Asset Structure

```
asset/
├── bg-grid.svg          # Background grid pattern (tools page)
├── divider-wave.svg      # Section divider wave
├── hero-aurora.svg       # Hero banner graphic
├── icon-about.svg       # About page icon
├── icon-downloads.svg   # Downloads page icon
├── icon-listen.svg      # Listen page icon
├── icon-projects.svg    # Projects page icon
├── icon-tools.svg       # Tools page icon
└── logo-signal.svg      # Logo variant
```

**Note:** Assets are copied from `asset/` folder to `assets/` in the Docker container.

---

## Implementation Details

### Hero Banners
- **Home page:** Full-width banner above hero cards
- **About page:** Smaller banner (max-height: 180px) at top of hero section

### Icons
- All icons are 24x24px
- Positioned in the brand section of the header
- Opacity: 0.9 for subtle appearance
- Margin-right: 8px for spacing

### Divider Waves
- Used to separate major sections
- Full width (100%)
- Opacity: 0.9
- Margin: 14px 0 (top and bottom)

### Background Grid
- Very faint overlay (opacity: 0.06)
- Fixed position using `body::before` pseudo-element
- Background size: 120px 120px
- Non-interactive (pointer-events: none)
- Z-index: 0 (behind content)

---

## CSS Styling

### Divider Wave
```html
<img src="assets/divider-wave.svg" alt="" style="width:100%;height:auto;opacity:.9;margin:14px 0;">
```

### Hero Banner (Home)
```html
<div style="margin:-20px -18px 20px -18px;width:calc(100% + 36px);max-width:none;">
  <img src="assets/hero-aurora.svg" alt="" style="width:100%;height:auto;opacity:.85;display:block;">
</div>
```

### Hero Banner (About - Smaller)
```html
<div style="margin:-20px -18px 16px -18px;width:calc(100% + 36px);max-width:none;">
  <img src="assets/hero-aurora.svg" alt="" style="width:100%;height:auto;opacity:.75;display:block;max-height:180px;object-fit:cover;">
</div>
```

### Icon in Header
```html
<img src="assets/icon-[name].svg" alt="" style="width:24px;height:24px;margin-right:8px;opacity:.9;">
```

### Background Grid (Tools)
```css
body::before{
  content:"";
  position:fixed;
  inset:0;
  background:url('assets/bg-grid.svg') repeat;
  background-size:120px 120px;
  opacity:0.06;
  pointer-events:none;
  z-index:0;
}
```

---

## Testing

### Verify Assets Load
1. Rebuild container: `docker-compose up -d --build`
2. Check each page:
   - Home: Hero banner visible above cards
   - About: Hero banner + divider wave visible
   - Downloads: Icon in header + divider before vault
   - Tools: Icon in header + faint grid background
   - Projects: Icon in header + divider between board and DoD

### Check Asset Paths
All assets should be accessible at:
- `http://localhost:5301/assets/[filename].svg`

---

## Notes

- All SVG images use inline styles for consistency
- Opacity values are tuned for visual balance
- Background grid is very subtle (0.06 opacity) to not distract
- Icons are sized appropriately for header context
- Divider waves provide visual separation without being intrusive

---

**Last Updated:** 2025-01-15  
**Version:** 1.0
