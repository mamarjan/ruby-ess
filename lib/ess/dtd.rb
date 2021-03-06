require 'ess/postprocessing'

module ESS
  module DTD
    include ESS::Postprocessing

    BASIC_ELEMENT = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsNotNull.new ]
    }

    DESCRIPTION = {
      :attributes => nil,
      :tags => nil,
      :postprocessing_text => [ StripSpecificHTMLTags.new ]
    }

    BASIC_TIME = {
      :attributes => nil,
      :tags => nil,
      :postprocessing_text => [ ProcessTime.new ]
    }

    EMAIL = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsValidEmail.new ]
    }

    URL_ELEMENT = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsValidURL.new ]
    }

    LATITUDE = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsValidLatitude.new ]
    }

    LONGITUDE = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsValidLongitude.new ]
    }

    COUNTRY_CODE = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsValidCountryCode.new ]
    }

    CURRENCY = {
      :attributes => nil,
      :tags => nil,
      :validation => [ TextIsValidCurrency.new ]
    }

    TAGS = {
      :attributes => nil,
      :tags => { :tag => { :dtd => BASIC_ELEMENT,
                           :mandatory => true,
                           :max_occurs => :inf }
      }
    }

    CATEGORY_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_values => [
                                          'award',
                                          'competition',
                                          'commemoration',
                                          'conference',
                                          'concert',
                                          'diner',
                                          'entertainment',
                                          'cocktail',
                                          'course',
                                          'exhibition',
                                          'family',
                                          'friends',
                                          'festival',
                                          'meeting',
                                          'networking',
                                          'party',
                                          'seminar',
                                          'theme'] },
                       :priority => { :mandatory => false,
                                      :max_occurs => 1 } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :id   => { :dtd => BASIC_ELEMENT,
                            :mandatory => false,
                            :max_occurs => 1 }
      }
    }

    CATEGORIES = {
      :attributes => nil,
      :tags => { :item => { :dtd => CATEGORY_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    DATE_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_values => [
                                          "standalone",
                                          "recurrent",
                                          "permanent" ] },
                       :unit => { :mandatory => false,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'hour','day','week','month','year'] },
                       :limit => { :mandatory => false,
                                   :max_occurs => 1 },
                       :interval => { :mandatory => false,
                                      :max_occurs => 1 },
                       :selected_day => { :mandatory => false,
                                          :max_occurs => 1,
                                          :valid_values => [
                                            'number','monday','tuesday',
                                            'wednesday','thursday','friday',
                                            'saturday','sunday'] },
                       :selected_week => { :mandatory => false,
                                           :max_occurs => 1,
                                           :valid_values => [
                                             'first','second','third',
                                             'fourth','last' ] } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :start => { :dtd => BASIC_TIME,
                             :mandatory => true,
                             :max_occurs => 1 },
                 :duration => { :dtd => BASIC_ELEMENT,
                                :mandatory => false,
                                :max_occurs => 1 }
      }
    }

    DATES = {
      :attributes => nil,
      :tags => { :item => { :dtd => DATE_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    PLACE_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'fixed','area','moving','virtual'] },
                       :moving_position => { :mandatory => false,
                                             :max_occurs => 1 },
                       :priority => { :mandatory => false,
                                      :max_occurs => 1 } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :country_code => { :dtd => COUNTRY_CODE,
                                    :mandatory => false,
                                    :max_occurs => 1 },
                 :country => { :dtd => BASIC_ELEMENT,
                               :mandatory => false,
                               :max_occurs => 1 },
                 :latitude => { :dtd => LATITUDE,
                                :mandatory => false,
                                :max_occurs => 1 },
                 :longitude => { :dtd => BASIC_ELEMENT,
                                 :mandatory => false,
                                 :max_occurs => 1 },
                 :address => { :dtd => BASIC_ELEMENT,
                               :mandatory => false,
                               :max_occurs => 1 },
                 :city => { :dtd => BASIC_ELEMENT,
                            :mandatory => false,
                            :max_occurs => 1 },
                 :zip => { :dtd => BASIC_ELEMENT,
                           :mandatory => false,
                           :max_occurs => 1 },
                 :state => { :dtd => BASIC_ELEMENT,
                             :mandatory => false,
                             :max_occurs => 1 },
                 :state_code => { :dtd => BASIC_ELEMENT,
                                  :mandatory => false,
                                  :max_occurs => 1 },
                 :medium_name => { :dtd => BASIC_ELEMENT,
                                   :mandatory => false,
                                   :max_occurs => 1 },
                 :medium_type => { :dtd => BASIC_ELEMENT,
                                   :mandatory => false,
                                   :max_occurs => 1,
                                   :valid_values => [
                                         'television','radio','internet'] },
                 :kml => { :dtd => BASIC_ELEMENT,
                           :mandatory => false,
                           :max_occurs => 1 }
      }
    }

    PLACES = {
      :attributes => nil,
      :tags => { :item => { :dtd => PLACE_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    PRICE_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'standalone','recurrent'] },
                       :mode => { :mandatory => false,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'fixed','free','invitation',
                                    'renumerated','prepaid'] },
                       :unit => { :mandatory => false,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'hour','day','week','month','year'] },
                       :limit => { :mandatory => false,
                                   :max_occurs => 1 },
                       :interval => { :mandatory => false,
                                      :max_occurs => 1 },
                       :selected_day => { :mandatory => false,
                                          :max_occurs => 1,
                                          :valid_values => [
                                            'number','monday','tuesday',
                                            'wednesday','thursday','friday',
                                            'saturday','sunday'] },
                       :selected_week => { :mandatory => false,
                                           :max_occurs => 1,
                                           :valid_values => [
                                             'first','second','third',
                                             'fourth','last'] },
                       :priority => { :mandatory => false,
                                      :max_occurs => 1 } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :value => { :dtd => BASIC_ELEMENT,
                             :mandatory => true,
                             :max_occurs => 1 },
                 :currency => { :dtd => CURRENCY,
                                :mandatory => false,
                                :max_occurs => 1 },
                 :start => { :dtd => BASIC_TIME,
                             :mandatory => false,
                             :max_occurs => 1 },
                 :duration => { :dtd => BASIC_ELEMENT,
                                :mandatory => false,
                                :max_occurs => 1 },
                 :uri => { :dtd => URL_ELEMENT,
                           :mandatory => false,
                           :max_occurs => 1 }
      }
    }

    PRICES = {
      :attributes => nil,
      :tags => { :item => { :dtd => PRICE_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    MEDIA_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'image','sound','video','website'] },
                       :priority => { :mandatory => false,
                                      :max_occurs => 1 } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :uri => { :dtd => URL_ELEMENT,
                           :mandatory => true,
                           :max_occurs => 1 }
      }
    }

    MEDIA = {
      :attributes => nil,
      :tags => { :item => { :dtd => MEDIA_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    PEOPLE_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_values => [
                                    'organizer','performer','attendee',
                                    'social','author','contributor'] },
                       :priority => { :mandatory => true,
                                      :max_occurs => 1 } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :id => { :dtd => BASIC_ELEMENT,
                          :mandatory => false,
                          :max_occurs => 1 },
                 :firstname => { :dtd => BASIC_ELEMENT,
                                 :mandatory => false,
                                 :max_occurs => 1 },
                 :lastname => { :dtd => BASIC_ELEMENT,
                                :mandatory => false,
                                :max_occurs => 1 },
                 :organization => { :dtd => BASIC_ELEMENT,
                                    :mandatory => false,
                                    :max_occurs => 1 },
                 :logo => { :dtd => URL_ELEMENT,
                            :mandatory => false,
                            :max_occurs => 1 },
                 :icon => { :dtd => URL_ELEMENT,
                            :mandatory => false,
                            :max_occurs => 1 },
                 :uri => { :dtd => URL_ELEMENT,
                           :mandatory => false,
                           :max_occurs => 1 },
                 :address => { :dtd => BASIC_ELEMENT,
                               :mandatory => false,
                               :max_occurs => 1 },
                 :city => { :dtd => BASIC_ELEMENT,
                            :mandatory => false,
                            :max_occurs => 1 },
                 :zip => { :dtd => BASIC_ELEMENT,
                           :mandatory => false,
                           :max_occurs => 1 },
                 :state => { :dtd => BASIC_ELEMENT,
                             :mandatory => false,
                             :max_occurs => 1 },
                 :state_code => { :dtd => BASIC_ELEMENT,
                                  :mandatory => false,
                                  :max_occurs => 1 },
                 :country => { :dtd => BASIC_ELEMENT,
                               :mandatory => false,
                               :max_occurs => 1 },
                 :country_code => { :dtd => COUNTRY_CODE,
                                    :mandatory => false,
                                    :max_occurs => 1 },
                 :email => { :dtd => BASIC_ELEMENT,
                             :mandatory => false,
                             :max_occurs => 1 },
                 :phone => { :dtd => BASIC_ELEMENT,
                             :mandatory => false,
                             :max_occurs => 1 },
                 :minpeople => { :dtd => BASIC_ELEMENT,
                                 :mandatory => false,
                                 :max_occurs => 1 },
                 :maxpeople => { :dtd => BASIC_ELEMENT,
                                 :mandatory => false,
                                 :max_occurs => 1 },
                 :minage => { :dtd => BASIC_ELEMENT,
                              :mandatory => false,
                              :max_occurs => 1 },
                 :restriction => { :dtd => BASIC_ELEMENT,
                                   :mandatory => false,
                                   :max_occurs => 1 }
      }
    }

    PEOPLE = {
      :attributes => nil,
      :tags => { :item => { :dtd => PEOPLE_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    RELATION_ITEM = {
      :attributes => { :type => { :mandatory => true,
                                  :max_occurs => 1,
                                  :valid_vlaues => [
                                    'alternative','related','enclosure'] } },
      :tags => { :name => { :dtd => BASIC_ELEMENT,
                            :mandatory => true,
                            :max_occurs => 1 },
                 :uri => { :dtd => URL_ELEMENT,
                           :mandatory => true,
                           :max_occurs => 1 },
                 :id => { :dtd => BASIC_ELEMENT,
                          :mandatory => true,
                          :max_occurs => 1 }
      }
    }

    RELATIONS = {
      :attributes => nil,
      :tags => { :item => { :dtd => RELATION_ITEM,
                            :mandatory => true,
                            :max_occurs => :inf }
      }
    }

    FEED = {
      :attributes => nil,
      :tags =>  { :title => { :dtd => BASIC_ELEMENT,
                              :mandatory => true,
                              :max_occurs => 1,
                              :postprocessing => [ FeedTitle.new ] },
                  :id =>    { :dtd => BASIC_ELEMENT,
                              :mandatory => true,
                              :max_occurs => 1,
                              :postprocessing => [ FeedID.new ] },
                  :access => { :dtd => BASIC_ELEMENT,
                               :mandatory => true,
                               :max_occurs => 1,
                               :valid_values => ['PUBLIC','PRIVATE'] },
                  :description => { :dtd => DESCRIPTION,
                                    :mandatory => true,
                                    :max_occurs => 1 },
                  :published   => { :dtd => BASIC_TIME,
                                    :mandatory => true,
                                    :max_occurs => 1 },
                  :uri         => { :dtd => URL_ELEMENT,
                                    :mandatory => false,
                                    :max_occurs => 1,
                                    :postprocessing => [ FeedURI.new ] },
                  :updated     => { :dtd => BASIC_TIME,
                                    :mandatory => false,
                                    :max_occurs => 1 },
                  :tags        => { :dtd => TAGS,
                                    :mandatory => false,
                                    :max_occurs => 1 },
                  :categories  => { :dtd => CATEGORIES,
                                    :mandatory => true,
                                    :max_occurs => 1 },
                  :dates => { :dtd => DATES,
                              :mandatory => true,
                              :max_occurs => 1 },
                  :places => { :dtd => PLACES,
                               :mandatory => true,
                               :max_occurs => 1 },
                  :prices => { :dtd => PRICES,
                               :mandatory => false,
                               :max_occurs => 1 },
                  :media => { :dtd => MEDIA,
                              :mandatory => false,
                              :max_occurs => 1 },
                  :people => { :dtd => PEOPLE,
                               :mandatory => false,
                               :max_occurs => 1 },
                  :relations => { :dtd => RELATIONS,
                                  :mandatory => false,
                                  :max_occurs => 1 }
      }
    }

    CHANNEL = {
      :attributes => nil,
      :tags =>  { :title => { :dtd => BASIC_ELEMENT,
                              :mandatory => true,
                              :max_occurs => 1,
                              :postprocessing => [ ChannelTitle.new ] },
                  :link  => { :dtd => URL_ELEMENT,
                              :mandatory => true,
                              :max_occurs => 1,
                              :postprocessing => [ ChannelLink.new ] },
                  :id    => { :dtd => BASIC_ELEMENT,
                              :mandatory => true,
                              :max_occurs => 1,
                              :postprocessing => [ ChannelID.new ] },
                  :published => { :dtd => BASIC_TIME,
                                  :mandatory => true,
                                  :max_occurs => 1 },
                  :updated => { :dtd => BASIC_TIME,
                                :mandatory => false,
                                :max_occurs => 1 },
                  :generator => { :dtd => BASIC_ELEMENT,
                                  :mandatory => false,
                                  :max_occurs => 1 },
                  :rights =>   { :dtd => BASIC_ELEMENT,
                                 :mandatory => false,
                                 :max_occurs => 1},
                  :feed => { :dtd => FEED,
                             :mandatory => true,
                             :max_occurs => :inf }
      }
    }

    ESS = {
      :attributes => { :xmlns   => { :mandatory => true,
                                     :max_occurs => 1},
                       :version => { :mandatory => true,
                                     :max_occurs => 1},
                       :lang    => { :mandatory => true,
                                     :max_occurs => 1} },
      :tags => { :channel => { :dtd => CHANNEL,
                               :mandatory => true,
                               :max_occurs => 1 }
      }
    }

    class InvalidValueError < RuntimeError
    end
  end
end
