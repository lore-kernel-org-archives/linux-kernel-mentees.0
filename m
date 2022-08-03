Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5895C19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 09:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6300F40A95;
	Wed,  3 Aug 2022 09:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6300F40A95
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=c2CT/HK4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uaRZ5rNHdgUl; Wed,  3 Aug 2022 09:22:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F3BC240A90;
	Wed,  3 Aug 2022 09:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3BC240A90
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2E64C0033;
	Wed,  3 Aug 2022 09:22:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33C5BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0124781BB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0124781BB0
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=c2CT/HK4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yn-_cfZx5_RM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:22:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A2D81B9A
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85A2D81B9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659518528; cv=none; d=zohomail.in; s=zohoarc; 
 b=SzxExxF41r8xJbjYBAxHqwNZWS/Ssh/9WBvq+2Gtd00hAo198E4JT31rAYkmDw86v78xUmcR0tU5SeGrAQ4sAiKk8xE46IM52zwuM16uwooNb6YSAHZ2gUph69jtFU9afOlIVgG9pwsM9msi9tcowhygGUUS1zQCtsF42RiVa6M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659518528;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=q93C79sxRnF4sFFm2T+KqOAm96p2y3qDReUpm9q0LJ0=; 
 b=cNC7Z7LQKOI1+CahMUn2YzdJnnyEz8ElHhuk9YAcIV32Lh1WENQINuuBp1Z55+zFrOeg1qZwP9wzsiVzzT+rIuPAE7sovxnRaqXoLcVivx5ZcCqymk11neHxfda/2t4qAFoIuUQAb9rrKSWit9PNTU6eYkTAk4b28KwsjE0LRts=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659518528; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=q93C79sxRnF4sFFm2T+KqOAm96p2y3qDReUpm9q0LJ0=;
 b=c2CT/HK4lMxHAskVAhHR2ECPKlso2vtKy8o2kk0F81AFTb/TqGY9jEvdTcNW5KUv
 kOhFXFNGY/6Moo7L5NTdPvmj6b9oZEtCTKKI1D1uU9KaTodb7Nm40sa/izK2uBBdje9
 duUjDI8a2HmIwOiVPljDKYx0095Uwoyb7nyYVNnE=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659518517817516.3995624024521;
 Wed, 3 Aug 2022 14:51:57 +0530 (IST)
Date: Wed, 03 Aug 2022 14:51:57 +0530
To: "Ingo Molnar" <mingo@kernel.org>
Message-ID: <18263030220.8a990e82436929.3216192040531777412@siddh.me>
In-Reply-To: <Yuo7A0KYoNnbgwWT@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
 <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
 <Yuo2UkkyaYtZ3rMZ@gmail.com>
 <18262ed2459.44b0d74d434377.3690496800292832933@siddh.me>
 <Yuo7A0KYoNnbgwWT@gmail.com>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 03 Aug 2022 14:38:19 +0530  Ingo Molnar <mingo@kernel.org> wrote:
> 
> * Siddh Raman Pant <code@siddh.me> wrote:
> > There is no reason why allmodconfig would trigger the warning, [...]
> 
> Well, unless I'm misreading your changelog, all the warning needs to 
> trigger is CONFIG_CPUMASK_OFFSTACK=y.
> 
> > as it has CONFIG_CPUMASK_OFFSTACK=y, but the warning is because of the 
> > other case.
> 
> What 'other case'? I've re-read the discussion and don't see it, but maybe 
> I'm a bit daft this morning ...
 
No, the warning is happening because CONFIG_CPUMASK_OFFSTACK is not set. This
is because in that case cpumask_var_t type is not a pointer, and thus the var
can never be NULL, which leads gcc to warn us when comparing with NULL.

The chain of events are like:

        #ifdef CONFIG_CPUMASK_OFFSTACK
                typedef struct cpumask *cpumask_var_t;
        #else
                typedef struct cpumask cpumask_var_t[1];
        endif

        cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
        ...
        if (node_to_cpumask_map[node] == NULL) {


The fix works because:

        #ifdef CONFIG_CPUMASK_OFFSTACK
                static inline bool cpumask_available(cpumask_var_t mask)
                {
                        return mask != NULL;
                }
        #else
                static inline bool cpumask_available(cpumask_var_t mask)
                {
                        return true;
                }
        endif


The conditional definitions, as pointed out earlier, can be seen from line 700
of include/linux/cpumask.h file.

> > Did you try the config file I had linked to earlier?
> 
> Yes, and it didn't trigger the warning.
> 
> Thanks,
> 
>     Ingo
> 

 Thanks,
 Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
