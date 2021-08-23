Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87B3C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 07:18:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8032761184
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 07:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8032761184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BF580DA2;
	Mon, 23 Aug 2021 07:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY84FxmmMlFr; Mon, 23 Aug 2021 07:18:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5470B80D9F;
	Mon, 23 Aug 2021 07:18:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 300E2C0010;
	Mon, 23 Aug 2021 07:18:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08A55C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 07:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E489A40235
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 07:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ro_FmhwzB3_T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 07:18:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E50A040144
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 07:18:44 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id g26so32379715ybe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 00:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XXq4o/WDmRlMMoz0qwWNnDRStjjN1NNoixKw0ftgRTs=;
 b=IB59anU0uHyEQSudHQDbdJPWmCDYWgVjZ2zTXH1IgZ3663VrN2bGIBabzMCJhCLOOw
 ynHQ7To13E08DXIAsTMwyWWJRt42qkrL/mp1nWWrEPY/TbgD8O5vMzk+sgXnuuFSRjF4
 w+5DBW5XsVMjRcHfaONqZ6/JQhrftdVVf8j8MLbS2sDo9X6HXONlTToVSBEdsw6a4RGO
 hR32GNfkDe1Aogc3FWn3i1E1lZS0RnKUyhRlagMxRH0KJE575Grz7PTHca6ei/EQBhdP
 Vyi9Z9JiQ5fe5QddaDR27E2vPLxs+QjmNr+6wh3413yxlmwzIrrGFkIHufp6TNOTHann
 PyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XXq4o/WDmRlMMoz0qwWNnDRStjjN1NNoixKw0ftgRTs=;
 b=hNKEq2Z9fzPXAwQomhPYDAuDVXB2v0qZ3xGr0JQC401j6clWRNlbiAoZc5HVFGDWXS
 V1zNnUootmEdMm51c69usfnaROpzfaQeXMGP05MKyR8NqP2zF/jIP0iNn62ofHZgHPzX
 tQG/hGBLQcySfSAhCKhAxdzQj8r5hNr+mNrnNrUvkOKvBLS5rUivaP+w6+fVP8Jm2/3J
 s+6bbpBL90y0sMNOqAApXU4eseYK+TmK+3ziLjFC1Wn7bwCjlSCwaf7AfYYY+wzfPIRu
 szKuSBarC3frBtTTUDW2UhvoDS7+GahUtT5ajCFLSjJkxxw0x2B4CZ0Ph99V0iiG8yLu
 Y8cA==
X-Gm-Message-State: AOAM532TeY6whHUMsFiVwj0s/mFi8+6Z5LgDqQRpmRPn19VPqlAxnSNn
 dYAyNI+lUpAFZ1u+5nFBTMFTmsm4w1RXzBdAbw8=
X-Google-Smtp-Source: ABdhPJwMXYYXeiTcnM0LqIJPed+8RwbYWuiDwHuxNXlMMaBQz2Bf1Cyu8j0qd0TmMkWNK1XwtbuVDVqYBsNAnnVe+0U=
X-Received: by 2002:a25:505:: with SMTP id 5mr42246352ybf.157.1629703123789;
 Mon, 23 Aug 2021 00:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5BCdB7CdV4q9vw7tz=8ZOWry+aoyiqpzoXqriY2-ONEhw@mail.gmail.com>
 <20210806201026.2537-1-utkarshverma294@gmail.com>
 <CABJPP5DF6ki2Q6PoO42sKY=N_GkJvmnjEubOEJfZDn7_ccQ11w@mail.gmail.com>
In-Reply-To: <CABJPP5DF6ki2Q6PoO42sKY=N_GkJvmnjEubOEJfZDn7_ccQ11w@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Aug 2021 09:18:44 +0200
Message-ID: <CAKXUXMynfZjh6ZKTmePJVCh_FK4+VhZDYZMzXPT21HLMwWr2xA@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: checkpatch: Add SYMBOLIC_PERMS message
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, Aug 22, 2021 at 7:52 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sat, Aug 7, 2021 at 1:41 AM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > Add a new message type SYMBOLIC_PERMS under the 'Permissions'
> > subsection. Users should use octal permission bits instead of their
> > symbolic macro names.
> >
>
> Like Lukas said, the reader could use a better explanation as to why octal
> permission bits are preferred.
>

I think this patch could deserve another iteration addressing my comment.
If that then reads worse than before, we simply take this patch, but
we should at least give it a try.

The referred email discussion can be probably quickly summarized
(without the more emotional aspect of the discussion).

Lukas

> However, I think this message shall be fine too as it's pretty much
> self-explanatory.
>
> So, with that:
>
> Reviewed-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > ---
> >  Documentation/dev-tools/checkpatch.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> > index f0956e9ea..009957cda 100644
> > --- a/Documentation/dev-tools/checkpatch.rst
> > +++ b/Documentation/dev-tools/checkpatch.rst
> > @@ -957,6 +957,12 @@ Permissions
> >      Permission bits should use 4 digit octal permissions (like 0700 or 0444).
> >      Avoid using any other base like decimal.
> >
> > +  **SYMBOLIC_PERMS**
> > +    Permission bits in the octal form are more readable and easier to
> > +    understand than their symbolic counterparts.
> > +
> > +    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
> > +
> >
> >  Spacing and Brackets
> >  --------------------
> > --
> > 2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
