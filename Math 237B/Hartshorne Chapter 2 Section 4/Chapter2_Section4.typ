#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)
#show: ergo-init.with(
    colors: ergo-colors.penumbra-light,  
    styles: ergo-styles.classic, 
    breakable: true,
    inline-qed: true
)

//start document
#maketitle(
  title: "Hartshorne Chapter 2 Section 3: Separated / Proper",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= Separatedness//1

#definition[Diagonal Morphism][
  Given $f:X->Y$ a morphism of schemes. The #text(weight: "bold")[Diagonal morphism] is the unique morphism $Delta_X:X->X times_Y X$ that satisfies the following commutative diagram:
  #set align(center)
  #diagram($
             X edge("dr","..>", script(Delta_X)) edge("drr",->, script(id_X), bend: #20deg)edge("ddr",->, script(id_X), bend: #(-20deg)) \
             & X times_Y X edge("d",->, script(f')) edge(->, script(f')) & X edge("d",->,script(f), #left)\
             & X edge(->,script(f),#right) & Y
           $)
  #set align(left)
]
Then:
#definition[Separated Morphism][
  $f:X->Y$ is #text(weight: "bold")[Separated] if the diagonal morphism $Delta_X$ is a closed immersion. $X$ is then said to be #text(weight: "bold")[separated over $Y$].

  $X$ is called a #text(weight: "bold")[Separated Scheme] if it is separated over $Spec(ZZ)$ the final object.
]

About affine schemes:
#proposition[
  Any morphism of affine schemes $f:X=Spec(B)->Y=Spec(A)$ is separated.
][
  In this case, since one has $f^\#:A->B$ realizing $B$ as an $A$-algebra, then $X times_Y X tilde.equiv Spec(B tensor_A B)$. In particular, with identity $id_X:X->X$ reversing to $id_B:B->B$, the diagonal morphism $Delta_X:X -> X times_Y X$ reverses to $Delta_X^*:B tensor_A B -> B$, that satisfies the following:
  #set align(center)
  #diagram($
             & B edge("d",->, script(iota), #left) edge("ddr",->, script(id_B), bend: #20deg) \
             B edge(->, script(iota), #right)edge("drr",->,script(id_B), bend: #(-20deg)) & B tensor_A B edge("dr","..>", script(Delta_X^*)) \ 
             && B
           $)
  #set align(left) 
  An explicit dexcription is $Delta_X^*(a tensor a') = a a'$. Since this is a surjective ring homomorphism, one realizes $B tilde.equiv B tensor_A B\/I$ for some ideal $I subset.eq B tensor_A B$. In particular, as affine schemes one has $Spec(B) tilde.equiv V(I) arrow.hook Spec(B tensor_A B)$ using the diagonal morphism.
]

\ 

Some review of valuation rings:
#definition[Valuation of a Field][
  Let $k$ be a field, and $G$ a totally ordered abelian group (for instance $G=ZZ$ is a common one). A #text(weight: "bold")[valuation] of $k$ with values in $G$ is a map $v:K\\{0}-> G$, such that for any nonzero $x,y in k$, one has:
  1. $v(x y)=v(x)+v(y)$
  2. $v(x+y)>= min{v(x),v(y)}$
]
#definition[Valuation ring of a Field][
  Given a field $k$ together with a valuation $v:k\\{0}->G$, let $R = {x in k\\{0} | v(x)>=0} union {0}$. Notice that $R$ is a ring:
  - Since $v(1) = v(1 dot 1) = v(1)+v(1)$, then $v(1)=0$, so $1 in R$. $0 in R$ is given. As a side note, since $0=v(1) = v((-1)^2) = v(-1)+v(-1)$, then one has $v(-1)=-v(-1)$ (if order of any nontrivial element is not 2, then we're good, since it implies $v(-1)=0$).
  - Suppose $x,y in R$ (i.e. $v(x),v(y)>=0$), then $v(x+y)>= min{v(x),v(y)}>=0$, showing $x+y in R$; similarly, $v(x y)=v(x)+v(y)>=0$, showing $x y in R$.
  - Any $x in k\\{0}$ has $v(-x) = v((-1)x)=v(-1)+v(x)=v(x)>=0$, showing $-x in R$.

  Which, $R$ is a ring, and it's called the valuation ring of valuation $v$. If $k$ is a fraction field of $R$, then $R$ is a valuation ring of $k$ with (implicitly: with valuation $v$).
]

Which, it has a maximal ideal defined by $m := {x in R | v(x)>0}$, since any $x,y in m$ (with $x!=y$) has $v(x-y) >= min{v(x),v(-y)}>0$ (because $v(x),v(y)=v(-y)>0$), and any $x in R$, $y in m$ has $v(x y)= v(x)+v(y) > 0$ (because $v(y)>0$). so it an ideal. To verify it's a maximal ideal, notice that any nonzero element $x in R$ has $v(x)=0$ iff $v(x^(-1))=0$ (since $v(1)= v(x x^(-1)) = v(x)+v(x^(-1))$) iff $x$ is invertible in $R$. As a result, one has all element $x in R\\m$ being invertible, which $R,m$ forms a local ring.

(for more information, check Atiyah-Macdonald, and also Hartshorne Chapter 1 Section 6).

\ 

The valuative criterion:
#theorem("Valuative Criterion of Separatedness")[
  Let $f:X->Y$ be a morphism of schemes, with assumption $X$ is Noetherian, then $f$ is separated iff the following holds:
  - for any valuation ring $R$ with fraction field $K$, let $T=Spec(R)$, $U=Spec(K)$, let $j:U->T$ be the morphism induced by the inclusion $R arrow.hook K$ (which brings $U={*}$ to the generic point of $T$, namely the zero ideal). Then, given any morphism $alpha:T->Y$ and morphism $alpha':U->X$ such that the following diagram commutes:
  #set align(center)
  #diagram($
             U edge("d",->, script(j)) edge(->, script(alpha')) & X edge("d",->, script(f), #left)\
             T edge("ur","..>") edge(->, script(alpha), #right) & Y
           $)
  #set align(left)
  Then, there exists at most one morphism $h:T->X$ making the whole diagram commutes.
][]
Introduce some lemma:
#lemma[
  With the notation of $R,K,U,T$:
  - Giving a morphism $U->K$ is equivalent to giving a point $x_1 in X$ and inclusion of fields $k(x_1) arrow.hook K$.
  - Giving a morphism $T->Y$ is equivalent to givign two points $x_0,x_1 in Y$, with $x_0$ being a specialization of $x_1$, and an inclusion $k(x_1) arrow.hook K$.
][]