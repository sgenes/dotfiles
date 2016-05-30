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
  [ local "/home/tama/.zsh/plugins/colors"
  , local "/home/tama/.zsh/plugins/key-bindings"
  , local "/home/tama/.zsh/plugins/extract"
  , local "/home/tama/.zsh/plugins/emoji"
  , local "/home/tama/.zsh/plugins/completion"
  , local "/home/tama/.zsh/plugins/compfix"
  , local "/home/tama/.zsh/plugins/misc"
  , local "/home/tama/.zsh/plugins/history"
  , local "/home/tama/.zsh/plugins/directories"
  , local "/home/tama/.zsh/plugins/grep"
  , local "/home/tama/.zsh/plugins/git"
  , local "/home/tama/.zsh/plugins/gitplugin"
  , local "/home/tama/.zsh/plugins/theme"
  , local "/home/tama/.zsh/plugins/terminal"
  , local "/home/tama/.zsh/plugins/bureau"
  , local "/home/tama/.zsh/plugins/custom"
  , local "/home/tama/.zsh/plugins/colored-man-pages"
  , local "/home/tama/.zsh/plugins/history-substring-search"
  , local "/home/tama/.zsh/plugins/fancy-ctrl-z"
  , local "/home/tama/.zsh/plugins/spectrum"
  , local "/home/tama/.zsh/plugins/per-directory-history"
  , local "/home/tama/.zsh/plugins/cp"
  , local "/home/tama/.zsh/plugins/copyfile"
  , local "/home/tama/.zsh/plugins/catimg"

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
