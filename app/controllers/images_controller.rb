class ImagesController < ApplicationController
  def show
    app = Dragonfly[:images]
    num = rand(99)

    tag = request.subdomain || 'kitten'
    flickr_image = flickr.photos.search(:tags => tag)[num]
    flickr_info = flickr.photos.getInfo :photo_id => flickr_image['id']
    flickr_url = FlickRaw.url_b(flickr_info)

    input_image = app.fetch_url(flickr_url)
    image = input_image.thumb("#{params[:width]}x#{params[:height]}").jpg
    send_data image.data, :filename => 'foo.jpg', :disposition => 'inline', :type => 'image/jpeg'
  end
end
