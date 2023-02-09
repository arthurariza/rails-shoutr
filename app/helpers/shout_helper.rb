module ShoutHelper
  def analyze(text)
    text
      .gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..]) }.html_safe
  end
end
