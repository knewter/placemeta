require 'dragonfly'

app = Dragonfly[:images]
app.configure do |c|
  c.allow_fetch_url = true
end
app.configure_with(:imagemagick)
app.configure_with(:rails)
