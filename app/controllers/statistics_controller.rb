require_relative './../../lib/http_source'
require_relative './../../lib/play_analyzer'

class StatisticsController < ApplicationController
  add_breadcrumb I18n.t('pages.content'), :root_path

  def index
    add_breadcrumb I18n.t('pages.statistics'), :statistics_index_path
    @characters_with_number_lines = getData()
  end

  private
  def getData
    subject = getSubjectData()
    subject.characters_spoken_lines.sort
  end

  private
  def getSubjectData
    source_type =  HttpSource.new(params['play'])
    PlayAnalyzer.new(source_type)
  end
end
