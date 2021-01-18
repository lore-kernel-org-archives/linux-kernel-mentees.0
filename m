Return-Path: <SRS0=9dud=GV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D785C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 05:25:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A042231F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 05:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A042231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 461E88560C;
	Mon, 18 Jan 2021 05:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NBcPlaUKe4RZ; Mon, 18 Jan 2021 05:25:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9AD685604;
	Mon, 18 Jan 2021 05:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A9DEC088B;
	Mon, 18 Jan 2021 05:25:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07D38C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 05:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E8BD0866DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 05:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ga2lNYRlVtBW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 05:25:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BE321866C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 05:25:53 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q1so30557195ion.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Jan 2021 21:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y3zk51Zk7KzsrVc6RPEI7gwpPYACwxdM2EJ170BGYig=;
 b=nxSdLGSuW/vjbe8rTUrLUFqCVxOcTRKNZoU/QvOuFpM+mvouioODGLjBgke9Fz+jPv
 EqdarkTozSmmU0CNpZDBmVWxwAjCZDH16LByIDKfwrB9SMkn+L3fUekqIXamR+8suXTE
 soTapL0tMatnOT1IhbgTMe/XmuyD7HEznAOynTchwKJtVAv2RwO70T3g5IeWBYVJTbYl
 ONrhVdi3iUvWgyTVWOZlPJockvxinnlbm+M+QBxUgbNCGosx7677JhzxYLjdLKF3jF+n
 g20e7k/AHWbcv3+oWefQ7ScArKOm+/PHbtXpr2iLncvU8trOf6KdvPXdQvmug27UjHTH
 LO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3zk51Zk7KzsrVc6RPEI7gwpPYACwxdM2EJ170BGYig=;
 b=sGXGJ4xH86bVahyUgg192xSfjuAAMOh8bp2mv7FoTfcSve4DF/iEzduKyrTfsV4Vs0
 O24Rk/LJYgPxD7ncSgA73LHmX4/tgFlRS9cT/f8h5ycTIBTDdLQMO6q2Nhmlh70vwsjA
 gJApoc3NrOyZG2WYLLdupF99cIzC4DYLe7W9FUcLWiVXwYZxy1fFbtlsq882p5Rw+8py
 uI0uOGi96Din74pydJvgBecM/HwzYbvIP4Caaps3rYOwC35OZVyq8EAma0BD06/8fh+p
 FVbzdl2GkEd0cfgmvBfp2Z2WnjHiqF5MGRDe/otTjh8llLefYM4TkcZYJ5BANbcZ0ybK
 1Ncg==
X-Gm-Message-State: AOAM531W7iPB+EAB39k2gYl+jGf6pONRAXS1eyljk8FdGOElLoszRz+6
 71EJTHLrekCxfYEshGpBtTv6F/2Vwwvid+xgIuU=
X-Google-Smtp-Source: ABdhPJwCtte4U+FtRalnqZ2GS4mQRnnSpoL6DCClpf57w+ctFZnAEQ/uvXzLFIFE12zdzqImGU5UGcQL4VhIkfbQF+g=
X-Received: by 2002:a5e:8d15:: with SMTP id m21mr14299301ioj.114.1610947552953; 
 Sun, 17 Jan 2021 21:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20210116122220.27261-1-yashsri421@gmail.com>
 <CABJPP5CxhBreFsM_YZvr3V4_jOdrRVkUX22E2bEwnL+Wf=nYJQ@mail.gmail.com>
 <86deb3fe-0b48-da0c-5f95-448fe9d97c19@gmail.com>
 <CABJPP5D3NNUbEPrdAT0LkHzKcigc1N3TJ+q+pL6YnCCvxFKgNg@mail.gmail.com>
 <3c27662f-e6b3-81ed-f52e-2bd2d62984ae@gmail.com>
