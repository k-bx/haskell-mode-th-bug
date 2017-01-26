{-# LANGUAGE TemplateHaskell #-}

module BaseLib where

import Data.ByteString (ByteString)
import Data.FileEmbed

foo :: ByteString
foo = $(embedFile "data/file.txt")
