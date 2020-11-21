Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C226BC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 16:16:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29CE420936
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 16:16:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9TomPt0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29CE420936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BF0DA20402;
	Sat, 21 Nov 2020 16:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMLPDrdHWse3; Sat, 21 Nov 2020 16:16:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A91BA20392;
	Sat, 21 Nov 2020 16:16:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90915C1825;
	Sat, 21 Nov 2020 16:16:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A445C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2A42B203E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nd1WrVErNbrr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:16:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 33C6120392
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 16:16:38 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z21so17791156lfe.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 08:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8w+Wr9fDw5ti7QkLbmDpavOjHqMohazwP0UdDcbE68=;
 b=q9TomPt0LQrsxYeAlqtPf6pzsPjQNrtL7YmL0JhmgCHxihVtZVY4l+K9KEhAAR2IJU
 fPtNWFiFOUi3ELXuauHZ2xXSzma/n6d+3KuiKg6srn6JRuUBG/R9POUxMxENKDygHmtH
 iBx79q2qJR3n84MSkTGjMhSmbmiRKNr0Ucs1Isvq/7i5G1js8TvZPQeHqF/EemPIUQ0J
 AeuM39EcfdOy1Qy63zPiyliZ2m59UBYg7RWFVex/pfLEgO0QKDyIYXjkpt+WZXtVjz4f
 u2+DgcCNsGNhY5aPrtAVy57VgRnX9ZHdz+HRemrhv07b90O6hHpfXOg05yK5wSkmTYKb
 OAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8w+Wr9fDw5ti7QkLbmDpavOjHqMohazwP0UdDcbE68=;
 b=cplfbucXj6ijJ1HvLsBShsphXNdn2E5sAa+qBC20gLEyDNMz0aAwV7VW8y3xNHIbi/
 cPMqAR7NKS56rDKycUNwKoHkzzV8sOTXUiTYH91NdeF7/2VuZ0dteLJVu+8SGXbV9gOK
 hotBM2aXbwytInwIDVxxd+gFIkZkNAUXo6WiO/gPeGr7/9qER6jvKwXRbYH14lELqhG9
 Os5UxlDbyaHom9xNHs+tKqXcxlTGVjG1h9GWm0c8LT2kzgmbNEUUqjiXJ1TtuXw4SnfC
 wa3enfw8E/ode9xNkJ+tMb7yN+kQkM4Q4bSGMgAJqzA/bSGE+NMD+dYwvHgMofK05I4f
 G4Dg==
X-Gm-Message-State: AOAM533Q+VK4DQkDn2biU1IsWmKdVDZcpaFq/XxDIGubim5PM9PdNYHH
 B5lSKwemweKnRTGD0UKCc8hK+vVjfhcHe//E3wE=
X-Google-Smtp-Source: ABdhPJyub2yGhkOwUvwWte+TGmqdrwkdfaNUez4M2ANI7mM1IkoprD8F3Uk3DuP3LtKpxe/1slbyGPlOZecLSivBnag=
X-Received: by 2002:a19:8110:: with SMTP id c16mr9705259lfd.372.1605975395929; 
 Sat, 21 Nov 2020 08:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20201121080900.17297-1-dwaipayanray1@gmail.com>
 <CAKXUXMxpfrXX2_xOmf0oePfh3=xcc_wHuc002tWacF98WkgK3Q@mail.gmail.com>
 <CABJPP5DiiE8fzQVnsu9Kk-m7bYt=NRE8s1FdAE2Xc8TkRtUayw@mail.gmail.com>
 <CAKXUXMx6J9xoiDEBkGZiSNVg24k6AWbFzFz-G8Uvh6btHFdSdw@mail.gmail.com>
In-Reply-To: <CAKXUXMx6J9xoiDEBkGZiSNVg24k6AWbFzFz-G8Uvh6btHFdSdw@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 21 Nov 2020 21:46:04 +0530
Message-ID: <CABJPP5Aoa=GxyfphNwzmEigK0i8tu+EkZgWYwgSvudHp+84mgA@mail.gmail.com>
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

On Sat, Nov 21, 2020 at 6:43 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sat, Nov 21, 2020 at 12:56 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > On Sat, Nov 21, 2020 at 3:15 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > On Sat, Nov 21, 2020 at 9:09 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > > >
> > > > Provide fix option to INCLUDE_LINUX check to replace asm
> > > > includes.
> > > >
> > > > Macros of type:
> > > >  #include <asm/percpu.h>
> > > >
> > > > are corrected to:
> > > >  #include <linux/percpu.h>
> > > >
> > >
> > > The patch itself looks okay; but should this fix option not be limited
> > > to lines where content is added?
> > >
> >
> > Hi,
> > I think the warning itself is emitted for lines which are added.
> > So I think the fix option even now will change those added lines only.
> >
> > > Further we need to investigate:
> > > - is this still a valid rule?
> > > - is this rule and the rationale documented somewhere?
> >
> > I think the rule is valid. I was going through the documentation files
> > and in several examples I saw that the linux headers are preferred.
> >
> > Like in Documentation/core-api/local_ops.rst:
> >
> > 91:
> >    #include <linux/percpu.h>
> >    #include <asm/local.h>
> >
> > In Documentation/trace/kprobes.rst:
> >
> > 362:
> > #include <linux/kprobes.h>
> > int register_kprobe(struct kprobe *kp);
> >
> > 400:
> > #include <linux/kprobes.h>
> > #include <linux/ptrace.h>
> > int pre_handler(struct kprobe *p, struct pt_regs *regs);
> >
> > 410:
> > #include <linux/kprobes.h>
> > #include <linux/ptrace.h>
> > void post_handler(struct kprobe *p, struct pt_regs *regs,
> >   unsigned long flags);
> >
> > and so on...
> >
> > I didn't find any explicit mention about absolutely preffering
> > linux headers over asm headers whenever it exists.
> >
> > > - how many rule violations currently exist in the kernel repository?
> > > - are there known exceptions for some files in some directories?
> >
> > There are exceptions to this.
> > Like in include/linux/percpu.h,
> > #include <asm/percpu.h> needs to be included. as linux/percpu wraps
> > over asm/percpu. So these kinds are exempted from the check and
> > checkpatch doesn't report any warning.
> >
> > I did find some violations like in arch/csky/kernel/probes/decode-insn.h:
> > CHECK: Consider using #include <linux/kprobes.h> instead of <asm/kprobes.h>
> > #7: FILE: arch/csky/kernel/probes/decode-insn.h:7:
> > +#include <asm/kprobes.h>
> >
> > I found one commit which fixed one such case in the kernel:
> > commit ca5999fde0a17 ("mm: introduce include/linux/pgtable.h")
> > It says "The include/linux/pgtable.h is going to be the home of
> > generic page table
> >  manipulation functions."
> >
> > So I think it means that future additings should use <linux/pgtable.h>
> > instead of
> > <asm/pgtable.h>
> >
> > I think the ARCH_INCLUDE_LINUX also deserves a --fix option similarly.
> >
> > What do you think? Should I continue with this?
> >
>
> Yes, that is good. Thanks for the investigation.
>
> You can consider to:
>
> - also fix the cases where this rule is violated and send patches to
> the maintainers.
> - add some documentation on this rule.
>
Okay sure I will try doing that.

I am just sending this patch unchanged to Joe and LKML to have their
review. If it is ok, I will get on with the next task.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
