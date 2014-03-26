# coding: utf-8
module ApplicationHelper
  def get_favicon(url)
    return image_tag 'https://plus.google.com/_/favicon?domain='+url
  end
end
