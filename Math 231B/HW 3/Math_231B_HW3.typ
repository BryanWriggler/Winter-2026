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
  title: "Math 231B HW 3",
  authors: ("Zih-Yu Hsieh",),
  date: datetime.today().display("[month repr:long] [day], [year]"),
)

#set enum(numbering: "(i)")

= ND//1
#problem[
  Etingof Lecture Note Exercise 31.15:

  + Show that for even $dim V$, the representations $(xi^* M)_0, (xi^* M)_1$ are isomorphic to $S_+,S_-$ respectively.
  + Show that for odd $dim V$, the representations $xi^* M_+$ and $xi^* M_-$ are both isomorphic to $S$.

  #text(weight: "bold")[Hint:] Find the highest weight vector for each of these representations and compute the weight of this vector. Then compare dimensions.
][
  
]

#pagebreak()

= ND//2
#problem[
  Etingof Lecture Notes Exercise 35.8 (i), (ii):

  Let $G=GL_n (CC)$. A #text(weight: "bold")[regular algebraic function] on $G$ is a polynomial of $X_(i j)$ and $det(X)^(-1)$ for $X in G$. Denote by $cal(O)(G)$ the algebra of regular algebraic functions on $G$.
  + Show that $G times G$ acts on $cal(O)(G)$ by left and right multiplication.
  + (Algebraic Peter-Weyl theorem) Show that as a $G times G$-module, we have 
    $ cal(O)(G) = plus.circle.big_(V in "Irrep"(G))V tensor V^* $

  #text(weight: "bold")[Hint:] Compute $Hom_G (V, cal(O)(G))$ where $G$ acts on $cal(O)(G)$ by right translations. For this, interpret elements of this space as equivariant functions $G -> V^*$ and show that such functions are automatically regular algebraic.
][
  + Given any pair $(A,B) in G times G$, and algebraic function $f(X) in cal(O)(G)$ (which $f$ is a polynomial with indeterminates $X_(i j)$ and $det(X)^(-1)$, for any $X in G = GL_n (CC)$), define the action $((A,B) * f)(X) := f(A^(-1) X B)$. 

    First, to show it's well-defined, notice that both $A,B^(-1)$ are $n times n$ matrices, hence for any $X in GL_n (CC)$, one has the entries $(A^(-1) X B)_(i l) = sum_(j=1)^n sum_(k=1)^n (A^(-1))_(i j)X_(j k)B_(k l)$, which the entries of $A^(-1) X B$ are all linear combinations of the entris of $X$; on the other hand, one has $det(A^(-1) X B)^(-1) = (det(A) dot det(B)^(-1)) det(X)^(-1)$, which is a multiple of $det(X)^(-1)$. Hence, with $f$ being a polynomial in entries of the matrix and its determinant's inverse, one has $f(A^(-1) X B)$ still be a polynomial in entries of $X$ and $det(X)^(-1)$ (since inputs of $f$ now becomes linear combinations of $X_(i j)$'s, and multiples of $det(X)^(-1)$, which is still a polynomial in terms of $X_(i j)$'s and $det(X)^(-1)$).

    Then, to show it's an action, for any $(A,B), (A',B') in G times G$, one has the following:
    $ ((A,B)*((A',B')*f))(X) &= ((A',B')*f)(A^(-1) X B) = f(A'^(-1) (A X B)B')\
    &= f((A A')^(-1)X(B B')) = ((A A', B B') * f)(X)\ 
    &= (((A,B) dot (A',B'))*f)(X) $
    This shows that $(A,B) * ((A',B')*f) = ((A,B) dot (A',B'))*f$, which it's in fact a group action.

    \ 

    \ 

  + To compute $Hom_G (V, cal(O)(G))$ (where $cal(O)(G)$ has action by right translation, or any $B in G$ satisfies $(B*f)(X) := f(X B^(-1))$), given any $T in Hom_G (V, cal(O)(G))$, for any $v in V$, define $f_v:= T(v)$. Then, it satisfies the following relation:
    $ forall B,X in G, quad f_v (X B^(-1))=(B * f_v)(X) = (B * T(v))(X) = (T(B dot v))(X) = f_(B dot v)(X) $
    Notice that if take $X := I in G$ (the identity matrix in $GL_n (CC)$), one has $f_v (B^(-1)) = f_(B dot v)(I)$. So, one can define a function $rho:G -> V^*$ by the following:
    $ forall B in G, quad forall v in V, quad rho(B)(v) := f_v (B^(-1)) $
    First, notice that this function is well-defined for all $B in G$, as any $a,b in CC$ and $u,v in V$ satisfies the following:
    $ rho(B)(a u+b v) &= f_(a u+b v)(B^(-1)) = (T(a u+b v))(B^(-1)) \
    &= (a T(u)+b T(v))(B^(-1)) = (a dot f_u + b dot f_v)(B^(-1))\
    &= a dot f_u (B^(-1))+b dot f_v (B^(-1)) = a dot rho(B)(u)+b dot rho(B)(v) $
    This shows that $rho(B)(a u+b v) - a dot rho(B)(u)+b dot rho(B)(v)$, which it's a linear functional (since $f_v in cal(O)(G)$, plugin any $B^(-1) in G$ provides a complex number).

    Then, to prove that it's a $G$-equivariant map, consider the following:
    $ forall A,B in G, quad forall v in V, rho(A B)(v) &= f_v ((A B)^(-1)) = f_v (B^(-1)A^(-1))\
    &= f_(A dot v)(B^(-1)) = rho(B)(A dot v) $
    So, $rho$ is in fact a $G$-equivariant map that turns a left action on $G$ itself, into a right action on $V^*$.

    Notice that this generates an inclusion $Hom_G (V, cal(O)(G)) arrow.hook Hom_Set(G)(G^(op), V^*)$ (if $Set(G)$ denots all sets endow with a right action of $G$),
]