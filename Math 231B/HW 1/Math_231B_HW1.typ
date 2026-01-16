#import "../../macros.typ": *

//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.2.0": *
#import "@preview/fletcher:0.5.8" as fletcher: *

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
  title: "Math 231B HW 1",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(1)")

= ND//1
#problem[
  Etingof Problem Set 7.1:

  Let $R subset RR^n$ be given by 
  $ R={pm e_i, pm 2e_i | 1<=i<=n} union {pm e_i pm e_j | 1<=i,j<=n, i!=j} $
  where $e_i$ is the standard basis in $RR^n$. Show that $R$ is a non-reduced root system.
][
  First, it's clear that $R$ spans the whole space, since all the standard basis elements are contained in $R$.

  \ 

  Now, given any $alpha, beta in R$ (WLOG, say they're positive components in $R$ by factoring out the $-1$), we want to show the property $(2(alpha,beta))/((alpha,alpha)) in ZZ$. Here are some cases:
  \ 
  - If $alpha = e_i$ and $beta = e_j$, one has $(2(e_i,e_j))/((e_i,e_i)) = 2 delta_(i j) in ZZ$.
  \
  - If $alpha = 2e_i$ and $beta = e_j$, one has $(2(2e_i, e_j))/((2e_i,2e_i)) = (4 delta_(i j))/4 = delta_(i j) in ZZ$.
  \
  - If $alpha = 2e_i$ and $beta = 2e_j$, one has $(2(2e_i,2e_j))/((2e_i,2e_i)) = (8 delta_(i j))/4 = 2 delta_(i j) in ZZ$.
  \
  - If $alpha = e_i$ and $beta = e_j pm e_k$, one has $(2(e_i, e_j pm e_k))/((e_i,e_i)) = (2 delta_(i j) pm 2 delta(i k)) in ZZ$.
  \
  - If $alpha = 2e_i$ and $beta = e_j pm e_k$, one has $(2(2e_i, e_j pm e_k))/((2e_i,2e_i)) = (4 delta_(i j)+delta_(i k))/4 = delta_(i j)pm delta_(i k) in ZZ$.
  \ 
  - If $alpha = e_i+e_j$ and $beta = e_k + e_l$, one has $(2(e_i+e_j, e_k+e_l))/((e_i+e_j,e_i+e_j)) = (2(delta_(i k)+delta_(i l)+ delta_(j k)+delta_(j l)))/2 = delta_(i k)+delta_(i l)+ delta_(j k)+delta_(j l) in ZZ$.

  So, the above list verifies that any $alpha, beta in R$, one has $(2(alpha,beta))/((alpha,alpha)) in ZZ$.

  \ 

  Finally, based on the value $n_(beta alpha) = n_(alpha beta)$ derived above for all $alpha, beta in R$, one has the following for reflections:
  - If $alpha = e_i$ and $beta = e_j$, $s_alpha (beta) = e_j - 2 delta_(i j)e_i$. If $i=j$, then $s_alpha (beta) = -e_i in R$; else if $i!=j$, then $s_alpha (beta) = e_j in R$ also.
  \
  - If $alpha = 2e_i$ and $beta = e_j$, one has $s_alpha (beta) = e_j - delta_(i j)2 e_i$. If $i=j$, $s_alpha (beta) = -e_i in R$; else if $i!=j$, $s_alpha (beta) = e_j in R$. 

    Similarly , $s_beta (alpha) = 2e_i - delta_(i j)e_j$. If $i=j$, $s_beta (alpha) = e_i in R$; else if $i!=j$, $s_beta (alpha) = 2e_i in R$ also.
  \ 
  - 
]

#pagebreak()

= ND part (2)//2
#problem[
  Etingof Problem Set 7.2:

  + Let $R subset E$ be a root system. Show that the set 
    $ R^or = {alpha^or | alpha in R} subset E^* $
    where $alpha^or in E^*$ is the coroot corresponding to $alpha$ is also a root system. It is usually called the #emph[dual root system] of $R$.
  + Let $Pi = {alpha_1,...,alpha_r} subset R$ be the set of simple roots. Show that the set $Pi^or = {alpha_1^or, ..., alpha_r^or} subset R^or$ is the set of simple roots of $R^or$. 
  
    (Note: this is not completely trivial, as $alpha mapsto alpha^or$ is not a linear map.)  
][
  Given that $E$ is an $RR$-inner product space, hence the linear map $E -> E^*$ by $v mapsto (v,\_)$ is an isomorphism. Which, given any $phi, psi in E^*$, say $phi = (v,\_)$ and $psi = (u,\_)$ for $v,u in E$, define an inner product $(\_,\_)_*:E^* times E^* -> E^*$ by $(phi, psi)_* = (v,u)$.

  In particular, for any root $alpha in R$, the coroot $alpha^or (\_) = (2(alpha, \_))/((alpha, alpha)) = (2alpha/((alpha,alpha)),\_)$.

  \ 

  + First, to show $R^or$ is a root system of $E^*$, notice that since the root system $R$ spans $E$, while the assignment $alpha mapsto (alpha,\_)$ defines an isomorphism $E arrow.tilde E^*$, then the collection $R' = {(alpha,\_) | alpha in R} subset E^*$ is the image of $R$ under the assignment, which spans $E^*$. 
  
    Since every $alpha in R$ is nonzero, then by positive definiteness, $(alpha,\_)!=0$ and $(alpha, alpha)>0$. Hence, up to rescaling, one has $R^or = {alpha^or | alpha in R} = {2/((alpha, alpha))(alpha,\_) | alpha in R}$, with each element being a rescale of a unique element of $R'$ (and for every element in $R'$, say $(alpha,\_)$, its rescale $2/((alpha,alpha))(alpha,\_)$ is in $R^or$). Hence, one has $R^or$ spanning $E^*$ (since $R'$ does).

    \ 

    Second, for any $alpha, beta in R$, the corrsponding coroot $alpha^or = (2alpha/((alpha,alpha)),\_)$ and $beta^or = (2beta/((beta,beta)),\_)$. So, by the above definition of the induced inner product on $E^*$, one has the following:
    $ &(alpha^or, beta^or)_* = (2alpha/((alpha,alpha)),2beta/((beta,beta))) = (4(alpha,beta))/((alpha,alpha)(beta,beta))\ 
    &(alpha^or,alpha^or)_* = (2alpha/((alpha,alpha)), 2alpha/((alpha,alpha))) = 4/((alpha,alpha)) $
    Hence, the value $n_(beta^or, alpha^or)$ is given as follow:
    $ n_(beta^or, alpha^or) = (2(alpha^or,beta^or))/((alpha^or,alpha^or)) = (2 dot 4(alpha,beta))/((alpha,alpha)(beta,beta)) dot ((alpha,alpha))/4 = (2(alpha,beta))/((beta,beta)) = n_(alpha,beta) in ZZ $

    \ 

    Now, regarding the reflections, one has the following:
    $ s_(alpha^or)(beta^or) &= beta^or - n_(beta^or,alpha^or)alpha^or = (2beta/((beta,beta)),\_) - (2(alpha,beta))/((beta,beta))(2alpha/((alpha,alpha)),\_)\ 
    &= 2/((beta,beta))(beta - (2(alpha,beta))/((alpha,alpha))alpha, \_) = 2/((beta,beta))(beta - n_(beta,alpha)alpha,\_)\ 
    &= 2/((beta,beta))(s_alpha (beta),\_) $
    Lastly, remember that for any $alpha,beta in R$, one has $(beta,beta) = (s_alpha (beta),s_alpha (beta))$, so it reduces to the following:
    $ s_(alpha^or) (beta^or) = 2/((s_alpha (beta),s_alpha (beta)))(s_alpha (beta),\_) = (s_(alpha)(beta))^or in R $
    Hence, $R^or$ satisfies all requirements for being a root system.

    \ 

    \ 

  + First, if $t in E$ is the element used for the polarization of $R$, then using the element $(t,\_) in E^*$ as the polarization  for $R^or$, one has the following:
    $ alpha in R_+ <==> (alpha, t)>0 <==> (2alpha/((alpha,alpha)),t)>0 <==> (alpha^or, (t,\_))_* >0 <==> alpha^or in (R^or)_+ $
    Which, the set of positive roots have their coroots being precisely the positive roots of $R^or$ under this polarization.

    \ 

    \

    Now, instead of proving simple roots coresponds to simple coroots, we'll prove non-simple roots corresponds to non-simple coroots.
    
    Since the set of simple roots form a basis, while $E tilde.equiv E^*$ (since both being finite-dimensional), so the number of simple roots in $R$ (and simple coroots in $R^or$) must be the same. 
    
    Which, because the map $R -> R^or$ by $alpha mapsto alpha^or$ is a bijection, if proving non-simple roots map to non-simple coroots, one has $("# non-simple roots")<= ("# non-simple coroots")$, while the equality on the number of simple roots and coroots (together with the finiteness of $R,R^or$) enforces this to be an equality. 


    \ 

    Finally, to prove the above statement, suppose $alpha, beta, gamma in R_+$ satisfies $alpha = beta+gamma$. Then, 
]

