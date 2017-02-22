require 'spec_helper'

describe StampL10n do
  before :each do
    @date = Date.new(2011, 6, 9)
  end

  it 'should use old stamp method' do
    expect(@date.stamp('March 1, 1999')).to eq 'June 9, 2011'
    expect(@date.stamp('Jan 1, 1999')).to eq 'Jun 9, 2011'
    expect(@date.stamp('Jan 01')).to eq 'Jun 09'
    expect(@date.stamp('Sunday, May 1, 2000')).to eq 'Thursday, June 9, 2011'
    expect(@date.stamp('Sun Aug 5')).to eq 'Thu Jun 9'
    expect(@date.stamp('12/31/99')).to eq '06/09/11'
    expect(@date.stamp('DOB: 12/31/2000')).to eq 'DOB: 06/09/2011'
  end

  it 'should use new localize stamp method' do
    expect(@date.locale_stamp('March 1, 1999')).to eq 'Czerwiec 9, 2011'
    expect(@date.locale_stamp('Jan 1, 1999')).to eq 'cze 9, 2011'
    expect(@date.locale_stamp('Jan 01')).to eq 'cze 09'
    expect(@date.locale_stamp('Sunday, May 1, 2000')).to eq 'czwartek, Czerwiec 9, 2011'
    expect(@date.locale_stamp('Sun Aug 5')).to eq 'czw cze 9'
    expect(@date.locale_stamp('12/31/99')).to eq '06/09/11'
    expect(@date.locale_stamp('DOB: 12/31/2000')).to eq 'DOB: 06/09/2011'
  end

  it 'should be able to specify locale option on method call' do
    expect(@date.locale_stamp('March 1, 1999', 'en')).to eq 'June 9, 2011'
    expect(@date.locale_stamp('March 1, 1999', 'de')).to eq 'Juni 9, 2011'
  end
end
