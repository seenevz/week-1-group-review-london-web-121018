# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require "pry"

class User
  attr_reader :name



  def initialize(name)
    @name = name
  end

  def photos
      Photo.photos.select {|photo| photo.user == @name}
  end

end

class Photo
  attr_reader :user


  @@photos = []

  def initialize

  end

  def self.photos
    @@photos
  end

  def user=(user)
    @user = user
    @@photos << self
  end

  def comments
    Comment.all.select {|comment| comment.user.name == self.user.name}
  end

  def make_comment(comment)
    comment = Comment.new(comment, @user)
    comment
  end

end

class Comment
  attr_accessor :comment, :user
  @@all = []

  def initialize(comment, user)
    @comment = comment
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end





sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name

# => "Sophie"

#user.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

binding.pry
Comment.all
#=> [#<Comment:0x00007fae28043700>]
