Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BEBC8301F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F752168B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 12:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F752168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 42F5E204F2;
	Fri, 23 Oct 2020 12:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVn6-wh0ZnM5; Fri, 23 Oct 2020 12:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 919C7204C4;
	Fri, 23 Oct 2020 12:23:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 563D3C0893;
	Fri, 23 Oct 2020 12:23:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 719AEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B561204F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcCtEIilFA2y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:23:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0164.hostedemail.com
 [216.40.44.164])
 by silver.osuosl.org (Postfix) with ESMTPS id BACA7204C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:23:40 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id 96C7018017AC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 12:08:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 1DF92180A8CA6;
 Fri, 23 Oct 2020 12:08:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: home53_5401a1427259
X-Filterd-Recvd-Size: 19603
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri, 23 Oct 2020 12:08:15 +0000 (UTC)
Message-ID: <2e8279841d604dde8a3335c092db921007f6744e.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 23 Oct 2020 05:08:14 -0700
In-Reply-To: <CABJPP5Dx4qj-_0gOx0bmaWvJj3okB-tNGJg5-8Y3KF2LnCjowQ@mail.gmail.com>
References: <20201023094307.20820-1-dwaipayanray1@gmail.com>
 <d2b05b45adbcf3f1d16692b054862a7aa7353f6d.camel@perches.com>
 <CABJPP5Dx4qj-_0gOx0bmaWvJj3okB-tNGJg5-8Y3KF2LnCjowQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend
 attributes check to handle more patterns
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, 2020-10-23 at 17:10 +0530, Dwaipayan Ray wrote:
> On Fri, Oct 23, 2020 at 4:34 PM Joe Perches <joe@perches.com> wrote:
> > =

> > On Fri, 2020-10-23 at 15:13 +0530, Dwaipayan Ray wrote:
> > > It is generally preferred that the macros from
> > > include/linux/compiler_attributes.h are used, unless there
> > > is a reason not to.
> > > =

> > > Checkpatch currently checks __attribute__ for each of
> > =

> > checkpatch, no need for capitalization
> > =

> > and non-trivially:
> > =

