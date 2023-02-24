# Code to setup Google Analyitics

## Date:

13 Feb 2023

## Site: 

www.janyljumadinova.com

## Use at Netlify. Place in __Build Snippet_ under the _Build & deploy_ setting

```
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-18WYHLKCBH"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-18WYHLKCBH');
</script>
```

# add to the `config.toml` file. 
`googleAnalytics : "G-18WYHLKCBH"`

