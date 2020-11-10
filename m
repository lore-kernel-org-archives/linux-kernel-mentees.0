Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235D2C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:22:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4F620867
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZUhwl31"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4F620867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C3B486FED;
	Tue, 10 Nov 2020 15:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0eQUHsWcJ1Y; Tue, 10 Nov 2020 15:22:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 39BD286FDA;
	Tue, 10 Nov 2020 15:22:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E206C088B;
	Tue, 10 Nov 2020 15:22:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25AFBC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D65D92291C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zGsnzsKt5vAJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:22:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 52E8C2001F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:22:22 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id p7so14490736ioo.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KUNhkQQewlD2MGItlssqhiJdpbT/m+k0qO0y5EDnaNI=;
 b=KZUhwl31HlUIR7XCnE5CVQzsEl+Rs4mePwsEE6YoRUgerGvuAOVkWW6N4WWSVPbDFT
 BqyErn5iYc2TchAEo8h1cgECBJPKMwC1/L5abo2r45O6cxrJ1TXy67xhws+FODl4gymH
 a/hbrGqniUp4xL/jOPTxFOiop0xsILJeS6BNqVubvx42p0eFqD/bllTbhBURUNCcmJ1+
 LuDvZAmu/EE0PkaX/wdaQT+EM1v/Y18AxYCJVpgdvBOLq7sx2/tnMvuOhUqIhCVZ81Ak
 kMd94fufINDqV9o0uS1ntDHWDb48CkeBB0DP05l7uEoEikcCugTtstDccbPpNf2ucxx2
 LZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KUNhkQQewlD2MGItlssqhiJdpbT/m+k0qO0y5EDnaNI=;
 b=NPihMutTjpqafAk+Fdd5wxJS8HHNlJNcOTjzAe6S8TLqs8O3pZ7bvWR1/sOpVq38nI
 fnKN0W8DB8vKRYngGpJy1t4pTMGtrwDykWGEUGCOm/Rnvzp5cMMXgtWISGF7Omr2nz44
 BxpNebzGrj4KSQ7sMxij2ynyHl/Bc3AxVUufz9orWVUtuIytLFbpBhyvWUOYAeT1LRvg
 XN+wwH/dGh9xaE69d6NexIyuS3CDGU5juS/d80Le1KTkuGMjXcMcGlCk22KxGrxDmRHs
 OAcRBhggF95VAHRlEu6LxNamKUWupwj6W7vaLerUvDWeUbG4muWHXC+fTkQDFrgmnE0Q
 rmig==
X-Gm-Message-State: AOAM531+pnCOJQpc6rLXZZAvJSQJ0snnfCy3Eo24X32ibNTRI9qSHGl2
 fGcLqiQtMEeYoIEunwOb1orPTnA7RW2VVXlAbJ0=
X-Google-Smtp-Source: ABdhPJxwL75PqcqfnYcXY/4al2Yh2hxMUib/zt9QlskfhDht4OzxrUVqY3b9dOT9p17oFrEujRCuXG9Mb1OQeOegtq4=
X-Received: by 2002:a5d:970e:: with SMTP id h14mr14202432iol.183.1605021741564; 
 Tue, 10 Nov 2020 07:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20201110130602.22359-1-yashsri421@gmail.com>
 <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
 <4291189c-4c65-4637-9b24-4ae00ac8a1a8@gmail.com>
