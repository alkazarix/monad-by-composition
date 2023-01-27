module Failure where

type HttpRequest = String
type HttpResp = String 

type Error = String

data Result  a = Ok a | Err Error
 deriving(Show)

data User = User {
    name:: String
}

parseHttpRequest :: HttpRequest -> User 
parseHttpRequest userName = User { name = userName}

updateUser :: User -> HttpResp 
updateUser  = name


parseHttpRequest' :: HttpRequest -> Result User 
parseHttpRequest' "guillaume" =  Err "invalid User"
parseHttpRequest' userName =  Ok ( User { name = userName})

updateUser' :: User -> Result HttpResp 
updateUser' User { name = "azam"} = Err "already exist user."
updateUser' user = Ok (name user)

handler :: HttpRequest -> HttpResp
handler = updateUser . parseHttpRequest

composeErr' :: (b -> Result c) -> (a -> Result b) -> (a -> Result c)
composeErr' f g x = case g x of 
    Ok u -> f u 
    Err e -> Err e





composeErr :: (b -> Result c) -> (a -> Result b) -> (a -> Result c)
composeErr f g x = case g x of
    Err e -> Err e 
    Ok y -> f y 
