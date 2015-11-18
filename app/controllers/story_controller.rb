# Rewsly (It's basically a blog)

####App Description

# The City Times needs an app and has hired BEWD students to build it. They want to enter the 21st century and move their print newspaper online.

# You will build Rewsly during lesson 11 & 12.

#s####Time: 60 min

# Here are the features needed by next class.

# For now City times is only interested in linking to other news sources instead of writing their own news.

# * The front page welcomes visitors "Welcome to Rewsly" and list all titles in the stories table.
# * Visitors can view a story's upvotes, category and link to more details by clicking on the title from the front page.
# * Visitors can search for a specific story by title and category from the front page.
# * Visitors can add stories to the database if all fields are present.
#   * Prevent visitors from saving a record if it has errors.


# We've supplied you with [story seeds](story_seeds.rb).

# __Bonus__

# * Only display stories with 4 or more upvotes on the front page.
# * Only display stories created today on the front page.

# Remember, Google is your friend!

# Happy coding :)

class StoryController < ApplicationController

  before_action :load_story, only: [:edit, :show, :update]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(safe_story_params)
    if @story.save
        redirect_to @story
    else
        render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private
    def safe_story_params
      params.require('story').permit(:title, :link, :upvotes, :category)
    end
    
    def load_story
      @story = Story.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash.now[:notice] = "Invalid Story #{params[:id]}"
      redirect_to root_path
    end
  
end