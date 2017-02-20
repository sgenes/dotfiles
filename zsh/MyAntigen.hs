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
  [ local "/home/ramot/.zsh/plugins/zsh-autosuggestions"
  , local "/home/ramot/.zsh/plugins/key-bindings"
  -- , local "/home/ramot/.zsh/plugins/extract"
  -- , local "/home/ramot/.zsh/plugins/emoji"
  , local "/home/ramot/.zsh/plugins/misc"
  -- , local "/home/ramot/.zsh/plugins/zsh-autosuggestions"
  , local "/home/ramot/.zsh/plugins/history"
  , local "/home/ramot/.zsh/plugins/directories"
  , local "/home/ramot/.zsh/plugins/grep"
  , local "/home/ramot/.zsh/plugins/nvm"
  , local "/home/ramot/.zsh/plugins/theme"
  , local "/home/ramot/.zsh/plugins/terminal"
  , local "/home/ramot/.zsh/plugins/custom"
  , local "/home/ramot/.zsh/plugins/colored-man-pages"
  , local "/home/ramot/.zsh/plugins/fancy-ctrl-z"
  -- , local "/home/ramot/.zsh/plugins/spectrum"
  , local "/home/ramot/.zsh/plugins/catimg"
  , local "/home/ramot/.zsh/plugins/virtualenvwrapper"
  , local "/home/ramot/.zsh/plugins/rvm"
  , local "/home/ramot/.zsh/plugins/dircycle"
  , bundle "zsh-users/zsh-completions"
  , local "/home/ramot/.zsh/plugins/completion"
  , local "/home/ramot/.zsh/plugins/colors"
  , local "/home/ramot/.zsh/plugins/history-substring-search"
  , local "/home/ramot/.zsh/plugins/bureau"
  , local "/home/ramot/.zsh/plugins/thefuck"
  -- , bundle "mafredri/zsh-async"
  -- , bundle "sindresorhus/pure"


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
