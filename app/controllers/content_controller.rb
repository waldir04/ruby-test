require_relative './../../lib/plays_list'

class ContentController < ApplicationController
  def index
    add_breadcrumb I18n.t('pages.content'), :root_path

    setPlays(PlaysList.new.get.list)
  end

  private
  def getPlaySortedByitle(play)
    play.sort_by( &:last )
  end

  private
  def setPlays(plays)
    @plays = getPlaySortedByitle(plays)
  end
end
