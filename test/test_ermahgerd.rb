require 'minitest/autorun'
require 'ermahgerd'

describe Ermahgerd do

  def trans(src)
    Ermahgerd.translate(src)
  end

  it 'can translate some basic phrases' do
    trans('Goosebumps, my favorite books!').must_equal 'GERSBERMS, MAH FRAVRIT BERKS!'
    trans('I love chocolate').must_equal 'I LERV CHERCERLERT'
    trans('I love pancakes!').must_equal 'I LERV PERNCERKS!'
    trans('bananas are awesome.').must_equal 'BERNERNERS ER ERSUM.'
    trans('Mashed potatoes, my favorite!').must_equal 'MAHSHERD PERTERTERS, MAH FRAVRIT!'
  end

end