In-Reply-To: <4291189c-4c65-4637-9b24-4ae00ac8a1a8@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Nov 2020 16:22:11 +0100
Message-ID: <CAKXUXMzdMuXaY02Lz2fvMyGBB+5vNxtT4XJemEGaZdYcXzrR0g@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	MISSING_SIGN_OFF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Nov 10, 2020 at 4:13 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 10/11/20 7:30 pm, Lukas Bulwahn wrote:
> > On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently checkpatch warns us if there is no 'Signed-off-by' line
> >> for the patch.
> >>
> >> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
> >> Completely remove --version flag") reports this error:
> >>
> >> ERROR: Missing Signed-off-by: line(s)
> >>
> >> Provide a fix by adding a Signed-off-by line corresponding to the author
> >> of the patch before the patch separator line. Also avoid this error for
> >> the commits where some typo is present in the sign off.
> >>
> >> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
> >> for quirk") we get missing sign off as well as bad sign off for:
> >>
> >> Siganed-off-by: Tony Lindgren <tony@atomide.com>
> >>
> >> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
> >> signature and avoid MISSING_SIGN_OFF
> >>
> >> Suggested-by: Joe Perches <joe@perches.com>
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >> ---
> >> This patch was made after applying https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
> >> and my last changes at https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
> >>
> >>  scripts/checkpatch.pl | 18 +++++++++++++++---
> >>  1 file changed, 15 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index cb46288127ac..2deffd0c091b 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -2404,6 +2404,8 @@ sub process {
> >>
> >>         my $last_blank_line = 0;
> >>         my $last_coalesced_string_linenr = -1;
> >> +       my $patch_separator_linenr = 0;
> >> +       my $non_standard_signature = 0;
> >>
> >>         our @report = ();
> >>         our $cnt_lines = 0;
> >> @@ -2755,6 +2757,10 @@ sub process {
> >>                 if ($line =~ /^---$/) {
> >>                         $has_patch_separator = 1;
> >>                         $in_commit_log = 0;
> >> +                       # to add missing sign off line before diff(s)
> >> +                       if($patch_separator_linenr == 0) {
> >> +                               $patch_separator_linenr = $linenr;
> >
> > Well are you sure linenr is correct? (As I wrote, I do not know, but
> > you should know.)
> >
> > I think you would need to create a patch for testing your feature
> > where multiple things are fixed within the same patch and then check
> > if the fix is added at the right place.
> >
>
> I checked the fix over following patch.
>
> I have modified the patch such that it has co-developed-by as the
> author(nominal patch author warning, which requires this line to be
> deleted)
>
> Also 'occuring', which is a typo(where the typo needs to be replaced)
>
> It works as expected.
>

Well to really check if it works as expected, you need to have a test
patch where a fix adds multiple lines into the fixed patch before the
line you try to record.

Then, fixlinenr and linenr are probably more than just 1 line apart,
but really multiple lines apart and only if you record the right
variable it really works.

Other than that, it is all good.

Lukas

> This is the modified patch I used for testing:
>
> From f68e7927212fa0dbe44c00c144b643c87ab0cf43 Mon Sep 17 00:00:00 2001
> From: Michael Ellerman <mpe@ellerman.id.au>
> Date: Sat, 23 Feb 2019 20:30:50 +1100
> Subject: [PATCH] Revert "powerpc/book3s32: Reorder _PAGE_XXX flags to
> simplify
>  TLB handling"
>
> This reverts commit 78ca1108b10927b3d068c8da91352b0f4cd01fc5.
>
> It is causing boot failures with qemu mac99 in at least some
> configurations.occuring
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/book3s/32/hash.h | 8 ++++----
>  arch/powerpc/kernel/head_32.S             | 5 ++++-
>  arch/powerpc/mm/hash_low_32.S             | 6 ++++--
>  3 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/hash.h
> b/arch/powerpc/include/asm/book3s/32/hash.h
> index a5907ea4fb40..2a0a467d2985 100644
> --- a/arch/powerpc/include/asm/book3s/32/hash.h
> +++ b/arch/powerpc/include/asm/book3s/32/hash.h
> @@ -17,9 +17,9 @@
>   * updating the accessed and modified bits in the page table tree.
>   */
>
> -#define _PAGE_RW       0x001   /* PP = x1: user write access allowed */
> -#define _PAGE_USER     0x002   /* PP = 1x: usermode access allowed */
> -#define _PAGE_HASHPTE  0x004   /* software: hash_page has made an HPTE
> for this pte */
> +#define _PAGE_PRESENT  0x001   /* software: pte contains a translation */
> +#define _PAGE_HASHPTE  0x002   /* hash_page has made an HPTE for this pte */
> +#define _PAGE_USER     0x004   /* usermode access allowed */
>  #define _PAGE_GUARDED  0x008   /* G: prohibit speculative access */
>  #define _PAGE_COHERENT 0x010   /* M: enforce memory coherence (SMP
> systems) */
>  #define _PAGE_NO_CACHE 0x020   /* I: cache inhibit */
> @@ -27,7 +27,7 @@
>  #define _PAGE_DIRTY    0x080   /* C: page changed */
>  #define _PAGE_ACCESSED 0x100   /* R: page referenced */
>  #define _PAGE_EXEC     0x200   /* software: exec allowed */
> -#define _PAGE_PRESENT  0x400   /* software: pte contains a translation */
> +#define _PAGE_RW       0x400   /* software: user write access allowed */
>  #define _PAGE_SPECIAL  0x800   /* software: Special page */
>
>  #ifdef CONFIG_PTE_64BIT
> diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
> index e7a5b312a7db..fdb587c96a80 100644
> --- a/arch/powerpc/kernel/head_32.S
> +++ b/arch/powerpc/kernel/head_32.S
> @@ -522,6 +522,7 @@ InstructionTLBMiss:
>         andc.   r1,r1,r0                /* check access & ~permission */
>         bne-    InstructionAddressInvalid /* return if access not permitted */
>         /* Convert linux-style PTE to low word of PPC-style PTE */
> +       rlwimi  r0,r0,32-1,30,30        /* _PAGE_USER -> PP msb */
>         ori     r1, r1, 0xe05           /* clear out reserved bits */
>         andc    r1, r0, r1              /* PP = user? 2 : 0 */
>  BEGIN_FTR_SECTION
> @@ -589,7 +590,8 @@ DataLoadTLBMiss:
>          * we would need to update the pte atomically with lwarx/stwcx.
>          */
>         /* Convert linux-style PTE to low word of PPC-style PTE */
> -       rlwinm  r1, r0, 0, 31, 31       /* _PAGE_RW -> PP lsb */
> +       rlwinm  r1,r0,32-10,31,31       /* _PAGE_RW -> PP lsb */
> +       rlwimi  r0,r0,32-1,30,30        /* _PAGE_USER -> PP msb */
>         rlwimi  r0,r0,32-1,31,31        /* _PAGE_USER -> PP lsb */
>         ori     r1,r1,0xe04             /* clear out reserved bits */
>         andc    r1,r0,r1                /* PP = user? rw? 2: 3: 0 */
> @@ -668,6 +670,7 @@ DataStoreTLBMiss:
>          * we would need to update the pte atomically with lwarx/stwcx.
>          */
>         /* Convert linux-style PTE to low word of PPC-style PTE */
> +       rlwimi  r0,r0,32-1,30,30        /* _PAGE_USER -> PP msb */
>         li      r1,0xe05                /* clear out reserved bits & PP lsb */
>         andc    r1,r0,r1                /* PP = user? 2: 0 */
>  BEGIN_FTR_SECTION
> diff --git a/arch/powerpc/mm/hash_low_32.S b/arch/powerpc/mm/hash_low_32.S
> index f4294edeca9d..d94fef524ef5 100644
> --- a/arch/powerpc/mm/hash_low_32.S
> +++ b/arch/powerpc/mm/hash_low_32.S
> @@ -310,9 +310,11 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)
>
>  _GLOBAL(create_hpte)
>         /* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
> +       rlwinm  r8,r5,32-10,31,31       /* _PAGE_RW -> PP lsb */
>         rlwinm  r0,r5,32-7,31,31        /* _PAGE_DIRTY -> PP lsb */
> -       and     r8, r5, r0              /* writable if _RW & _DIRTY */
> -       rlwimi  r5, r5, 32 - 1, 31, 31  /* _PAGE_USER -> PP lsb */
> +       and     r8,r8,r0                /* writable if _RW & _DIRTY */
> +       rlwimi  r5,r5,32-1,30,30        /* _PAGE_USER -> PP msb */
> +       rlwimi  r5,r5,32-2,31,31        /* _PAGE_USER -> PP lsb */
>         ori     r8,r8,0xe04             /* clear out reserved bits */
>         andc    r8,r5,r8                /* PP = user? (rw&dirty? 2: 3): 0 */
>  BEGIN_FTR_SECTION
> --
> 2.17.1
>
>
> Thanks
> Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
