#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *
#import "@preview/xarrow:0.4.0": *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.bw,  
    styles: ergo-styles.basic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Math 237B Final",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(a)")

= ND//1
#problem[
  Let $X xarrow(f) Y xarrow(g) Z$ be morphisms of schemes such that $g compose f$ is proper, $g$ is quasi-projective and $f$ is surjective. Prove or disprove that $g$ is proper.

  \ 

  #line(length: 100%)

  \ 
][]

#pagebreak()

= ND//2

#problem[
  Let $f:X->S$ and $g:Y->S$ be projective morphisms. Prove or disprove that the projection map $X times_S Y -> S$ is projective.

  \ 

  #line(length: 100%)

  \ 
][
  I think the idea should be false, take $X=Y=PP^1_k$ and $S=Spec(k)$ (for any field $k$, for simplicity say $k=overline(k)$), then the fibre product $X times_S Y$ should be $PP^1_k times_k PP^1_k$, which is not projective I believe (if tere exists a closed immersion into $PP^n_k$)
]

#pagebreak()

= ND//3

#problem[
  Let $f:X->Y$ be a morphism of separated scheme of finite type over a Noetherian scheme $S$. Let $Z subset X$ be a closed subscheme which is proper over $S$. Show that $f(Z)$ is closed in $Y$.

  \ 

  #line(length: 100%)

  \ 
][]

#pagebreak()

= ND//4
#problem[
  Let $k$ be a field and let $R=k[X,Y,Z]\/I$, where $I=(X-Y Z,X Z-Y^2)$. Let $W=Spec(R)$.
  + Is $W$ a reduced scheme? Justify your answer.
  + Is $W$ irreducible? If not, what are its irreducible components?
  + Prove or disprove that $X$ has infinitely many rational points if $k$ is infinite (recall that a point $x in X$ is called rational point if the canonical map $k->k(x)$ is an isomorphism, where $k(x)$ is the residue field of the local ring $cal(O)_(X,x)$).

  \ 

  #line(length: 100%)

  \ 
][]

#pagebreak()

= ND//5
#problem[
  Let $f:X->Y$ be a surjective morphism between two schemes which are finite type and separated integral schemes over a field. Assume that $X$ is an affine scheme. Prove or disprove that $Y$ is an affine scheme if and only if it is a quasi-affine scheme.
][
  It's clear that affine $==>$ quasi-affine (regardless of the situation). So, the converse is the actual nontrivial part to prove / disprove
]



