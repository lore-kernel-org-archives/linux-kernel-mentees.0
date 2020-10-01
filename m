Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79678C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 10:25:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03CA20848
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 10:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="harpW++e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E03CA20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 682AB86AFD;
	Thu,  1 Oct 2020 10:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YaKMQMUnJ04; Thu,  1 Oct 2020 10:25:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03B738654C;
	Thu,  1 Oct 2020 10:25:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E19C4C0889;
	Thu,  1 Oct 2020 10:25:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9B11C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D0AEC86992
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:25:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLAEuWqbRLe9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:25:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2005F8698E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:25:00 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id m7so5041574oie.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mDX/GGoaMgQ260TXrBLDWLavBVa469ZgAwHHg+DxBME=;
 b=harpW++e7OcWb1zneneFGto4sEirrle+n0zU+OEQNJytGYA4IJ+tbtA5iM9A1/M28U
 Zypyqaj3DG3VAW72rdhZJWh9ao2FEX7Fe6cFDofoPHu1GP+n2v6o7WL2CAefZLvNN1jy
 EgLBCIWdYAbfvzNZwndpfkIqVYo5/H8fKaKpg22fb4rpT8RsZ77mM/Dm5PKHoBOStfN+
 c0ndSXgPJGtxsljm+twEZ/QaOL99AKevyiD/gWLl/LIAKRBzhEA1RWcQKzUxLrpxQcou
 65nOc+79alI70SDarzDVficA1Abvj1MK5cQsocwI3oRicUpeecgEoSBimSDd07HhKvZz
 spXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mDX/GGoaMgQ260TXrBLDWLavBVa469ZgAwHHg+DxBME=;
 b=AJWWLfLxeEa48SzP5eR9C/okVCan0AxITqEGDq/5doWpvnE1qsqgg87F/7vTnbiS/0
 GtDvCiyLYmxOvfFgZpVVH3nDPyN3MQ+Tvz9V4q619lm6tAkjW7JrItwCCm+dIAIBbbHi
 MQUpJ8qH/WBqM1FVkR47fCKvMQgEpch5euoOC47+8sWvLuzbTFXz8pIgZ5BJ6PyAx/OK
 ++o8x8roSVGpIbxX0vdpmlsNOMt/kSb1vAxx1Od/fSGcIwdLipXwqEeLqS9/ZsPPJ8T6
 lOtRMnaEkECexWPNZJew5fLRo/F3GQl71oYbriYaBWo5GCX23bjTSOO+jd4KDwRQFw8J
 yrtw==
X-Gm-Message-State: AOAM532lAxO0E3hrC2gLsyR5JGdGZFvh7Nh/f1lqbtuzBeusZ71cg6ev
 jnmMsQmuWHYQQKrLcORJoSI1ipEKTSq3d0Jn0JE=
X-Google-Smtp-Source: ABdhPJxYrxcgNzqKrRJ7Nnz+g63iUbLoB8MEwMmmZMHxOKMia5Paa2zZZpnB6OL1o/2jMYm4U2ci16LpIXPIkmve64A=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr3623459oih.117.1601547899061; 
 Thu, 01 Oct 2020 03:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200930210333.166006-1-dwaipayanray1@gmail.com>
 <20200930210333.166006-2-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010011014540.24571@felia>
In-Reply-To: <alpine.DEB.2.21.2010011014540.24571@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 1 Oct 2020 15:54:36 +0530
Message-ID: <CABJPP5CXxj_7uknihKU8NM295WvcVaMCtJ7hqMzWD+5XcBmR-g@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Theodoros Chatziioannidis <sdi1600197@di.uoa.gr>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 2/2] checkpatch: fix
	multi-statement macro checks
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

On Thu, Oct 1, 2020 at 1:52 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Thu, 1 Oct 2020, Dwaipayan Ray wrote:
>
> > Checkpatch.pl doesn't have a check for excluding while (...) {...}
> > blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.
> >
> > For example, running checkpatch.pl on the file mm/access.c in the
> > kernel generates the following error:
> >
> > ERROR: Macros with complex values should be enclosed in parentheses
> > +#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)        \
> > +     while (len >= sizeof(type)) {                                   \
> > +             __get_kernel_nofault(dst, src, type, err_label);        \
> > +             dst += sizeof(type);                                    \
> > +             src += sizeof(type);                                    \
> > +             len -= sizeof(type);                                    \
> > +     }
> >
> > The error is misleading for this case. Enclosing it in a paranthesis
> > doesn't make any sense.
> >
>
> s/a paranthesis/parentheses/
>

I trusted checkpatch too much. Seems spelling.txt does not have an entry
for parentheses. (maybe not the most common spelling error).

> > Checkpatch already has an exception list for such common macro types.
> > Added a new exception for while (...) {...} style blocks to the same.
> > This effectively fixed the wrong error message.
> >
>
> This seems easier to understand and to judge than the other patch.
>
> We will still need an evaluation, though. Theodoros, maybe you can help us
> here.
>
> Dwaipayan, looks good to me. Do you fix up the spelling mistake and then
> send that patch to Joe and lkml?
>

Thanks, I will do that. Sending just this patch for now. The other one
needs more testing. I will send in the report once done.

> Is it just the tab setting in my email client or is there a tab too much
> that it does not align with the other comments?

Yes, it was an extra tab. The tabs at that particular place are too
non-uniform, causing confusion :(

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
