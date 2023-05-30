module.exports = {
  content: [
    './_drafts/**/*.html',
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.md',
    './*.html',
  ],
  theme: {
    theme: {
      extend: {
        colors: {
          andhash_orange: "#CF9230",
          andhash_blue: "#3B60E4",
          andhash_orange_dark: "#F05D23",
          andhash_blue_dark: "#004E98",
        }
      },
    }
  },
  plugins: []
}
