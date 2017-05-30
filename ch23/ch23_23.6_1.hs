{-# LANGUAGE InstanceSigs #-}

newtype Moi s a =
  Moi { runMoi :: s -> (a, s) }

instance Functor (Moi s) where
  fmap :: (a -> b) -> Moi s a -> Moi s b
  fmap f (Moi g) = Moi $ \s -> let (a, b) = g s
                               in (f a, b)

--Prelude> runMoi ((+1) <$> (Moi $ \s -> (0, s))) 0
--(1,0)

instance Applicative (Moi s) where
  pure :: a -> Moi s a
  pure a = Moi $ \s -> (a, s)

  (<*>) :: Moi s (a -> b)
        -> Moi s a
        -> Moi s b
  (Moi f) <*> (Moi g) = Moi $ \s -> let (fab, s') = f s
                                        (a, b) = g s'
                                    in (fab a, b)

instance Monad (Moi s) where
  return = pure

  (>>=) :: Moi s a
        -> (a -> Moi s b)
        -> Moi s b
  (Moi f) >>= g = Moi $ \s -> let (a, s') = f s
                              in runMoi (g a) s'