module Pref  where


-- i :: Integer 
-- i = 4

type Config = Integer
type Pref a = (Config -> a)

left' :: String -> Pref String 
left' s = \i -> repeatString i "< " ++ s


-- left' s = \i -> repeatString i "< " ++ s

right' :: String -> Pref String 
right' s = \i ->  s ++ repeatString i " > " 
-- g a -> Pref b   g:: a -> (config -> b)   config -> b 
composePref :: (b -> Pref c) -> (a -> Pref b) -> (a -> Pref c)
composePref f g x = \config -> let z = (g x) config in f z config


-- composePref :: (b -> Pref c) -> (a -> Pref b) -> (a -> Pref c)
-- composePref f g a = \config -> let b = (g a) config 
--                                in  (f b) config 

bracket' :: Config -> String -> String 
bracket' config s = (left'  `composePref` right') s config

--  <<< toto 
left :: String -> String 
left s = repeatString 3 "< " ++ s

--  toto >>>
right :: String -> String 
right s = s ++ repeatString 3 " > " 

repeatString :: Integer -> String -> String 
repeatString i s = if i <= 0
                then ""
                else s ++ repeatString (i-1) s 

-- <<< toto >>>
bracket :: String -> String 
bracket = left . right

