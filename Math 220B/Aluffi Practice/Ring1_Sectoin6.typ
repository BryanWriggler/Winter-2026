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
  title: "Aluffie Ring 1st Chapter Section 6",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

= 6.8//1
#problem[
  Let $R$ be a ring. If $A$ is any set, prove that $Hom_(RMod)(R^(plus.circle A),R)$ satisfies the universal property of the product $R^A$. So, in general $Hom_(RMod)(R^(plus.circle A),R) tilde.equiv.not R^(plus.circle A)$.
][
  First, let's define a projection: Given any $f in Hom_(RMod)(R^(plus.circle A),R)$, define the projection $p_a:R^(plus.circle A) arrow.r R$ by $p_a (f) = f(e_a)$ for all $a in A$. this is clearly a module homomorphism.

  Now, given any $M in RMod$, and for any $a in A$ it associates with a module homomorphism $phi_a:M arrow.r R$. Suppose $h:M arrow.r Hom_(RMod)(R^(plus.circle A),R)$ is a module homomorphism satisfying $p_a compose h = phi_a$ for all $a in A$, then for any $m in M$, one has the following:
  $ phi_a (m)=p_a compose h(m) = h(m)(e_a) $
  Which, $h(m):R^(plus.circle A)-> R$ satisfies $h(m)(e_a) = phi_a (m)$ for all $a in A$. This shows that "if $h(m)$ is well-defined", it is already uniquely determined (since it fixes all the basis elements on $R^(plus.circle A)$). As a result, $h$ is in fact uniquely determined (since it's determined for all $m in M$).

  \ 

  First question: Is $h(m)$ well-defined? Yes, because the maps only tells us how it behaves on the basis elements, but didn't talk about how these elements interact. Therefore, one can define $h(m)(sum r_a e_a) := sum r_a h(m)(e_a) = sum r_a phi_a (m)$, which is clearly well-defined as it is a finite sum. This also shows that $h(m)$ is a module homomorphism.

  \ 

  Second question: Is $h$ itself a module homomorphism? Yes, because one has the following:
  $ h(r m + s n)(e_a) = phi_a (r m+s n)= r dot phi_a (m)+s dot phi_a (n) = r dot h(m)(e_a)+s dot h(n)(e_a) $
  Hence, since it works on all the basis elements, one can say that $h(r m+s n)=r dot h(m)+s dot h(n)$ as module homomorphisms. So, $h$ is itself a module homomorphism.

  \ 

  Finally, this shows that $Hom_(RMod)((R^(plus.circle A)),R)$ is a product $R^A$, since it satisfies the following commutative diagram:

  #diagram($
              & M edge("dl",->,phi_a) edge("dr",->,phi_b) edge("d",->,"dashed", )\ 
              R_a & Hom_(RMod)(R^(plus.circle A),R) edge("l",->, p_a) edge(->, p_b) & R_b
           $)

  where the dashed line is the unique $h$ defined, and it's satisfied for all $a,b in A$.
]

#pagebreak()

= 6.9
#problem[
  Let $R$ be a ring, $F$ a nonzero free $R$-module, and let $phi:M -> N$ be a homomorphism of $R$-modules. Prove that $phi$ is surjective iff for all $R$-module homomorphism $alpha:F -> N$, there exists an $R$-module homomorphism $beta:F-> M$ such that $alpha = phi compose beta$, i.e. $F$ is projective.

  #diagram($
             M edge(->>,script(phi)) & N\ 
             F edge("ur",->,script(forall alpha)) edge("u", ->, script(exists beta))
           $)
][
  Here, we'll let $A$ denote the index set of the canonical basis of $F$.

  \ 
  
  $==>:$ First, suppose $phi$ is surjective, then given any $alpha:F -> N$, for all $a in A$, since the set map $j_N:A -> N$ by $j_N (a) := alpha(e_a)$ satisfies 
]