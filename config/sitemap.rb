# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://gkcck.ru"
SitemapGenerator::Sitemap.compress = false # :all_but_first

SitemapGenerator::Sitemap.create do
  add about_path
  add privacy_path, priority: 0.3
  add contact_path, priority: 0.3

  add activities_path, priority: 0.7, changefreq: 'daily'
  Activity.published.find_each do |item|
    add activity_path(item), lastmod: item.updated_at
  end

  add targets_path, priority: 0.7, changefreq: 'daily'
  Target.published.find_each do |item|
    add target_path(item), lastmod: item.updated_at
  end

  add permits_path, priority: 0.7, changefreq: 'daily'
  Permit.published.find_each do |item|
    add permit_path(item), lastmod: item.updated_at
  end
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
