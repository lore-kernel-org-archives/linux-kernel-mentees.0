Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D84C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:14:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EA720659
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 15:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUSSnGkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39EA720659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A01FE1FD7D;
	Tue, 10 Nov 2020 15:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmJJwXSa3QVw; Tue, 10 Nov 2020 15:13:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC3122002D;
	Tue, 10 Nov 2020 15:13:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6A40C088B;
	Tue, 10 Nov 2020 15:13:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7EEAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DC23F87404
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUq+DSqOxB0n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:13:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 05AE4873E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 15:13:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c20so11699494pfr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 07:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nOvGtpcEtvsict9NKfH3M7Vrh3TAtwJdADfwuHa2o60=;
 b=hUSSnGkSVoYO5TJsx+1km5LSmZMfdnhC9jAZ35Q4jMKyxWjPF488098yjoEgtm+UZG
 4YuySfLmNnJSZd9Ah9XRkfTsiwB3znSvrVlmf7fEJF3/4X3ytRl66XrIu/7gAN0frUxI
 ZJFAxNEi03KlyvOvHGV9xrASlYmEXp52QzteCBIzRndEXRokELXmf5HWOwGXKr89RPKG
 jhA37NAcJ5J/ijxLlrsBCQrgtOrwChbdhmy3GxxUnGXxSEGJm6hBBjrMJsFD+AFPvb7j
 PTlOCLsAnwsDHVMFwPnSPGlEZ+nTx1i9k2J7GzMyrFwoQjDClg45N5MaBg13h820Hrgm
 BUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nOvGtpcEtvsict9NKfH3M7Vrh3TAtwJdADfwuHa2o60=;
 b=F9+KiK2WX8TTDlkvnrjq1upsGPyJqibE//+gQrbqB7LPWHYW7m6D7zGxwzXewed0A6
 99UztM+Va0QJ2j9mCBNvJxSkHYNXe7ubN3V4o0PeL1T+JPMjCQobBDYq3cyL8B4tGj6w
 zDkqJz/HmWiut6GES9psn3OPRsWqcWWrZ4K3WhxEag4m1+0dV8kmyJqrP+WKmgAU9kHv
 NM1Agc6Tvu4pdWrW4GxS9lA8pevNy7RbNmg1lSAcgRHc93axU5G6XpPD3T43y05j3lvb
 YT66eq6XIHCJRW7dEjxFZF2vuCkf18DocxV9/UabtOSxV17AkKJ3s533mbqeWqdONAvH
 X/Og==
X-Gm-Message-State: AOAM533jGoQiqPfvMhZypG4XCD/+eWMO5C1FRp58lDE+D7hR0lmcsRvv
 csFlqMVWGTvx8M9f8JgC5zRdWZZPvrHFdA==
X-Google-Smtp-Source: ABdhPJxzXsFKE9b9oowE271+XoQxm00fBxKOEY7/9RAYUvgD1bTU4krjXeyJi4tU63NZRW0pk1Kdgg==
X-Received: by 2002:a17:90a:fe07:: with SMTP id
 ck7mr160116pjb.212.1605021231126; 
 Tue, 10 Nov 2020 07:13:51 -0800 (PST)
Received: from ?IPv6:2402:3a80:413:8adf:79d0:1679:313c:70a2?
 ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.gmail.com with ESMTPSA id f21sm13467028pga.32.2020.11.10.07.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 07:13:50 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201110130602.22359-1-yashsri421@gmail.com>
 <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <4291189c-4c65-4637-9b24-4ae00ac8a1a8@gmail.com>
Date: Tue, 10 Nov 2020 20:43:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMxVfW3nDzGqhK2pwD6fVtcmSNK-USLtNaLVK_+E_6Smpg@mail.gmail.com>
Content-Language: en-US
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

