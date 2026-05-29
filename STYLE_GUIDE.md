PRAVAAH Visual Style Guide

Purpose: Provide consistent visual language for the Trainer Portal UI.

Colors
- Primary: #0d6efd (Bootstrap primary)
- Accent: #0dcaf0 (cyan)
- Success: #198754 (green)
- Warning: #ffc107 (amber)
- Danger: #dc3545 (red)
- Muted text: #6c757d

Typography
- Base font: system UI / Inter / -apple-system, etc.
- Headings: font-weight 600, slight negative letter spacing
- Small: 0.875rem

Spacing
- Container padding: 1rem
- Card spacing: margin-bottom 1rem, card-body padding 1rem
- Left column width: 30% on desktop (col-md-4)

Badges & Buttons
- Use semantic badge colors for statuses (success/warning/danger/secondary)
- Buttons should use .btn-sm for density in lists

Accessibility
- Use semantic landmarks (role="region", aria-label) on dashboard sections
- Ensure interactive elements have aria-label or aria-controls where needed

Responsive
- Left column becomes non-sticky on small viewports
- Tables are wrapped in .table-responsive

Components
- Trainer profile card: photo, name, code, availability badge
- Batch list: title, course, dates, student count, status badge, action button

Notes
- Keep icons decorative (aria-hidden="true") and provide textual labels
- Keep color contrast >= 4.5:1 for text
