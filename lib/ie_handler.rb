# -*- encoding: UTF-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'win32OLE'

module IeHandler
  VERSION = '0.0.7'

  class IePage
    IE_APP = "InternetExplorer.Application"
    
    attr_accessor :doc, :ie

    #instance methods
    def initialize url
      @ie = WIN32OLE.new(IE_APP)
      go url
      @doc = @ie.document
    end
    
    #wait during loading
    def wait
      while @ie.Busy == true
        sleep 1
      end
    end
    
    #move to the specified url
    def go url, visible = true
      @ie.Navigate(url)
      @ie.Visible=visible
      wait
    end
    
    def back
      @ie.GoBack
      wait
    end
    
    def close
      @ie.Quit
    end
    
    #initalization. this is configulation which you should ie.find 
    #when you access DOM.
    def find
      @doc = @ie.document
      @start = nil
      self
    end
    
    #Saved Access
    #Save ie object 
    #ex) save tr and use td using saved tr object.
    def sa
      unless @start
        @start = @doc
      else
        @doc = @start
      end
      self
    end
      
    def each
      yield self unless @doc.respond_to?(:each)
      @doc.each do |d|
        obj = self.clone
        obj.ie = @ie
        obj.doc = d
        yield obj
      end
    end
      
    #accessor methods map
    @accessor = {
      :id => :getElementById,
      :tag => :getElementsByTagName,
      :name => :getElementsByName,
      :clazz => :getElementsByClassName
    }
    #id,tag,name,clazz method dinamic definition
    @accessor.each do |name, method|
      define_method name do |elem, item_num=nil|
        return nil if @doc.nil?
        items = @doc.send(method, elem)
        @doc = (!! item_num) ? items.item(item_num) : items
        self
      end
    end
      
    def click
      @doc.click nil
      wait
    end
    
    def html content=nil
      if content
        @doc.appendChild(@ie.document.createTextNode(content))
      else
        @doc.innerHTML
      end
    end
    
    #DOM new element addition
    def add obj
      @doc.appendChild(obj.doc)
    end
    
    def attr name, value=nil
      unless value
        @doc.getAttribute(name)
      else
        @doc.setAttribute(name, value)
      end
    end
    
    #for inspect methods
    def methods search_word=nil
      mtds = @doc.ole_methods.map{|mtd| mtd.to_s}.sort
      mtds = mtds.grep search_word if search_word
      mtds
    end

    def method name
      @ie.ole_method_help(name).params.each do |param|
        str = ""
        str.concat "[in] " if param.input?
        str.concat "[out] " if param.output?
        str.concat "[optional] " if param.optional?
        str.concat "[retval] " if param.retval?
        str.concat param.name
        str.concat " = #{param.default}" if param.default
        str.concat " As #{param.ole_type}"
        puts str
      end
    end
    
    def method_missing(method_name, *args)
      @doc.send(method_name, *args)
    end
    
    #class methods
    class << self
      def make_elem ie_obj, elem_name
        obj = ie_obj.clone
        obj.doc = ie_obj.ie.document.createElement(elem_name)
        obj
      end
    end
  end
end