> > > +                     my $attr_list =3D qr {
> > > +                             __alias__|
> > > +                             __aligned__$|
> > > +                             __aligned__\(.*\)|
> > > +                             __always_inline__|
> > > +                             __assume_aligned__\(.*\)|
> > > +                             __cold__|
> > > +                             __const__|
> > > +                             __copy__\(.*\)|
> > > +                             __designated_init__|
> > > +                             __externally_visible__|
> > > +                             __fallthrough__|
> > > +                             __gnu_inline__|
> > > +                             __malloc__|
> > > +                             __mode__\(.*\)|
> > > +                             __no_caller_saved_registers__|
> > > +                             __noclone__|
> > > +                             __noinline__|
> > > +                             __nonstring__|
> > > +                             __noreturn__|
> > > +                             __packed__|
> > > +                             __pure__|
> > > +                             __used__
> > > +                     }x;
> > []
> > > +                     my %attr_replace =3D (
> > > +                             "__alias__"                     =3D> "_=
_alias",
> > > +                             "__aligned__"           =3D> "__aligned=
_largest",
> > > +                             "__aligned__("          =3D> "__aligned=
",
> > > +                             "__always_inline__"     =3D> "__always_=
inline",
> > > +                             "__assume_aligned__("   =3D> "__assume_=
aligned",
> > > +                             "__cold__"                      =3D> "_=
_cold",
> > > +                             "__const__"                     =3D> "_=
_const",
> > > +                             "__copy__("                     =3D> "_=
_copy",
> > > +                             "__designated_init__"           =3D> "_=
_designated_init",
> > > +                             "__externally_visible__"        =3D> "_=
_visible",
> > > +                             "__fallthrough__"               =3D> "f=
allthrough",
> > > +                             "__gnu_inline__"                =3D> "_=
_gnu_inline",
> > > +                             "__malloc__"            =3D> "__malloc",
> > > +                             "__mode__("                     =3D> "_=
_mode",
> > > +                             "__no_caller_saved_registers__" =3D> "_=
_no_caller_saved_registers",
> > > +                             "__noclone__"           =3D> "__noclone=
",
> > > +                             "__noinline__"          =3D> "noinline",
> > > +                             "__nonstring__"         =3D> "__nonstri=
ng",
> > > +                             "__noreturn__"          =3D> "__noretur=
n",
> > > +                             "__packed__"            =3D> "__packed",
> > > +                             "__pure__"                      =3D> "_=
_pure",
> > > +                             "__used__"                      =3D> "_=
_used"
> > > +                     );
> > > +
> > > +                     if ($attr =3D~/^($attr_list)/) {
> > =

> > I would remove the __ from the entries here.
> > =

> > And you could check using
> > =

> > =A0=A0=A0=A0=A0=A0=A0=A0$line =3D~ /__attribute__\s*\(\s*($balanced_par=
ens)\s*)/
> > =

> > and check for all attributes in $1 after
> > stripping the leading and trailing parens
> > and any leading and trailing underscores
> > from each attribute.
> > =

> > And you only need one hash and you should
> > check for existence of the key rather than
> > have multiple lists.
> > =

> > =A0=A0=A0=A0=A0=A0=A0=A0if (exists($attributes($attr))) {
> > =

> =

> Okay thanks!
> But what should be done for the attributes which are
> parameterized, like __aligned__(x). Should all the __
> for these entries be trimmed too?

yes

> There are also
> cases where there are multiple versions like:
> =

> __aligned__
> __aligned__(x)

$ git grep __aligned__ | grep -v -P '__aligned__\s*\('

AFAIK: There is only one use of bare __aligned__ and
that's in compiler_attributes.h

> To help differentiate between them what can be done?
> Should i make the keys as:
> =

> aligned
> aligned__(
> =

> instead of
> =

> __aligned__
> __aligned__(

Just use aligned

Just fyi:

these are the uses of __attribute__ in the kernel
with all the underscores and spaces removed so there's
some value in finding the multiple actual attributes .

$ git grep -ohP '__attribute__\s*\(\s*\(.*\)\s*\)' | \
  sed -r -e 's/\s//g' -r -e  's/__(\w+)__/\1/g' | \
  sort | uniq -c | sort -rn
   2181 attribute((packed))
    212 attribute((unused))
    206 attribute((packed,aligned(4)))
    131 attribute((aligned(8)))
     77 attribute((aligned(32)))
     74 attribute((always_inline))
     68 attribute((noinline))
     52 attribute((preserve_access_index))
     48 attribute((weak))
     38 attribute((noreturn))
     38 attribute((aligned(16)))
     25 attribute((packed,aligned(8)))
     25 attribute((const))
     18 attribute((aligned(64)))
     17 attribute((aligned(256)))
     17 attribute((aligned(128)))
     16 attribute((used))
     16 attribute((format(printf,1,2)))
     15 attribute((aligned(4)))
     14 attribute((constructor))
     10 attribute((unused)))
     10 attribute((pure))
     10 attribute((mode(DI)))
     10 attribute((aligned(SMP_CACHE_BYTES)))
      9 attribute((format(printf,4,5)))
      9 attribute((format(printf,2,3)))
      9 attribute((aligned(sizeof(long))))
      8 attribute((mode(SI)))
      8 attribute((aligned(PAGE_SIZE)))
      7 attribute((visibility("hidden")))
      7 attribute((packed,aligned(2)))
      6 attribute((section(NAME),used))
      6 attribute((section("_ftrace_events")))
      6 attribute((section(".data..read_mostly")))
      6 attribute((section(".data")))
      6 attribute((mode(word)))
      5 attribute((format(printf,a,b)))
      5 attribute((always_inline))typeof(name(0))
      5 attribute((aligned(sizeof(unsignedlong))))
      5 attribute((aligned(alignof(structebt_replace))))
      5 attribute((aligned(AESNI_ALIGN)))
      4 attribute((weak,alias("__vdso_clock_gettime")))
      4 attribute((section("__trace_printk_fmt")))
      4 attribute((section(".inittext")))
      4 attribute((packed,aligned(256)))
      4 attribute((packed,aligned(16)))
      4 attribute((nonnull))
      4 attribute((may_alias))
      4 attribute((format(printf,3,4)))
      4 attribute((fallthrough))
      4 attribute((aligned(x)))
      4 attribute((aligned(sizeof(void*))))
      4 attribute((aligned(BITS_PER_LONG/8)))
      4 attribute((aligned(alignof(u64))))
      3 attribute((weak,alias("__vdso_gettimeofday")))
      3 attribute((visibility("default")))
      3 attribute((section("data_sec")))
      3 attribute((regparm(0)))
      3 attribute((nonnull(2,3)))
      3 attribute((mode(TI)))
      3 attribute((flatten))
      3 attribute((destructor))
      3 attribute((bitwise))
      3 attribute((aligned(sizeof(uint64_t))))
      3 attribute((aligned(sizeof(__u64))))
      3 attribute((aligned(PADLOCK_ALIGNMENT)))
      3 attribute((aligned(L1_CACHE_BYTES)))
      3 attribute((aligned(a)))
      3 attribute((alias("thermal_genl_event_tz")))
      2 attribute((weak,unused))
      2 attribute((weak,section(".rodata")))
      2 attribute((weak,alias("__vdso_time")))
      2 attribute((weak,alias("__vdso_getcpu")))
      2 attribute((weak,alias("__vdso_clock_getres")))
      2 attribute((warn_unused_result,nonnull))
      2 attribute((vector_size(16)))
      2 attribute((user))
      2 attribute((section(".__syscall_stub")))
      2 attribute((section(".maps."#name),used))
      2 attribute((section("license"),used))
      2 attribute((section("_ftrace_eval_map")))
      2 attribute((section(".cpuidle.text")))
      2 attribute((section("__builtin_cmdline")))
      2 attribute((section(".arch.info.init")))
      2 attribute((packed,aligned(PMCRAID_IOARCB_ALIGNMENT)))
      2 attribute((packed,aligned(64)))
      2 attribute((no_sanitize_address))
      2 attribute((noreturn,unused))
      2 attribute((nonnull(2)))
      2 attribute((no_instrument_function))
      2 attribute((model(small)))
      2 attribute((malloc))
      2 attribute((latent_entropy))
      2 attribute((gnu_inline))
      2 attribute((format(scanf,a,b)))
      2 attribute((format(printf,1,2)))attribute((noreturn))
      2 attribute((force))
      2 attribute((externally_visible))
      2 attribute((error(message)))
      2 attribute((common))
      2 attribute((aligned(XCHAL_NCP_SA_ALIGN)))
      2 attribute((aligned(VRING_USED_ALIGN_SIZE)))
      2 attribute((aligned((sizeof(long)))))
      2 attribute((aligned(sizeof(Elf##size##_Word))))
      2 attribute((aligned(65536)))
      2 attribute((aligned(512)))
      2 attribute((aligned(4*sizeof(__u64))))
      2 attribute((aligned(32),packed))
      2 attribute((aligned(0x20000)))
      2 attribute((alias(__stringify(__se_sys##name))))
      2 attribute((alias(__stringify(__se_compat_sys##name))))
      2 attribute((alias("cfi_cmdset_0002")))
      2 attribute((alias("cfi_cmdset_0001")))
      1 attribute((weakref("dsdt_aml_code")))
      1 attribute((weakref("AmlCode")))
      1 attribute((weak,alias("__vdso_clock_gettime64")))
      1 attribute((weak,alias("__platform_"#f)))
      1 attribute((weak,alias("__mips_cm_phys_base")))
      1 attribute((weak,alias("__mips_cm_l2sync_phys_base")))
      1 attribute((weak,alias("__alloc_bootmem_huge_page")))
      1 attribute((warn_unused_result))
      1 attribute((warning(message)))
      1 attribute((vector_size(8)))
      1 attribute((used,section(".videocards")))
      1 attribute((used,section(".taglist")))
      1 attribute((unused,section("__param"),aligned(sizeof(void*))))
      1 attribute((unused,alias(__stringify(name))))
      1 attribute((tls_model("initial-exec"),unused))
      1 attribute((tls_model("initial-exec")))
      1 attribute((target("no-vsx")))
      1 attribute((syscall_linkage))
      1 attribute((section(".xiptext")))
      1 attribute((section(".x86_intel_mid_dev.init")))
      1 attribute((section(".x86_cpu_dev.init")))
      1 attribute((section(".vvar_"#name),aligned(16)))
      1 attribute((section(".text.hot")))
      1 attribute((section(".taglist.init")))
      1 attribute((section("__syscalls_metadata")))
      1 attribute((section("__stop_sched_class")))
      1 attribute((section(".spinlock.text")))
      1 attribute((section(".softirqentry.text")))
      1 attribute((section(#section),aligned((sizeof(void*)))))
      1 attribute((section(#__sec".init")))
      1 attribute((section(".sched.text")))
      1 attribute((section(#S)))
      1 attribute((section("__rt_sched_class")))
      1 attribute((section(PER_CPU_BASE_SECTIONsec)))
      1 attribute((section("__modver")))
      1 attribute((section(".modinfo"),unused,aligned(1)))
      1 attribute((section(".machine.desc")))
      1 attribute((section("___ksymtab"sec"+"#sym),used))
      1 attribute((section(".ksyms")))
      1 attribute((section(".kprobes.text")))
      1 attribute((section("_kprobe_blacklist")))
      1 attribute((section("___kentry+"#sym)))
      1 attribute((section(".kconfig")))
      1 attribute((section(".irqentry.text")))
      1 attribute((section(".initcall"level".init")))
      1 attribute((section("__idle_sched_class")))
      1 attribute((section("__fair_sched_class")))
      1 attribute((section("_error_injection_whitelist")))
      1 attribute((section("__dl_sched_class")))
      1 attribute((section(".discard"),unused))
      1 attribute((section(".data..vm0.pte"),aligned(PAGE_SIZE)))
      1 attribute((section(".data..vm0.pmd"),aligned(PAGE_SIZE)))
      1 attribute((section(".data..vm0.pgd"),aligned(PAGE_SIZE)))
      1 attribute((section(".data..ro_after_init")))
      1 attribute((section(".data..init_thread_info")))
      1 attribute((section(".data..init_task")))
      1 attribute((section(".data..init_irqstack")))
      1 attribute((section(".bss..decrypted")))
      1 attribute((section("__bpf_raw_tp_map")))
      1 attribute((section("action-ok"),used))
      1 attribute((section("action-ko"),used))
      1 attribute((section($old)))
      1 attribute((safe))
      1 attribute((returns_twice))
      1 attribute((require_context(x,1,999,"write")))
      1 attribute((require_context(x,1,999,"read")))
      1 attribute((require_context(x,1,999,"rdwr")))
      1 attribute((randomize_layout))
      1 attribute((patchable_function_entry(0,0)))
      1 attribute((packed,deprecated))
      1 attribute((packed,aligned(XSAVE_ALIGNMENT)))
      1 attribute((packed,aligned(PMCRAID_IOADL_ALIGNMENT)))
      1 attribute((packed,aligned(PAGE_SIZE)))
      1 attribute((packed,aligned(2048)))
      1 attribute((packed,aligned(1024)))
      1 attribute((optimize("no-stack-protector")))
      1 attribute((optimize("no-optimize-sibling-calls")))
      1 attribute((optimize("-fno-gcse")))
      1 attribute((no_sanitize_undefined))
      1 attribute((no_sanitize("undefined")))
      1 attribute((no_sanitize_thread))
      1 attribute((no_sanitize("thread")))
      1 attribute((no_sanitize("shadow-call-stack")))
      1 attribute((no_sanitize("address","hwaddress")))
      1 attribute((noreturn))__attribute((format(printf,1,2)))
      1 attribute((no_randomize_layout))
      1 attribute((nonstring))
      1 attribute((nonnull(2,3,4,5)))
      1 attribute((nonnull(2,3,4)))
      1 attribute((nonnull(1)))
      1 attribute((noderef,address_space(__user)))
      1 attribute((noderef,address_space(__rcu)))
      1 attribute((noderef,address_space(__percpu)))
      1 attribute((noderef,address_space(__iomem)))
      1 attribute((noderef))
      1 attribute((noclone))
      1 attribute((nocast))
      1 attribute((no_caller_saved_registers))
      1 attribute((name))
      1 attribute((naked))
      1 attribute((ms_abi))
      1 attribute((mode(x)))
      1 attribute((mode(TF)))
      1 attribute((mode(QI)))
      1 attribute((mode(HI)))
      1 attribute((long_call))
      1 attribute((indirect_branch("keep")))
      1 attribute((hotpatch(0,0)))
      1 attribute((hot))
      1 attribute((format(scanf,string-index,first-to-check)))
      1 attribute((format(printf,string-index,first-to-check)))
      1 attribute((format(printf,(pos_fmtstr),(pos_fmtargs))))
      1 attribute((format(printf,i,j)))
      1 attribute((format(printf,c,c+1)))
      1 attribute((format(printf,5,6)))
      1 attribute((format(printf,2,0)))
      1 attribute((format(gnu_printf,i,j)))
      1 attribute((disable_tail_calls))
      1 attribute((designated_init))
      1 attribute((deprecated(msg)))
      1 attribute((deprecated))
      1 attribute((copy(symbol)))
      1 attribute((context(x,1,1)))
      1 attribute((context(x,1,0)))
      1 attribute((context(x,0,1)))
      1 attribute((cold))
      1 attribute((cleanup(kcsan_end_scoped_access)))
      1 attribute((assume_aligned(a,##VA_ARGS)))
      1 attribute((align_value(8)))
      1 attribute((aligned(XCHAL_CP7_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP6_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP5_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP4_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP3_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP2_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP1_SA_ALIGN)))
      1 attribute((aligned(XCHAL_CP0_SA_ALIGN)))
      1 attribute((aligned(VRING_DESC_ALIGN_SIZE)))
      1 attribute((aligned(VRING_AVAIL_ALIGN_SIZE)))
      1 attribute((aligned(TSB_ENTRY_ALIGNMENT)))
      1 attribute((aligned(TPACKET_ALIGN(x))))
      1 attribute((aligned(TPACKET_ALIGNMENT)))
      1 attribute((aligned(stackalign)))
      1 attribute((aligned(sizeof(u64))))
      1 attribute((aligned(sizeof(u32))))
      1 attribute((aligned(sizeof(__u32))))
      1 attribute((aligned(sizeof(s64))))
      1 attribute((aligned(sizeof(kernel_ulong_t))))
      1 attribute((aligned(size)))
      1 attribute((aligned(PS3_BMP_MINALIGN)))
      1 attribute((aligned(_K_SS_ALIGNSIZE)))
      1 attribute((aligned(INTERNODE_CACHE_BYTES)))
      1 attribute((aligned(GRU_CACHE_LINE_BYTES)))
      1 attribute((aligned(DM_IO_MAX_REGIONS)))
      1 attribute((aligned(CVMX_CACHE_LINE_SIZE)))
      1 attribute((aligned(CRYPTO_MINALIGN)))
      1 attribute((aligned(CPPI_DESCRIPTOR_ALIGN)))
      1 attribute((aligned(ALIGN_SIZE)))
      1 attribute((aligned(alignof(u32))))
      1 attribute((aligned(alignof(structnft_expr))))
      1 attribute((aligned(alignof(structhash_alg_common))))
      1 attribute((aligned(4096)))
      1 attribute((aligned(2*sizeof(long))))
      1 attribute((aligned(2),packed))
      1 attribute((aligned(256),packed))
      1 attribute((aligned(2048)))
      1 attribute((aligned(2)))
      1 attribute((aligned(1<<(INTERNODE_CACHE_SHIFT))))
      1 attribute((aligned(1024),packed))
      1 attribute((aligned(0x80)))
      1 attribute((aligned(0x2000)))
      1 attribute((aligned))
      1 attribute((alias("vtime_account_irq_enter")))
      1 attribute((alias("thermal_genl_event_tz_trip_up")))
      1 attribute((alias("thermal_genl_event_tz_trip_add")))
      1 attribute((alias(#system"_mv")))
      1 attribute((alias(#symbol)))
      1 attribute((alias(__stringify(__s390x_sys_##sname))))
      1 attribute((alias("octeon_board_type_string")))
      1 attribute((alias("native_sched_clock")))
      1 attribute((alias(istringify(SIG_EXPR_LIST_SYM(sig,group)))))
      1 attribute((alias(#internal_name)))
      1 attribute((alias(#initfn)))
      1 attribute((alias(#exitfn)))
      1 attribute((address_space(257))
      1 attribute((address_space(256))
      1 attribute((address_space(0)))


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
