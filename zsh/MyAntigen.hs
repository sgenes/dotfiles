{-# LANGUAGE OverloadedStrings #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , local
              , antigen
                -- If you want to source a bit trickier plugins
              , ZshPlugin (..)
              , antigenSourcingStrategy
              , filePathsSourcingStrategy
              )

bundles =
  [ local "/home/shinzjr/.zsh/plugins/colors"
  , local "/home/shinzjr/.zsh/plugins/key-bindings"
  , local "/home/shinzjr/.zsh/plugins/extract"
  -- , local "/home/shinzjr/.zsh/plugins/emoji"
  , local "/home/shinzjr/.zsh/plugins/completion"
  , local "/home/shinzjr/.zsh/plugins/misc"
  , local "/home/shinzjr/.zsh/plugins/history"
  , local "/home/shinzjr/.zsh/plugins/directories"
  , local "/home/shinzjr/.zsh/plugins/grep"
  , local "/home/shinzjr/.zsh/plugins/nvm"
  , local "/home/shinzjr/.zsh/plugins/theme"
  , local "/home/shinzjr/.zsh/plugins/terminal"
  , local "/home/shinzjr/.zsh/plugins/bureau"
  , local "/home/shinzjr/.zsh/plugins/custom"
  , local "/home/shinzjr/.zsh/plugins/colored-man-pages"
  , local "/home/shinzjr/.zsh/plugins/history-substring-search"
  , local "/home/shinzjr/.zsh/plugins/fancy-ctrl-z"
  -- , local "/home/shinzjr/.zsh/plugins/spectrum"
  , local "/home/shinzjr/.zsh/plugins/catimg"
  , local "/home/shinzjr/.zsh/plugins/zsh-autosuggestions"
  , local "/home/shinzjr/.zsh/plugins/virtualenvwrapper"
  -- , local "/home/shinzjr/.zsh/plugins/autoenv"

  -- If you use a plugin that doesn't have a *.plugin.zsh file. You can set a
  -- more liberal sourcing strategy.
  --
  -- , (bundle "some/stupid-plugin") { sourcingStrategy = antigenSourcingStrategy }

  -- If you use a plugin that has sub-plugins. You can specify that as well
  --
  -- NOTE: If you want to use oh-my-zsh for real (please don't), you still need
  -- to set the $ZSH env var manually.
  -- , (bundle "robbyrussell/oh-my-zsh")
  --    { sourcingLocations = [ "plugins/wd"
  --                          , "plugins/colorize"] }

  -- Sourcing a list of files
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = filePathsSourcingStrategy
  --                          [ "vi/zle_vi_visual.zsh"
  --                          , "pytest/pytest.plugin.zsh"
  --                          ] }

  -- Alternatively, this way will give you the same result
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = antigenSourcingStrategy
  --    , sourcingLocations = [ "vi"
  --                          , "pytest"
  --                          ] }

  -- vvv    Add your plugins here    vvv
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
