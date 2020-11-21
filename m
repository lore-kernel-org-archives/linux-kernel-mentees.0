Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3690FC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 11:56:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8C822226
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 11:56:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuYR9mvL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8C822226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 54D7286FC6;
	Sat, 21 Nov 2020 11:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtHN1+WpJNHy; Sat, 21 Nov 2020 11:56:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 670A586F80;
	Sat, 21 Nov 2020 11:56:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A22BC163C;
	Sat, 21 Nov 2020 11:56:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34F75C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 267BF86A84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgeYdolb9gVl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:56:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 43BED86546
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 11:56:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d20so1355227lfe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7+LYU9q7NiBTrMXH+rgpiyuJkNeH/LJd5VOdMz3FxQ=;
 b=ZuYR9mvL4HZ70PrlFOub+pLUsgLb0isgZySKQPqf3ibGyx6M4HJ0/Gi8MIFHIBDPga
 VJFCSWnl3vlhMH2k0344f3Ix0It3Jvkn5PYeQSKJ0ZNUmk42pkotrxguKhkwm4a8dCY5
 625IIGA+Kl1kus4QETWlwhCfEshf4P+ctbOgCvvzMseWz7Zab+TBDrdDyhvwQEntj8VV
 TWY5w/RnQdBYQtzOG1u7xZ376339OjRw/0cw2mwDiYcrH0oaSR4l5ciDSxpFX3GC/3eu
 zb0U353vzkILTsH0NyOfiYXW3m3AHmKw2hdRe2xbsEM9JI6jukR4Oxyd14gN5P6XIlJQ
 yE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7+LYU9q7NiBTrMXH+rgpiyuJkNeH/LJd5VOdMz3FxQ=;
 b=cNWNKrHFb6Y1ODd0BoAQaVbGfR1UZdryb4Ccnv0BO5lhpRjFdXvvv5tTOvlQziobcS
 FKnRX2cHR3x9TJKfw+Mdd/fB+AGa+F4KxUxXAgyKQaK895McyiJB15/E/7W8ir30yasY
 Uk9C+fnMe3GIozC0x7n1MlrV8bYZEXDMhpnkETaD4qQl+ClMTNChhv2F4Ego34iDl+or
 Ph9z8Ji9TMCubRgOS3QRftIL+pCpeu8qMk8KhwvAIH3ZrxdL/OdGlRbDFSE93vH+bfxP
 jSgl3I2jB14FBRR/qDTH0AurTqPnhQoB4bmoEU14tVPTfbRS5DE9uXVg/V8YvWe2pVGE
 ylgw==
X-Gm-Message-State: AOAM530vZ7BoOnYy5LFaS9iNBi/BpniXayuPge14HGC9SdDVcq0Ibyx6
 b/cUJ6CUDb1biRSC3UM9QNlbWen5YXkNQfsiaog=
X-Google-Smtp-Source: ABdhPJydxP3p006fU4uV4pgsE8LebIg2SrdIISkmoYAy1C2HoVRYBxmmIxlsi+DX+vT946ziueoLvK5e9muEiYnBUG8=
X-Received: by 2002:a19:2d4:: with SMTP id 203mr9814519lfc.303.1605959777220; 
 Sat, 21 Nov 2020 03:56:17 -0800 (PST)
MIME-Version: 1.0
References: <20201121080900.17297-1-dwaipayanray1@gmail.com>
 <CAKXUXMxpfrXX2_xOmf0oePfh3=xcc_wHuc002tWacF98WkgK3Q@mail.gmail.com>
In-Reply-To: <CAKXUXMxpfrXX2_xOmf0oePfh3=xcc_wHuc002tWacF98WkgK3Q@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 21 Nov 2020 17:25:46 +0530
Message-ID: <CABJPP5DiiE8fzQVnsu9Kk-m7bYt=NRE8s1FdAE2Xc8TkRtUayw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add --fix option for
	INCLUDE_LINUX
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

On Sat, Nov 21, 2020 at 3:15 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sat, Nov 21, 2020 at 9:09 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Provide fix option to INCLUDE_LINUX check to replace asm
> > includes.
> >
> > Macros of type:
> >  #include <asm/percpu.h>
> >
> > are corrected to:
> >  #include <linux/percpu.h>
> >
>
> The patch itself looks okay; but should this fix option not be limited
> to lines where content is added?
>

Hi,
I think the warning itself is emitted for lines which are added.
So I think the fix option even now will change those added lines only.

> Further we need to investigate:
> - is this still a valid rule?
> - is this rule and the rationale documented somewhere?

I think the rule is valid. I was going through the documentation files
and in several examples I saw that the linux headers are preferred.

Like in Documentation/core-api/local_ops.rst:

91:
   #include <linux/percpu.h>
   #include <asm/local.h>

In Documentation/trace/kprobes.rst:

362:
#include <linux/kprobes.h>
int register_kprobe(struct kprobe *kp);

400:
#include <linux/kprobes.h>
#include <linux/ptrace.h>
int pre_handler(struct kprobe *p, struct pt_regs *regs);

410:
#include <linux/kprobes.h>
#include <linux/ptrace.h>
void post_handler(struct kprobe *p, struct pt_regs *regs,
  unsigned long flags);

and so on...

I didn't find any explicit mention about absolutely preffering
linux headers over asm headers whenever it exists.

> - how many rule violations currently exist in the kernel repository?
> - are there known exceptions for some files in some directories?

There are exceptions to this.
Like in include/linux/percpu.h,
#include <asm/percpu.h> needs to be included. as linux/percpu wraps
over asm/percpu. So these kinds are exempted from the check and
checkpatch doesn't report any warning.

I did find some violations like in arch/csky/kernel/probes/decode-insn.h:
CHECK: Consider using #include <linux/kprobes.h> instead of <asm/kprobes.h>
#7: FILE: arch/csky/kernel/probes/decode-insn.h:7:
+#include <asm/kprobes.h>

I found one commit which fixed one such case in the kernel:
commit ca5999fde0a17 ("mm: introduce include/linux/pgtable.h")
It says "The include/linux/pgtable.h is going to be the home of
generic page table
 manipulation functions."

So I think it means that future additings should use <linux/pgtable.h>
instead of
<asm/pgtable.h>

I think the ARCH_INCLUDE_LINUX also deserves a --fix option similarly.

What do you think? Should I continue with this?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
