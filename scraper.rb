#!/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require 'scraperwiki'
require 'twitter_list'


abort "Need to set ENV['MORPH_TWITTER_TOKENS']" unless ENV.key? 'MORPH_TWITTER_TOKENS'
twitter_list = TwitterList::Scraper.new(twitter_tokens: ENV['MORPH_TWITTER_TOKENS'])

ScraperWiki.save_sqlite([:id], twitter_list.people('AssembleeNat', 'les-députés'))
