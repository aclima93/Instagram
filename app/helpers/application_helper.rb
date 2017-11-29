module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(post)
    image_url = if post.image.exists?
                  post.image.url(:medium)
                else
                  'http://via.placeholder.com/350x150'
                end
    p image_url
    image_tag image_url, id: 'image-preview', class: 'img-responsive'
  end
end
