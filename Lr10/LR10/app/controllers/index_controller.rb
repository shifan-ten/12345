require 'nokogiri'
require 'open-uri'

class IndexController < ApplicationController
  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output

  def input; end

  def output
    api_response = open(@url)
    # Если делать XML -> HTML на сервере.
    if @side == 'server'
      @result = xslt_transform(api_response).to_html
    # Если делать XML -> HTML в браузере.
    elsif @side == 'client-with-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    # Если вообще ничего не делать.
    else
      render xml: api_response
    end
  end

  private

  # Вспомогательные константы (freeze рекомендуется делать, чтобы получить неизменяемую строку).

  # Куда шлем запрос.
  BASE_API_URL           = 'http://localhost:3000/?format=xml'.freeze
  # Откуда берем XSLT для преобразования на стороне сервера
  # (тут нужен обычный путь, Rails.root - путь к каталгу приложения).
  XSLT_SERVER_TRANSFORM  = "#{Rails.root}/public/server_transform.xslt".freeze
  # Откуда браузер должен брать XSLT. Это подставится к localhost:3001. Именно так грузятся файлы из public.
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'.freeze


  def parse_params
    @n = params[:n]
    @side = params[:side]
  end

  def prepare_url
    @url = BASE_API_URL + "&n=#{@n}"
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end
end
