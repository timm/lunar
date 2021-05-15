#!/usr/bin/env moon
moon=require "moon"
col=require "col"
lib=require "liblua"

egs={}
egs.all= -> [f() for k,f in pairs egs when k!="all"]

egs.sym = ->
  s=col.Sym!
  s\adds {"a", "a", "a", "a", "b", "b", "c"}
  assert 4==s.all.a
  print s\ent()

egs.cols = ->
  it = col.Cols {"A?" ,"B","C-"}
  assert #it.ys == 1
  assert it.ys[1].w == -1
  assert #it.xs == 1
  assert #it.all == 3

egs.data = ->
  t=col.Data!
  for x in col.csv("../etc/data/auto93.csv")
    t\add x
  lib.oo(t.rows[1])
  
--egs.all()
egs.data()
