# Render the social card from the unchanged logo and editable text.
# Uses the Windows drawing library; no browser capture or external service.
Add-Type -AssemblyName System.Drawing
$siteRoot = Split-Path -Parent $PSScriptRoot
$logoPath = Join-Path $siteRoot 'static/icon-512.png'
$outputPath = Join-Path $siteRoot 'static/images/auridium-social.png'
$canvas = [System.Drawing.Bitmap]::new(1200, 630)
$graphics = [System.Drawing.Graphics]::FromImage($canvas)
$logo = [System.Drawing.Image]::FromFile($logoPath)
$headingFont = [System.Drawing.Font]::new('Arial', 68, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$bodyFont = [System.Drawing.Font]::new('Arial', 30, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$smallFont = [System.Drawing.Font]::new('Arial', 18, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$inkBrush = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#222820'))
$accentBrush = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#b94423'))
$mutedBrush = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#62675d'))
try {
    $graphics.Clear([System.Drawing.ColorTranslator]::FromHtml('#f6f6f0'))
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $graphics.DrawImage($logo, [System.Drawing.Rectangle]::new(65, 145, 340, 340))
    $graphics.DrawString('Auridium', $headingFont, $inkBrush, [System.Drawing.PointF]::new(465, 153))
    $graphics.DrawString('Technologies', $headingFont, $inkBrush, [System.Drawing.PointF]::new(465, 225))
    $graphics.DrawString('Automation and custom software', $bodyFont, $accentBrush, [System.Drawing.PointF]::new(468, 340))
    $graphics.DrawString('for small businesses.', $bodyFont, $accentBrush, [System.Drawing.PointF]::new(468, 382))
    $graphics.DrawString('Manchester, New Hampshire · Clients anywhere', $smallFont, $mutedBrush, [System.Drawing.PointF]::new(470, 456))
    $canvas.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
} finally {
    $graphics.Dispose(); $canvas.Dispose(); $logo.Dispose()
    $headingFont.Dispose(); $bodyFont.Dispose(); $smallFont.Dispose()
    $inkBrush.Dispose(); $accentBrush.Dispose(); $mutedBrush.Dispose()
}
