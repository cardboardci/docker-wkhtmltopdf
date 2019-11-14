# wkHtmltoPDF Docker Image

Convert HTML to PDF using Webkit (QtWebKit)

## Usage

```bash
docker run -v `pwd`:/workspace cardboardci/${NAME} wkhtmltopdf --page-size A4 index.html output.pdf
```