In-Reply-To: <3c27662f-e6b3-81ed-f52e-2bd2d62984ae@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 18 Jan 2021 06:25:54 +0100
Message-ID: <CAKXUXMxA=QrANbxudRZPp90Ox7JqjSt_QNek2=xbUuypA527aA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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

On Sat, Jan 16, 2021 at 3:57 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 16/1/21 7:08 pm, Dwaipayan Ray wrote:
> > On Sat, Jan 16, 2021 at 6:48 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 16/1/21 6:13 pm, Dwaipayan Ray wrote:
> >>> On Sat, Jan 16, 2021 at 5:52 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>>>
> >>>> Local symbols prefixed with '.L' do not emit symbol table entries, as
> >>>> they have special meaning for the assembler.
> >>>>
> >>>> '.L' prefixed symbols can be used within a code region, but should be
> >>>> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
> >>>>
> >>>> Add a new check to emit warning on finding the usage of '.L' symbols
> >>>> in '.S' files.
> >>>>
> >>>> Suggested-by: Mark Brown <broonie@kernel.org>
> >>>> Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
> >>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >>>> ---
> >>>>  scripts/checkpatch.pl | 6 ++++++
> >>>>  1 file changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >>>> index 7030c4d6d126..87d96a039e64 100755
> >>>> --- a/scripts/checkpatch.pl
> >>>> +++ b/scripts/checkpatch.pl
> >>>> @@ -3590,6 +3590,12 @@ sub process {
> >>>>                         }
> >>>>                 }
> >>>>
> >>>> +# check for .L prefix local symbols in .S files
> >>>> +               if ($realfile =~ /\.S$/ && $line =~ /\.L\S+/) {
> >>>> +                       WARN("AVOID_L_PREFIX",
> >>>> +                            "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
> >>>> +               }
> >>>> +
> >>>>  # check we are in a valid source file C or perl if not then ignore this hunk
> >>>>                 next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
> >>>>
> >>>> --
> >>>> 2.17.1
> >>>
> >>> From an earlier conversation:
> >>>>   So basically, you can use an .L symbol *inside* a function or a code
> >>>>   segment, you just can't use the .L symbol to contain the code using a
> >>>>   SYM_*_START/END annotation pair.
> >>>
> >>> So this check warns on all uses of the .L prefix
> >>> I think that might be incorrect.
> >>>
> >>
> >> Hey Dwaipayan,
> >> I think you missed this:
> >>
> >>> - If the line contains ".L" prefixed symbol, give user a
> >>> warning/check, so that they can ensure that the line is not inside
> >>> START/END block. (As we may not be able to make sure about the same,
> >>> if the START/END line is not in the patch; otherwise we could run a
> >>> while loop)
> >>
> >
> > Then again what percentage of users actually intended to use
> > it in a local scope? That is actually a correct usage and checkpatch will
> > keep complaining - there will be no way to remove the warning.
> >
> >> At best, I think, we could use $context_function, which should work
> >> for patches, but again, this will not work for files.
> >>
> >> Do you have any suggestions?
> >>
> >
> > Does $context_function work for .S files? Am not sure.> But again that will not help much.
> >
> > The main concern is not to allow .L prefix within a
> > SYM_*_START...SYM_*_END annotation pair.
> >
> > That means something like this will be disallowed:
> >
> > SYM_FUNC_START(memset)
> >     .L ... etc
> > SYM_FUNC_END(memset)
> >
>
> Yes, $context_function works inside .S files.
> So, I think if it is inside one of the SYM_*_START contexts, it should
> work for us.
>
> > One possible way can be to extract the context after getting
> > a SYM_*_START. Following which the lines could be checked
> > for a .L preifx.
> > > But complexity wise I dont know if it would be worth it.
> >
>
> I think, we could do this for files.
>

Just run it on the current kernel source and find out how many cases
would generally match.

If it is just a few hundred occurrences, use a simple rule, not a
complex one that hardly works on patches.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
