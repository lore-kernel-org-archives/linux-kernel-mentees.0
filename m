Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A82C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 13:13:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0523C22206
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 13:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HM8uDic1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0523C22206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B495286BB3;
	Sat, 21 Nov 2020 13:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJfkQmGdaJuA; Sat, 21 Nov 2020 13:13:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3951886BA1;
	Sat, 21 Nov 2020 13:13:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AC68C1825;
	Sat, 21 Nov 2020 13:13:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3EC3C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 13:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BD44C87491
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 13:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfH5v2kxe0tg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 13:13:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CF15287473
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 13:13:01 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id k8so575975ilr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 05:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oJoI/rmP4YQQaPzTB9y5+rT/WTtpsRlfibFgJL8p1Wo=;
 b=HM8uDic1BiLpfrKF5EGXsZvfgZQoy88MC2vI6UsMriQwnP6WutpG746S5mL9G5e5fM
 DZsunqAeVnrlykZ0Tomp0IzG845mOnw4W7jfMmc3XcW6l4IEQ5AI+D0K2PomwsHMDZcm
 3dVt2AxbaeGObsMhBHHYGNUz6NPOY38DdfGqfao3qCCkGDWc9CUUwgRZV+66hf6gOlMo
 0xRaR73qSWOG3AN+0By4Kza3gqPRymh8xJxo3JZbEeVVgDukBEcn/flPnKR/iSWgSFLE
 Hcacg4EkP33xt7guR2ZPqYBNhdeSMl32UtWMmmKNfIjYu8VBnOuOhTHW+sj/PJ4D7R9t
 AUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJoI/rmP4YQQaPzTB9y5+rT/WTtpsRlfibFgJL8p1Wo=;
 b=aCjNS9bAZGcBPNpSSzQjkj+hIUg8w+W0CX2BNaAlMNA1aEZDSskXdtf+aJS/o33vKf
 TR08L1uHwoPLZYDP7Dt3vEU2XuT5hdt/ID5CR3CzmnUKMYFVoptDAGfipAsixEu7Id9g
 lGxWMqTkCNYrkaHptbv5X2RaZoO43JOc1urZxLZktfixYQX9tEOF5I+1cryn3SpwT/Mo
 tW5os+g/URgqWpSM1gUothgOSGGaaPBOk/w9OsZq89S0YGGZm8jjFBc8+tHDRSTUh399
 EbD7K5ihWIQ7DqUY3SLgGxZe8G4zIKAmdozCJdlYYv2l1QxULGHnW3EiUKF5ozNEvV0Q
 JXeg==
X-Gm-Message-State: AOAM533ADOWHu1UbPCZsIk84v9XT6+MlQIH1xsYcB5nTNR9w37t2V8nM
 F83YdTQ4A4S9IPQ+pULqsclIsFlxReb/0l+DlpU=
X-Google-Smtp-Source: ABdhPJy8Mj6SouU02wnMliDWQ9owGxVgtXr7kskVmwfHltczGe0sCmAg0uNHOKcCG0v5CuKNREYZI+XUzWp574Bh36I=
X-Received: by 2002:a92:600e:: with SMTP id u14mr27749373ilb.221.1605964381160; 
 Sat, 21 Nov 2020 05:13:01 -0800 (PST)
MIME-Version: 1.0
References: <20201121080900.17297-1-dwaipayanray1@gmail.com>
 <CAKXUXMxpfrXX2_xOmf0oePfh3=xcc_wHuc002tWacF98WkgK3Q@mail.gmail.com>
 <CABJPP5DiiE8fzQVnsu9Kk-m7bYt=NRE8s1FdAE2Xc8TkRtUayw@mail.gmail.com>
In-Reply-To: <CABJPP5DiiE8fzQVnsu9Kk-m7bYt=NRE8s1FdAE2Xc8TkRtUayw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 21 Nov 2020 14:12:50 +0100
Message-ID: <CAKXUXMx6J9xoiDEBkGZiSNVg24k6AWbFzFz-G8Uvh6btHFdSdw@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Sat, Nov 21, 2020 at 12:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sat, Nov 21, 2020 at 3:15 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Sat, Nov 21, 2020 at 9:09 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > Provide fix option to INCLUDE_LINUX check to replace asm
> > > includes.
> > >
> > > Macros of type:
> > >  #include <asm/percpu.h>
> > >
> > > are corrected to:
> > >  #include <linux/percpu.h>
> > >
> >
> > The patch itself looks okay; but should this fix option not be limited
> > to lines where content is added?
> >
>
> Hi,
> I think the warning itself is emitted for lines which are added.
> So I think the fix option even now will change those added lines only.
>
> > Further we need to investigate:
> > - is this still a valid rule?
> > - is this rule and the rationale documented somewhere?
>
> I think the rule is valid. I was going through the documentation files
> and in several examples I saw that the linux headers are preferred.
>
> Like in Documentation/core-api/local_ops.rst:
>
> 91:
>    #include <linux/percpu.h>
>    #include <asm/local.h>
>
> In Documentation/trace/kprobes.rst:
>
> 362:
> #include <linux/kprobes.h>
> int register_kprobe(struct kprobe *kp);
>
> 400:
> #include <linux/kprobes.h>
> #include <linux/ptrace.h>
> int pre_handler(struct kprobe *p, struct pt_regs *regs);
>
> 410:
> #include <linux/kprobes.h>
> #include <linux/ptrace.h>
> void post_handler(struct kprobe *p, struct pt_regs *regs,
>   unsigned long flags);
>
> and so on...
>
> I didn't find any explicit mention about absolutely preffering
> linux headers over asm headers whenever it exists.
>
> > - how many rule violations currently exist in the kernel repository?
> > - are there known exceptions for some files in some directories?
>
> There are exceptions to this.
> Like in include/linux/percpu.h,
> #include <asm/percpu.h> needs to be included. as linux/percpu wraps
> over asm/percpu. So these kinds are exempted from the check and
> checkpatch doesn't report any warning.
>
> I did find some violations like in arch/csky/kernel/probes/decode-insn.h:
> CHECK: Consider using #include <linux/kprobes.h> instead of <asm/kprobes.h>
> #7: FILE: arch/csky/kernel/probes/decode-insn.h:7:
> +#include <asm/kprobes.h>
>
> I found one commit which fixed one such case in the kernel:
> commit ca5999fde0a17 ("mm: introduce include/linux/pgtable.h")
> It says "The include/linux/pgtable.h is going to be the home of
> generic page table
>  manipulation functions."
>
> So I think it means that future additings should use <linux/pgtable.h>
> instead of
> <asm/pgtable.h>
>
> I think the ARCH_INCLUDE_LINUX also deserves a --fix option similarly.
>
> What do you think? Should I continue with this?
>

Yes, that is good. Thanks for the investigation.

You can consider to:

- also fix the cases where this rule is violated and send patches to
the maintainers.
- add some documentation on this rule.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