= ND//3
#problem[
  Etingof Problem Set 7.8:

  Let $overline(C_+)$ be the closure of the positive Weyl chamber, and $lambda in overline(C_+)$, $w in W$ be such that $w(lambda) in overline(C_+)$.
  + Show that $lambda in overline(C_+) sect w^(-1)(overline(C_+))$.
  + Let $L_alpha subset E$ be a root hyperplane which separates $C_+$ and $w^(-1)(C_+)$. Show that then $lambda in L_alpha$.
  + Show that $w(lambda) = lambda$.

  Deduce from this that every $W$-orbit in $E$ contains a unique element from $overline(C_+)$.
][
  + Given that $w(lambda) in overline(C_+)$, it's clear that $lambda in w^(-1)(overline(C_+))$. So by definition $lambda in overline(C_+) sect w^(-1)(overline(C_+))$.

    \ 

  + Given 
]

#pagebreak()

= ND//4
#problem[
  Etingof Problem Set 7.12:

  Let $phi:R_1 arrow.tilde R_2$ be an isomorphism between irreducible root systems. Show that then $phi$ is a composition of an isometry and a scalar operator: $(phi(v),phi(w)) = c(v,w)$ for any $v,w in E_1$.
][
  It is both sufficient and necessary to prove the case for the simple roots of $R_1$ (since the simple roots form a basis). 

  \ 

  Let $Pi={alpha_1,...,alpha_n}$ be the set of simple roots of $R_1$ under a chosen polarization. Due to the irreducibility of $R_1$, for any $i!=j$, one has $(alpha_1,alpha_2)<0$ (since such inner product $<=0$ by the property of simple roots, while none of the simple roots can be orthogonal by irreducibility).d 
]

= ND//5
#problem[
  Etingof Prolem Set 7.15:

  Let $R subset E$ be an irreducible root system. Show that then $E$ is an irreducible representation of the Weyl group $W$.
][
  Suppose the contrary that $E$ is not an irreducible representation, which implies some nonzero proper subspace $U subset E$ is invariant under the Weyl group $W$'s action. Take $R' = R sect U$, while $R'' = R sect U^perp$
]