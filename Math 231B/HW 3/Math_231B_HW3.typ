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

= D//1
#problem[
  Etingof Lecture Note Exercise 31.15:

  + Show that for even $dim V$, the representations $(xi^* M)_0, (xi^* M)_1$ are isomorphic to $S_+,S_-$ respectively.
  + Show that for odd $dim V$, the representations $xi^* M_+$ and $xi^* M_-$ are both isomorphic to $S$.

  #text(weight: "bold")[Hint:] Find the highest weight vector for each of these representations and compute the weight of this vector. Then compare dimensions.
][
  + For even dimension case, recall that $V$ has basis $a_1,...,a_n,b_1,...,b_n$, while $M = and.big (a_1,...,a_n)$. Now, consider the following elements in $and.big^2 V tilde.equiv so(V)$:
  /*
    $ forall i in {1,...,n}, quad e_i:= a_i and a_(i+1), quad f_i := -b_i and b_(i+1), quad h_i := [e_i,f_i] $
    For the case $i=n$, take $e_n = a_1 and b_n$, $b_n = -b_1 and a_n$ instead. Then, inside the Clifford Algebra $Cl(V)$ (with Lie algebra homomorphism $xi:and.big^2 V -> Cl(V)$ by $xi(a and b) = 1/2(a b-b a) = a b-1/2(a,b)$), their image are:
    $ xi(e_i) = a_i a_(i+1)-1/2(a_i,a_(i+1))=a_i a_(i+1), quad xi(e_n)=a_n b_1 $
    $ xi(f_i) = -(b_i b_(i+1)-1/2(b_i,b_(i+1)))=-b_i b_(i+1), quad xi(f_n) = b_n a_1 $
    $ xi(h_i) &= xi([e_i,f_i]) = xi([a_i and a_(i+1), -b_i and b_(i+1)])\ 
    &= -((a_(i+1),b_i)a_i b_(i+1) - (a_(i+1),b_(i+1))a_i b_i + (a_i,b_i)b_(i+1)a_(i+1) - (a_i,b_(i+1))b_i a_(i+1))\ 
    &= -(-a_i b_i +b_(i+1)a_(i+1)) = a_i b_i + a_(i+1)b_(i+1) - 1 $
    $ xi(h_n) &= xi([a_1 and b_n, -b_1 and a_n])= -(b_n a_n + a_1 b_1)= -(a_1 b_1 - a_n b_n +1) $
    Which, the commutation relation of $e_i,f_i,h_i$ in $Cl(V)$ are given as:
    $ [h_i,e_i] &= [a_i b_i + a_(i+1)b_(i+1), a_i a_(i+1)]\ 
    &= a_i a_(i+1) - a_(i+1)a_i\ 
    &= 2(a_i a_(i+1)-1/2(a_i,a_(i+1)))\ 
    &= 2a_i a_(i+1)=2e_i $
    $ [h_i,f_i]&= -[a_i b_i+a_(i+1)b_(i+1), b_i b_(i+1)]\ 
    &= -(b_(i+1)b_i - b_i b_(i+1))\ 
    &= (b_i b_(i+1)-b_(i+1)b_i)\ 
    &= 2(b_i b_(i+1) - 1/2(b_i,b_(i+1)))\ 
    &= 2b_i b_(i+1)=-2f_i $
    $ [h_n,e_n] &= [a_n b_n - a_1 b_1, a_1 b_n]\ 
    &= -b_n a_1+ a_1 b_n\ 
    &= 2 a_1 b_n = 2 e_n $
    $ [h_n, f_n] &= [a_n b_n -a_1 b_1, -b_1 a_n]\ 
    &= -(a_n b_1-b_1 a_n)\ 
    &= 2 b_1 a_n = -2 f_n $
    So, they do satisfy the $sl_2$-triple relation.

    \ 

    Now, notice that each $h_i = (a_i b_i-1/2) + (a_(i+1)b_(i+1)-1/2)$, and $h_n = (a_n b_n - 1/2) - (a_1 b_1 + 1/2)$. Then, this would generate all $a_i b_i$ and $1/2$ element via addition and scalar multiplication, and further generate all $a_i b_i-1/2$ in our subalgebra. We'll particularly look at the action of each $H_i := a_i b_i - 1/2$.*/
    $ forall i in{1,...,n}, quad h_i := a_i and b_i $
    Which, inside the Clifford Algebra $Cl(V)$, the corresponding action is $xi(a_i and b_i)=a_i b_i-1/2(a_i,b_i) = a_i b_i - 1/2$.

    \ 

    #text(weight: "bold")[Top Wedge Case:]

    If consider the action on the top wedge $(a_1...a_n) in M$, then one has:
    /*
    If consider the action of $e_i$ on the top wedge $(a_1...a_n) in M$, then one has:
    $ &e_i * (a_1...a_n) = (a_i a_(i+1))*(a_1...a_n)=0\ 
    &e_n * (a_1...a_n) = (a_1 b_n)*(a_1...a_n) = a_1 * (-1)^(n-1)(a_1...a_(n-1))=0 $
    (Note: Since wedge product with two similar items would automatically be $0$).

    As a result, if $(a_1...a_n)$ belongs to some weight space, it's automatically becomes a highest weight vector.

    Now, consider any $H_i$'s action:*/
    $ h_i * (a_1...a_n) &= (a_i b_i-1/2) * (a_1...a_n)\ 
    &= a_i * (-1)^(i-1)(a_1...hat(a_i)...a_n) - 1/2 (a_1...a_n)\ 
    &= (a_1...a_n)-1/2 (a_1...a_n)\ 
    &= 1/2(a_1...a_n) $
    This shows that with respect to all $h_i$'s, $(a_1...a_n)$ has been acted by multiplying by $1/2$. So, its weight is the fundamental weight $w_(n-1) = (1/2,...,1/2)$ for $so(2n)$.

    Also, notice that since any $b_i b_j = xi(b_i and b_j)$ (for $i!=j$), then no matter if $a_1...a_n in (xi^* M)_0$ or $(xi^*M)_1$ (corresponds to the case where $n$ is even / odd respectively), it generates everything, as if $a_(i_1)...a_(i_k)$ is a wedge with $n-k$ being even (i.e. they have the same parity), if $a_(j_1),...,a_(j_l)$ are distinct variables that didn't show up in $a_(i_1)...a_(i_k)$ (say $l=n-k$), then notice the following:
    $ product_(i=1)^(l/2 = (n-k)/2) b_(j_(2i))b_(j_(2i+1)) * (a_1...a_k) = (-1)^L (a_(i_1)...a_(i_l)) $
    since $b_(j_1)...b_(j_l)$ cancels all appearance of $a_(j_1),...,a_(j_l)$ in $(a_1...a_n)$, and left with $a_(i_1)...a_(i_k)$ (up to some scalars). So, $a_1...a_n$ is indeed a highest weight vector of $(xi^*M)_0$ or $(xi^*M)_1$ with fundamental weight $w_(n-1) = (1/2,...,1/2)$ (dependent on the even / oddness of $n$), and generates everything).

    \ 

    #text(weight: "bold")[Second Top Wedge Case:]

    If consider the second top wedge $a_1...a_(n-1)$ (if $a_1...a_n$ belongs to one of $(xi^*M)_0, (xi^*M)_1$, then $a_1...a_(n-1)$ must be in the other), notice that each $h_i$ acts as below:
    /*
    $ &e_i * (a_1...a_(n-1)) = (a_i a_(i+1))*(a_1...a_(n-1)) = 0\
    &e_n * (a_1...a_(n-1)) = (a_1 b_n)*(a_1...a_(n-1)) = 0 $
    (Note: the first one has $(n+1)$ element in the wedge, which is automatically $0$; the second one has $b_n$ acts as $partial/(partial a_n)$, but $a_1...a_(n-1)$ contains none of these).

    So, if $(a_1...a_(n-1))$ is in a weight space, it's a highest weight vector.

    Now, consider the action of each $H_i$ on this:*/
    $ h_i * (a_1...a_(n-1)) = (a_i b_i-1/2)*(a_1...a_(n-1)) = cases(
      1/2(a_1...a_(n-1)) & i<n,
      -1/2(a_1...a_(n-1)) & i=n
    ) $
    (Note: the reason is because if $i<n$, then $a_i$ shows up in $a_1...a_(n-1)$, so $a_i b_i$ acts as $1$; on the other hand, if $i=n$, $a_n b_n$ acts on $a_1...a_(n-1)$ as $0$, since it doesn't have $a_n$ term, so the $-1/2$ in $h_i$ takes over).

    Hence, $(a_1...a_(n-1))$ in fact corresponds to the weight $w_n=(1/2,...,1/2,-1/2)$ for $so(2n)$.

    Finally, this wedge also generates everything with the same degree parity: if take any other $a_1...hat(a_i)...a_n$ (where $i!=n$), then one has $(a_n b_i) * (a_1...a_(n-1)) = (-1)^k (a_1...hat(a_i)...a_n)$ (by cancelling $a_i$, and add $a_n$, up to a scalar).

    Also, similar to the top wedge case, if any other wedge is with even degree difference with $a_1...a_(n-1)$, first move to the suitable $a_1...hat(a_i)...a_n$ (such that the desired wedge also misses $a_i$), then lower using the combinations of $b_j b_k$'s.

    This shows that if $(a_1...a_(n-1))$ lies in $(xi^*M)_0$ or $(xi^*M)_1$ (again, based on the odd/evenness of $n$), it's a highest weight of fundamental weight $w_n$ that generates everything.

    \ 

    Finally, for the above two cases, notice that $dim(xi^*M)_0 = sum_(0<=2k<=n)mat(n; 2k)$ (sum of all distinct even degree wedges), and $dim(xi^* M)_1 = sum_(0<=2k+1<=n)mat(n;2k+1)$ (sum of all choices of distinct odd degree wedges). But, if consider the following binomial expansion:
    $ (x+1)^n = sum_(k=0)^n mat(n;k)x^n $
    Plugin $x=-1$, one yields the following:
    $ 0 = sum_(k=1)^n mat(n;k)(-1)^n = sum_(0<=2k<=n)mat(n;2k) - sum_(0<=2k+1<=n)mat(n;2k+1) $
    This equation shows that $dim(xi^*M)_0 = dim(xi^*M)_1$. And, with the two direct sums to $M = and.big(a_1...a_n)$ (which has dimension $2^n$), each of them must have dimension $2^(n-1)$, matching up with the dimension of $S_+, S_-$.

    Since the weight of the highest weight representations match up, together with the dimension matches up, one concludes that $(xi^*M)_0, (xi^*M)_1$ are isomorphic to $S_+, S_-$ (depending on the parity of $n$).

    \ 

    #line(length: 100%)

    \

  + For odd dimension case, given $V$ with basis $a_1,...,a_n, b_1,...,b_n, z$ that satisfies $(a_i,a_j)=(b_i,b_j)=(a_i,z)=(b_i,z)=0$, $(a_i,b_j)=delta_(i j)$, and $(z,z)=2$. We'll define the following elements in $so(V) tilde.equiv and.big^2 V$:
    $ forall i in {1,...,n}, quad h_i := a_i and b_i $
    /*
    $ forall i in {1,...,n}, quad e_i := a_i and z, quad f_i := - b_i and z, quad h_i := [e_i, f_i] $
    If consider their image in the Clifford Algebra $Cl(V)$ (by the map $xi:and.big^2 v -> Cl(V)$ by $xi(a and b) = 1/2(a b-b a)=a b-1/2(a,b)$, which is also a Lie algebra homomorphism), one gets the following:
    $ &xi(e_i) = xi(a_i and z) = 1/2(a_i z-z a_i) = (a_i z-1/2 (a_i, z)) = a_i z $
    $ &xi(f_i) = xi(-b_i and z) = -1/2(b_i z-z b_i)=-(b_i z- 1/2(b_i,z))= -b_i z $
    $ xi(h_i) &= xi([e_i, f_i]) = [a_i z,-b_i z]\ 
    &=-((z,b_i)xi(a_i and z)-(z,z)xi(a_i and b_i)+(a_i,b_i)xi(z and z)-(a_i, z)xi(b_i and z))\ 
    &= -(-2(a_i b_i - 1/2)) = 2a_i b_i - 1 $
    Here, we'll use $e,f,h$ to represent the element in $Cl(V)$. Notice that these do satisfy the $sl_2$-triple relation:
    $ [h_i, e_i] &= [2a_i b_i, a_i z]\ 
    &= 2((b_i, a_i)xi(a_i and z)-(b_i, z)xi(a_i and a_i) + (a_i,a_i)xi(z and b_i)-(a_i,z)xi(a_i and b_i))\ 
    &= 2 xi(a_i and z) = 2a_i z = 2e_i $
    $ [h_i,f_i] &= [2a_i b_i, -b_i z]\
    &= -2((b_i,b_i) xi(a_i and z)-(b_i,z)xi(a_i and b_i)+(a_i,b_i)xi(z and b_i) - (a_i,z)xi(b_i and b_i))\ 
    &= -2(z b_i) = 2 b_i z = -2 f_i $
    So, these three do satisfy the $sl_2$-triple relation.
    */
    Now, for each case, consider the action of $h_i$ on the top wedge $(a_1...a_n) in M_(pm)$ respectively:
    $ h_i * (a_1...a_n)&= (a_i b_i-1/2)*(a_1...a_n) = (a_1...a_n)-1/2(a_1...a_n)=1/2(a_1...a_n) $
    So, each $h_i$ acts as a scalar of $1/2$ on the top wedge $(a_1...a_n) in M_(pm)$, showing it's a weight vector corresponding to weight $w_n = (1/2,...,1/2)$ for $so(2n+1)$.
    /*
    On the other hand, the $e_i$'s have the following action:
    $ e_i * (a_1...a_n) = (a_i z)*(a_1...a_n) = (-1)^n a_i * (a_1...a_n) = 0 $
    So, this top wedge is annihilated by all $e_i$'s, hence is a highest weight vector.

    Finally, notice that each $f_i$ satisfies the following:
    $ f_i * (a_1...a_n) = (b_i z)*(a_1...a_n) = pm(-1)^n b_i * (a_1...a_n) = pm(-1)^(n+i-1)(a_1...hat(a_i)...a_n) $
    (Note: the $pm$ depends on if $(a_1...a_n) in M_+$ or $M_-$, due to the action of $z$ being $pm(-1)^ell(w)w$ for any pure wedge product $w in M_(pm)$).
    */
    Which, notice that the element $b_i and z in and.big^2 V$ satisfies:
    $ xi(b_i and z) * (a_1...a_n) =b_i z * (a_1...a_n) = b_i * (-1)^n (a_1...a_n) = (-1)^(n+i-1)(a_1...hat(a_i)...a_n) $
    Which, for any $a_(i_1)...a_(i_k) in M$, if it's missing $a_(j_1),...,a_(j_l)$ in the wedge, then the above formula implies $(product_(k=1)^l b_(j_k)z)* (a_1...a_n) = (-1)^L (a_(i_1)...a_(i_k))$ (since it omits the $a_(j_1),...,a_(j_l)$ up to a sign).
    
    /*, so within the $so(2n+1)$-action, $(a_1...a_n)$ generates the whole $M$.


    So, each $f_i$ decreases the degree by canceling the $a_i$ te rm in the wedge product. Hence, for each wedge product $a_(i_1)...a_(i_k)$, one has $product_(j != i_1,...,i_k)f_j * (a_1...a_k) = (-1)^L (a_(i_1)...a_(i_k))$ for some $L in NN$ (since the operator $product_(j!=i_1,...,i_k)f_j$ cancels all variable $a_j$ not existing in $i_1,...,i_k$).*/

    Hence, $(a_1...a_n)$ in fact generates the whole $M_(pm)$ (since the $z$-action here doesn't matter, only up to $pm 1$ on each pure wedge). Since each has dimension $2^n$, and it's a highest weight module for fundamental weight $w_n = (1/2,...,1/2)$, then both $M_(pm)$ must agree with the spin representation $S$.
]

#pagebreak()

= D//2
#problem[
  Etingof Lecture Notes Exercise 35.8 (i), (ii):

  Let $G=GL_n (CC)$. A #text(weight: "bold")[regular algebraic function] on $G$ is a polynomial of $X_(i j)$ and $det(X)^(-1)$ for $X in G$. Denote by $cal(O)(G)$ the algebra of regular algebraic functions on $G$.
  + Show that $G times G$ acts on $cal(O)(G)$ by left and right multiplication.
  + (Algebraic Peter-Weyl theorem) Show that as a $G times G$-module, we have 
    $ cal(O)(G) = plus.circle.big_(V in "Irrep"(G))V tensor V^* $

  #text(weight: "bold")[Hint:] Compute $Hom_G (V, cal(O)(G))$ where $G$ acts on $cal(O)(G)$ by right translations. For this, interpret elements of this space as equivariant functions $G -> V^*$ and show that such functions are automatically regular algebraic.
][
  + Given any pair $(A,B) in G times G$, and algebraic function $f(X) in cal(O)(G)$ (which $f$ is a polynomial with indeterminates $X_(i j)$ and $det(X)^(-1)$, for any $X in G = GL_n (CC)$), define the action $((A,B) * f)(X) := f(A^(-1) X B)$. 

    First, to show it's well-defined, notice that both $A^(-1),B$ are $n times n$ matrices, hence for any $X in GL_n (CC)$, one has the entries $(A^(-1) X B)_(i l) = sum_(j=1)^n sum_(k=1)^n (A^(-1))_(i j)X_(j k)B_(k l)$, which the entries of $A^(-1)  X B$ are all linear combinations of the entris of $X$; on the other hand, one has $det(A^(-1) X B)^(-1) = (det(A) dot det(B)^(-1)) det(X)^(-1)$, which is a multiple of $det(X)^(-1)$. Hence, with $f$ being a polynomial in entries of the matrix and its determinant's inverse, one has $f(A^(-1) X B)$ still be a polynomial in entries of $X$ and $det(X)^(-1)$ (since inputs of $f$ now becomes linear combinations of $X_(i j)$'s, and multiples of $det(X)^(-1)$, which is still a polynomial in terms of $X_(i j)$'s and $det(X)^(-1)$).

    Then, to show it's an action, for any $(A,B), (A',B') in G times G$, one has the following:
    $ ((A,B)*((A',B')*f))(X) &= ((A',B')*f)(A^(-1) X B) = f(A'^(-1) (A^(-1) X B)B')\
    &= f((A A')^(-1)X(B B')) = ((A A', B B') * f)(X)\ 
    &= (((A,B) dot (A',B'))*f)(X) $
    This shows that $(A,B) * ((A',B')*f) = ((A,B) dot (A',B'))*f$, which it's in fact a (left) group action.

    \ 

    \ 

  + Notice that $G$ is a quasi-affine variety, and $V^*$ is an affine variety, for any $V$ that's a finite-dimensional irreducible representation of $V$.
  
    First, recall that $Hom_G (V, cal(O)(G))$ are all linear maps preserving the $G$-representations. As a result, if look at the symmetric tensor algebra $S V$, notice that it is equivalent to $cal(O)(V^*)$ (all algebraic functions on $V^*$): If viewing $V^*$ as some traditional $CC$-vector space, like $CC^m$, choose a basis $x_1,...,x_m in V$ and the corresponding dual basis $phi_1,...,phi_m in V^*$, then each linear functional $phi in V^*$ has a unique representative $phi = a_1 phi_1 +...+a_m phi_m$, which $x_i:V^* -> CC$ by $x_i (phi):= phi(x_i) = a_i phi_i (x_i) = a_i$ is the "degree 1 polynomial" associated to it.

    As a result, $S V = CC[x_1,...,x_m]$ is precisely the coordinate ring of $V^* tilde.equiv CC^m$ (or $CC[x_1,...,x_m] tilde.equiv cal(O)(V^*)$). Hence, with each morphism in $Hom_G (V,cal(O)(G))$ indicates a specific way of mapping $x_1,...,x_m$ into $cal(O)(G)$ (which is in fact a $CC$-algebra, as it's a polynomial algebra over $CC$ on the quasi-affine variety $G$), hence they each correspond to a unique algebra homomorphism $CC[x_1,...,x_m] = cal(O)(V^*)-> cal(O)(G)$, that preserves the $G$-action on the tensor algebra $S = CC[x_1,...,x_m]$ and on $cal(O)(G)$ (since the morphism mapping $x_1,...,x_m$ to $cal(O)(G)$ preserves each generateor's $G$-action). So, there is a one-to-one correspondance $Hom_G (V,cal(O)(G)) <-> Hom_(CC-"Alg"\ Set(G))(cal(O)(V^*), cal(O)(G))$ (indicating all $CC$-algebra homomorphism between $cal(O)(V^*)$ and $cal(O)(G)$, that is also a $G$-equivariant map).

    \ 

    Now, notice that this has a one-to-one correspondance to morphisms $Hom_(Set(G))(G,V^*)$, where this is also a subset of the morphisms between affine varieties (since all the morphism $f:G->V^*$ that satisfies $f^* in Hom_(CC-"Alg"\ Set(G))(cal(O)(V^*), cal(O)(G))$ must satisfy $f^*(g)(X A) = A*f^*(g)(X)= f^*(g compose rho_V (A)^(-1))(X)$ for all $g in cal(O)(V^*)$, and $A,X in G$ for the $G$-action property, so one has $g compose f(X A) = (g compose rho_V (A)^(-1))(f(X)) = (A * g)(f(X))$, in particular showing that $f$ must be a $G$-equivariant map). So, this establishes a vijection between $Hom_G (V, cal(O)(G)) <-> Hom_(Set(G))(G,V^*)$. However, by the irreducibility, one simply has $Hom_(Set(G))(G,V^*) tilde.equiv V^*$, so one can generate an isomorphism $V tensor V^* tilde.equiv V tensor Hom_(Set(G))(G,V^*) tilde.equiv V tensor Hom_G (V, cal(O)(G))$.

    \ 

    As a result, there is a natura evaluation $plus.circle.big_(V in "Irrep"(G))V tensor V^* tilde.equiv plus.circle.big_(V in "Irrep"(G))V tensor Hom_G (V,cal(O)(G)) arrow.hook cal(O)(G)$ via the map $v tensor f mapsto f(v)$, for any $v tensor f in V tensor Hom_G (V,cal(O)(G))$ (where the injection is by the assumption of each component's irreducibility).

    Yet, this map is also a surjection, because for any polynomial $f in cal(O)(G)$, which has a bounded degree in both $det(X)^(-1)$, and the total degree of $X_(i j)$'s. Then, if one collects $span{g dot f in cal(O)(G) | g in G}$, notice that every $g dot f$ must have the same precise degree in $det(X)^(-1)$ and the total degree of $X_(i j)$'s (since $g$ scales $det(X)^(-1)$ linearly, while mapping linear functions of $X_(i j)$'s into each of the input of $f$, which both preserve the degrees). Then, in particular $Z = span{g dot f in cal(O)(G) | g in G}$ is a finite-dimensional subspace of $cal(O)(G)$ due to the bounded degree of all polynomials in there. And, because it collects all $G$-orbits of $f$ (and their scalings), it's actually a finite-dimensional $G$-representation over $CC$.

    Now, using the complete reducibility of the representation of $G = GL_n (CC)$, then $Z tilde.equiv plus.circle.big_i V_i$ for finitely many irreducible $V_i$'s that are $G$-representations. As a result, take the subspace $plus.circle.big_(i)V_i tensor V_i^*$ in $plus.circle.big_(V in "Irrep"(G))V tensor V^*$, since its evaluation must contain $f$ (because $f$ is in the direct sum of $V_i$'s), then $f$ must appear in the image of the map $plus.circle.big_(V in "Irrep"(G))V tensor V^* tilde.equiv plus.circle.big_(V in "Irrep"(G))V tensor Hom_G (V,cal(O)(G)) arrow.hook cal(O)(G)$. This shows the surjection.

    As a result, $cal(O)(G) tilde.equiv plus.circle.big_(V in "Irrep"(G))V tensor V^*$.

    \ 

    #text(weight: "bold")[Other approach to surjection:]

    If consider the 1-dimensional right action of $G -> CC^times$ by $A mapsto det(A)^(-1)$, then its action on the $1$-dimensional dual space $CC^*$ can be given by $A dot lambda(\_) = lambda(\_ dot det(A)^(-1))$. Which, if consider the evaluation of $CC tensor CC^*$ in $cal(O)(G)$, one has the following (by choosing $a in CC$ and $lambda in CC^*$ with $lambda(a)=1$):
    $ &a tensor lambda mapsto lambda(a dot det(\_)^(-1)) in cal(O)(G)\
    &forall X in G, quad lambda(a dot det(X)^(-1)) = det(X)^(-1) lambda(a) = det(X)^(-1) $
    So, $det(X)^(-1)$ is in the image of the embedding.

    \ 

    On the other hand, if consider $V := CC^n$ as the irreducible representation of $G=GL_n (CC)$, then with $e_1,...,e_n in V$ be the standard basis, $phi_1,...,phi_n in V^*$ be the corresponding dual basis, notice that the following is given in the image of $V tensor V^*$:
    $ &e_j tensor phi_i mapsto phi_i (\_ dot e_j) in cal(O)(G)\ 
    &forall X in G, quad phi_i (X dot e_j) = phi_i (sum_(k=1)^n X_(k j)e_k) = X_(i j) $
    So, $X_(i j)$ is also in the image of the embedding.

    As a result, if consider the suitable tensor of the above representations, one can create arbitrary monomials in the image, and hence generate all polynomials in $cal(O)(G)$. This is a way of explicitly proving that all generators of $cal(O)(G)$ is in the image, hence the embedding is surjective.
    /*
    \ 

    #text(weight: "bold")[Another approach:]
    
    To compute $Hom_G (V, cal(O)(G))$ (where $cal(O)(G)$ has action by right translation, or any $B in G$ satisfies $(B*f)(X) := f(X B)$), given any $T in Hom_G (V, cal(O)(G))$, for any $v in V$, define $T_v:= T(v)$. Then, it satisfies the following relation:
    $ forall B,X in G, quad T_v (X B)=(B * T_v)(X) = (B * T(v))(X) = (T(B dot v))(X) = T_(B dot v)(X) $
    So, let $G$ have a natural right action on itself by $B * A := B A$, one can define a function $rho_T:G -> V^*$ by the following:
    $ forall X in G, quad forall v in V, quad rho_T (B)(v) := T_v (B^(-1)) $
    First, notice that this function is well-defined for all $B in G$, as any $a,b in CC$ and $u,v in V$ satisfies the following:
    $ rho_T (B)(a u+b v) &= T_(a u+b v)(B^(-1)) = (T(a u+b v))(B^(-1)) \
    &= (a T(u)+b T(v))(B^(-1)) = (a dot T_u + b dot T_v)(B^(-1))\
    &= a dot T_u (B^(-1))+b dot T_v (B^(-1)) = a dot rho_T (B)(u)+b dot rho_T (B)(v) $
    This shows that $rho_T (B)(a u+b v) = a dot rho_T (B)(u)+b dot rho_T (B)(v)$, which it's a linear functional (since $T_v in cal(O)(G)$, plugin any $B in G$ provides a complex number).

    Then, to prove that it's a $G$-equivariant map, consider the following:
    $ forall A,B in G, quad forall v in V, rho_T (A B)(v) &= T_v ((A B)^(-1)) = T_v (B^(-1)A^(-1))\
    &= T_(B^(-1) dot v)(A^(-1)) = rho_T (A)(B^(-1) dot v)\ 
    &= (B * rho_T (A))(v) $
    So, $rho_T$ is in fact a $G$-equivariant map that turns a right action on $G$ itself, into a left action on $V^*$.

    Notice that this generates an inclusion $Hom_G (V, cal(O)(G)) arrow.hook Hom_Set(G)(G^(op), V^*)$ by $T mapsto rho_T$ (if $Set(G)$ denots all sets endow with a right action of $G$), as if any $T in Hom_G (V, cal(O)(G))$ satisfies $rho_T equiv 0$, thenn any $B in G$ and $v in V$ has $rho_T (B)(v) = T_v (B^(-1))=0$, so as a polynomial with input $X_(i j)$ and $det(X)^(-1)$, one has $T(v) = T_v equiv 0$ on $G$. So, $T = 0$, showing the inclusion is injective. (This is due to the fact that when pull back using any local charts, $T_v$ is a function which is identically $0$ on any chart, so it must be $0$ globally).

    \

    On the other hand, we claim that this map is surjective: Suppose $rho:G -> V^*$ is a $G$-equivariant map ($G$ with a left action, and $V^*$ with a right action), consider the irreducible representation $V = CC^n$ of $G = GL_n (CC)$, and consider $V tensor V^*$*/
]