On 10/11/20 7:30 pm, Lukas Bulwahn wrote:
> On Tue, Nov 10, 2020 at 2:06 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>>
>> Currently checkpatch warns us if there is no 'Signed-off-by' line
>> for the patch.
>>
>> E.g., running checkpatch on commit 9ac060a708e0 ("leaking_addresses:
>> Completely remove --version flag") reports this error:
>>
>> ERROR: Missing Signed-off-by: line(s)
>>
>> Provide a fix by adding a Signed-off-by line corresponding to the author
>> of the patch before the patch separator line. Also avoid this error for
>> the commits where some typo is present in the sign off.
>>
>> E.g. for commit 8cde5d5f7361 ("bus: ti-sysc: Detect omap4 type timers
>> for quirk") we get missing sign off as well as bad sign off for:
>>
>> Siganed-off-by: Tony Lindgren <tony@atomide.com>
>>
>> Here it is probably best to give BAD_SIGN_OFF warning for Non-standard
>> signature and avoid MISSING_SIGN_OFF
>>
>> Suggested-by: Joe Perches <joe@perches.com>
>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
>> ---
>> This patch was made after applying https://lore.kernel.org/linux-kernel-mentees/20201108100632.75340-1-dwaipayanray1@gmail.com/
>> and my last changes at https://lore.kernel.org/linux-kernel-mentees/20201108134317.25400-1-yashsri421@gmail.com/
>>
>>  scripts/checkpatch.pl | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index cb46288127ac..2deffd0c091b 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2404,6 +2404,8 @@ sub process {
>>
>>         my $last_blank_line = 0;
>>         my $last_coalesced_string_linenr = -1;
>> +       my $patch_separator_linenr = 0;
>> +       my $non_standard_signature = 0;
>>
>>         our @report = ();
>>         our $cnt_lines = 0;
>> @@ -2755,6 +2757,10 @@ sub process {
>>                 if ($line =~ /^---$/) {
>>                         $has_patch_separator = 1;
>>                         $in_commit_log = 0;
>> +                       # to add missing sign off line before diff(s)
>> +                       if($patch_separator_linenr == 0) {
>> +                               $patch_separator_linenr = $linenr;
> 
> Well are you sure linenr is correct? (As I wrote, I do not know, but
> you should know.)
> 
> I think you would need to create a patch for testing your feature
> where multiple things are fixed within the same patch and then check
> if the fix is added at the right place.
> 

I checked the fix over following patch.

I have modified the patch such that it has co-developed-by as the
author(nominal patch author warning, which requires this line to be
deleted)

Also 'occuring', which is a typo(where the typo needs to be replaced)

It works as expected.

This is the modified patch I used for testing:

From f68e7927212fa0dbe44c00c144b643c87ab0cf43 Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 23 Feb 2019 20:30:50 +1100
Subject: [PATCH] Revert "powerpc/book3s32: Reorder _PAGE_XXX flags to
simplify
 TLB handling"

This reverts commit 78ca1108b10927b3d068c8da91352b0f4cd01fc5.

It is causing boot failures with qemu mac99 in at least some
configurations.occuring
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/book3s/32/hash.h | 8 ++++----
 arch/powerpc/kernel/head_32.S             | 5 ++++-
 arch/powerpc/mm/hash_low_32.S             | 6 ++++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/hash.h
b/arch/powerpc/include/asm/book3s/32/hash.h
index a5907ea4fb40..2a0a467d2985 100644
--- a/arch/powerpc/include/asm/book3s/32/hash.h
+++ b/arch/powerpc/include/asm/book3s/32/hash.h
@@ -17,9 +17,9 @@
  * updating the accessed and modified bits in the page table tree.
  */

-#define _PAGE_RW	0x001	/* PP = x1: user write access allowed */
-#define _PAGE_USER	0x002	/* PP = 1x: usermode access allowed */
-#define _PAGE_HASHPTE	0x004	/* software: hash_page has made an HPTE
for this pte */
+#define _PAGE_PRESENT	0x001	/* software: pte contains a translation */
+#define _PAGE_HASHPTE	0x002	/* hash_page has made an HPTE for this pte */
+#define _PAGE_USER	0x004	/* usermode access allowed */
 #define _PAGE_GUARDED	0x008	/* G: prohibit speculative access */
 #define _PAGE_COHERENT	0x010	/* M: enforce memory coherence (SMP
systems) */
 #define _PAGE_NO_CACHE	0x020	/* I: cache inhibit */
@@ -27,7 +27,7 @@
 #define _PAGE_DIRTY	0x080	/* C: page changed */
 #define _PAGE_ACCESSED	0x100	/* R: page referenced */
 #define _PAGE_EXEC	0x200	/* software: exec allowed */
-#define _PAGE_PRESENT	0x400	/* software: pte contains a translation */
+#define _PAGE_RW	0x400	/* software: user write access allowed */
 #define _PAGE_SPECIAL	0x800	/* software: Special page */

 #ifdef CONFIG_PTE_64BIT
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index e7a5b312a7db..fdb587c96a80 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -522,6 +522,7 @@ InstructionTLBMiss:
 	andc.	r1,r1,r0		/* check access & ~permission */
 	bne-	InstructionAddressInvalid /* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
+	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
 	ori	r1, r1, 0xe05		/* clear out reserved bits */
 	andc	r1, r0, r1		/* PP = user? 2 : 0 */
 BEGIN_FTR_SECTION
@@ -589,7 +590,8 @@ DataLoadTLBMiss:
 	 * we would need to update the pte atomically with lwarx/stwcx.
 	 */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwinm	r1, r0, 0, 31, 31	/* _PAGE_RW -> PP lsb */
+	rlwinm	r1,r0,32-10,31,31	/* _PAGE_RW -> PP lsb */
+	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
 	rlwimi	r0,r0,32-1,31,31	/* _PAGE_USER -> PP lsb */
 	ori	r1,r1,0xe04		/* clear out reserved bits */
 	andc	r1,r0,r1		/* PP = user? rw? 2: 3: 0 */
@@ -668,6 +670,7 @@ DataStoreTLBMiss:
 	 * we would need to update the pte atomically with lwarx/stwcx.
 	 */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
+	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
 	li	r1,0xe05		/* clear out reserved bits & PP lsb */
 	andc	r1,r0,r1		/* PP = user? 2: 0 */
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/mm/hash_low_32.S b/arch/powerpc/mm/hash_low_32.S
index f4294edeca9d..d94fef524ef5 100644
--- a/arch/powerpc/mm/hash_low_32.S
+++ b/arch/powerpc/mm/hash_low_32.S
@@ -310,9 +310,11 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)

 _GLOBAL(create_hpte)
 	/* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
+	rlwinm	r8,r5,32-10,31,31	/* _PAGE_RW -> PP lsb */
 	rlwinm	r0,r5,32-7,31,31	/* _PAGE_DIRTY -> PP lsb */
-	and	r8, r5, r0		/* writable if _RW & _DIRTY */
-	rlwimi	r5, r5, 32 - 1, 31, 31	/* _PAGE_USER -> PP lsb */
+	and	r8,r8,r0		/* writable if _RW & _DIRTY */
+	rlwimi	r5,r5,32-1,30,30	/* _PAGE_USER -> PP msb */
+	rlwimi	r5,r5,32-2,31,31	/* _PAGE_USER -> PP lsb */
 	ori	r8,r8,0xe04		/* clear out reserved bits */
 	andc	r8,r5,r8		/* PP = user? (rw&dirty? 2: 3): 0 */
 BEGIN_FTR_SECTION
-- 
2.17.1


Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
