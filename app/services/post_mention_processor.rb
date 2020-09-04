class PostMentionProcessor
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def mentions
    mentions = post.content.scan(/[@^]\w+/)
    User.where(username: mentions.collect{|m| m.gsub("@", "")})
  end

  def process_mentions
    mentioned_users = mentions

    mentioned_users.uniq.each do |user|
      mention = post.mentions.find_or_initialize_by(mentioned: user)
      mention.save
    end
  end
end