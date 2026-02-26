//setup basics
#import "@preview/rubber-article:0.4.1": *
#import "@preview/ergo:0.1.0": *
#import "@preview/fletcher:0.5.5" as fletcher: *

//basic template setup
#show: article.with(
  header-display: true,
  eq-numbering: "(1.1)",
  eq-chapterwise: true,
  margins: 1.0in,
)

//common syntaxes needed
#let eval(sizes) = $lr(|, size: #sizes)$ //when performing evaluation
#let pm = $plus.minus$ //short hand notation for plus minus sign
#let mp = $minus.plus$ //short hand notation for minus plus sign
#let tensor = $times.circle$ //short hand notation for tensor
#let langle = $angle.l$ //short hand notation for left angle
#let rangle = $angle.r$ //short hand notation for right angle

//algebra
#let Gal = math.upright[Gal] //galois
#let Aut = math.upright[Aut] //automorphism
#let End = math.upright[End] //endomorphism
#let Hom = math.upright[Hom] //homomorphism
#let Mor = math.upright[Mor] //morphisms in category, lang
#let Nil = math.upright[Nil] //nilradical (ring)
#let Ann = math.upright[Ann] //annihilator (ring/ module)
#let Char = math.upright[char] //characteristics
#let coim = math.upright[coim] //coimage (homological algebra)
#let im = math.upright[im] //image
#let Spec = math.upright[Spec] //spectrum of a ring / vector space
#let Gr = math.upright[Gr] //graded structure
#let Proj = math.upright[Proj] //the projective space of graded rings
#let coker = math.upright[coker] //cokernel
#let Ker = math.upright[Ker] //the object as source of kernel morphism
#let Cok = math.upright[Cok] //the object as target of cokernel morphism
#let span = math.upright[span] //span of vectors
#let Orb = math.upright[Orb] //orbit in group theory
#let Conj = math.upright[Conj] //denote the conjugation classes
#let Bil = math.upright[Bil] //module of bilinear maps
#let Id = math.upright[Id] //normally, used for other types of identity (when there are small purpose, use id; if there are large purposes, use Id instead)
#let sign = math.upright[sign] //used for sign of a permutation
#let rad = math.upright[rad] // for radical
#let Bl = math.upright[Bl] //blow up notation for alg geo
#let Ind = math.upright[Ind] //induced rep functor

//category theory
#let cat(name) = math.sans[#name] //general category font command
#let Grp = math.sans[Grp] //cat of group
#let Ab = math.sans[Ab] //cat of abel group
#let Ring = math.sans[Ring] //cat of rings
#let CRing = math.sans[CRing] //cat of commutative rings
#let Fld = math.sans[Fld] //cat of field
#let RMod = math.sans[R-Mod] //cat of R-Mod
#let Mod = math.sans[Mod] //cat of Mod in general
#let RAlg = math.sans[R-Alg] //cat of R-Alg
#let PreSh = math.sans[PreSh] //cat of presheaves
#let Sh = math.sans[Sh] //cat of sheaves
#let Vect(k) = $#k -sans("Vect")$ //cat of k-vector space (not sure if this works though)
#let Set(G) = $#G -sans("Set")$//G-action category
#let Top = math.sans[Top] //cat of topological spaces
#let hTop = math.sans[hTop] //cat of topological spaces, with homotopic classes of continuous maps
#let Sets = math.sans[Set] //cat of sets
#let Ch(name) = math.sans[Ch(#name)] //cat of chain / cochaincomplex over an abelian category, sometimes also expressed as Kom
#let D(name) = math.sans[D(#name)] //derived category 
#let Met = math.sans[Met] //cat of metric spaces
#let Ob = math.upright[Ob] //the object of a category
#let op = math.upright[op] //used for opposite category
#let Cone = math.upright[Cone] //used for cone functor
#let Cocone = math.upright[Cocone] //used for cocone functor
#let Rep = math.sans[Rep] //cat of Representations (rings and groups not fixed)
#let colim = math.upright[colim] //the colimit in category

//lie group/lie algebra
#let GL = $"GL"$ //general linear
#let SL = math.upright[SL] //special linear
#let U = math.upright[U] //unitary
#let SO = math.upright[SO] //special orthogonal
#let SU = math.upright[SU] //special unitary
#let Sp=math.upright[Sp] //symplectic
#let Cl=math.upright[Cl] //clifford algebra
#let gl = math.frak[gl] 
#let sl = math.frak[sl]
#let so = math.frak[so]
#let su = math.frak[su]
#let sp = math.frak[sp]
#let Der = math.upright[Der] //stands for spaes of derivation as linear operator
#let Ad = math.upright[Ad] //the Adjoint action of Lie group on itself
#let ad = math.upright[ad] //the adjoint action of Lie algebra on itself
#let Lie = math.upright[Lie] //functor from lie gp to lie alg
#let UT = math.upright[UT] //denote the lie gp of upper triangular matrices
#let ut = math.frak[ut] //denote the lie alg of upper triangular matrices.

//analysis
#let Vol = math.upright[Vol] //volume, in the sense of Riemann / Jordan measure
#let m = math.upright[m] //measure
#let Supp = math.upright[Supp] //can also be used as support of a commmutative ring, where it's all prime ideals when locolization is nontrivial

//complex
#let Re = math.upright[Re] //real part
#let Im = math.upright[Im] //imaginary part
#let Res = math.upright[Res] //residue
#let Holo = math.cal[O] //holomorphic / analytic function
#let Mero = math.cal[M] //meromorphic function

//physics
#let br = math.bold[r] //position
#let bv = math.bold[v] //velocity
#let ba = math.bold[a] //acceleration
#let bF = math.bold[F] //force
#let bP = math.bold[P] //momentum
#let bL = math.bold[L] //angular momentum
#let bN = math.bold[N] //torque
#let bw = $bold(omega)$ //angular velocity
#let b0 = math.bold[0] //zero vector
#let be = math.overline[e] //use for special case of standard basis