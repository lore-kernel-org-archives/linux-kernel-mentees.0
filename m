Return-Path: <SRS0=uW6w=HT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042F6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 15:46:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0CF964DF3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 15:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0CF964DF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75D62869F8;
	Wed, 17 Feb 2021 15:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHISt6ILvsdx; Wed, 17 Feb 2021 15:46:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65356866AE;
	Wed, 17 Feb 2021 15:46:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ED7EC0174;
	Wed, 17 Feb 2021 15:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E29EFC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1408600CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipXUGuiFsJMK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:46:11 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id DDA846EE12; Wed, 17 Feb 2021 15:46:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5D9B600CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 15:46:09 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id k22so16115490ljg.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+g26s0aSTGaLnN/gduWXkSeKUiKej72AeVs+y0HyD/Y=;
 b=t2VoafJleFp20lwXCFmM5iSb5m9wFPosnlyI5nerNlgLygDZDt0/5pzDjixNoyQ8SD
 0bah+i2BhxdfCvc6kPDbRXRxo5ZROLJ8KAU8V102wpo92ia5noLZtfHDItdrQmTGGsoI
 8s/HCmiNUaavVCdAPyuCRkDPXPLrJUMC0Wd0EGVTgP9JD0H6WLTzCj/cu0lH4A4v3Nta
 1EnyoMcbVAzE7eKJcL0CsHAngq53cJPaBZGSO7kG1AZ78+MdqCClD6n5QQrzZJYqfP3Z
 bxCpOX/vdPO2vdfte0B/7ynwyJR5Oh4VdDbJX8JIjeuMRZAp1aq7wTQcwc4Pele7LgRM
 3KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+g26s0aSTGaLnN/gduWXkSeKUiKej72AeVs+y0HyD/Y=;
 b=GisdyiiXAV+C8jPf7U6j0R53QGDg5gHP8XBtme/1hWFDL0ea8hYjes1aMLy6KI68Wn
 Fc1Z7kp41eg5Z93o+r5gCh/twAipQmHp5nE7oJzQp3s10F71bE+KaQ59BdMxf1pmS34G
 zBDJN9oZ7Ps1hAe4hjnGLrT1Q5Wqw4txU6bYyvyESUwsrKuAOfVaP79LsXha+DABcxpk
 JlLdrADmJ0RX9BcPLVIFMmr8sPaEcTGiLu102SrSI0lXOT5Bb2Lhs253TTnAob34vsk7
 lPG9C4t8smpWvSQVuyq8l39TH3CQyGgWjLjBo7rSow0mTyMpKShC9KC+Nz6j9HKmqx8i
 IjVw==
X-Gm-Message-State: AOAM530z+vDYC/2OKeEgJyfX0AOyUQkpKUprD4eopV+BykGilEk5W4sw
 g0LsyifPuZW4orN+aQ/CstYjMxTu7CxsqXEQjaE=
X-Google-Smtp-Source: ABdhPJwkxjQwo9r5TcgZguEoGBqCrOTVBwSTpuJDf5PTRuTXglNtaaPdorCmbJ35G1PXZB2gjM2gn864+Jn3yUBSHlc=
X-Received: by 2002:a2e:985a:: with SMTP id e26mr7402280ljj.370.1613576767331; 
 Wed, 17 Feb 2021 07:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
 <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
 <CABJPP5CaAavDMWy8xmQ8Bxpf5549v8fqOz8Zi=g7g6ZGnCAVmg@mail.gmail.com>
 <4d6856b33cc870ac655d801d066f04af6ebadcd7.camel@perches.com>
In-Reply-To: <4d6856b33cc870ac655d801d066f04af6ebadcd7.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 17 Feb 2021 21:16:08 +0530
Message-ID: <CABJPP5A+g1_jCLPPgSc4wu8O7birW4yBE_9+HJusLFHOsS3Eug@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Wed, Feb 17, 2021 at 4:07 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2021-02-16 at 19:48 +0530, Dwaipayan Ray wrote:
> > On Sun, Feb 14, 2021 at 10:27 PM Joe Perches <joe@perches.com> wrote:
> > > On Sat, 2021-02-13 at 18:45 +0530, Dwaipayan Ray wrote:
> > > > Add documentation for kernel script checkpatch.pl.
> > > > This documentation is also parsed by checkpatch to
> > > > enable a verbose mode.
> > > >
> > > > The message types in checkpatch are documented with rst
> > > > field lists. A total of 33 checkpatch type descriptions
> > > > are added.
> > >
> > > Alphabetic ordering isn't that great for these entries.
> > > Please group them by use:
> > >
> > > whitespace/code layout style:
> > > SPACING, TRAILING_WHITESPACE, LINE_SPACING
> []
> > Could I get some comment on this grouping for types:
> >
> > Allocation Style: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTIPLY
> >
> > API Usage: ARCH_DEFINES, ARCH_INCLUDE_LINUX, ARRAY_SIZE, AVOID_BUG,
> >                     AVOID_EXTERNS, AVOID_L_PREFIX, BIT_MACRO, CONSIDER_KSTRTO
> >
> > Comment Style: BLOCK_COMMENT_STYLE, C99_COMMENTS
> >
> > Commit Message: BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SYMBOL,
> >                               COMMIT_MESSAGE, MISSING_SIGN_OFF,
> > NO_AUTHOR_SIGN_OFF
> >
> > Comparison Style: ASSIGN_IN_IF, BOOL_COMPARISON, COMPARISON_TO_NULL,
> >                                CONSTANT_COMPARISON
> >
> > Spacing & Brackets: ASSIGNMENT_CONTINUATIONS, BRACES, BRACKET_SPACE,
> >                                   CODE_INDENT, CONCATENATED_STRING,
> > LINE_SPACING,
> >                                   TRAILING_WHITESPACE
> >
> > Others: CAMELCASE, CONFIG_DESCRIPTION
> >
> > This is what I have done till now. Any suggestions would be nice and if it looks
> > okay I would like to send the v4 in.
>
> Looks OK.
>
> Please make sure you at least include SPACING in the spacing & brackets
> descriptions.
>
> It also seems like ref links to Documentation/process/coding-style.rst
> <section> (3.1 in the SPACING case) should be used more frequently.
>
> It'd be 'nice' to somehow use sortable tables with some grouping
> attribute for these groups, but I have no idea if that's feasible with
> .rst restrutured text files.
>

I too didn't find anything like that. Seems like static tables are the most
that's feasible with sphynx. But here it might not look well.

> Perhaps simplify the checkpatch code a bit for the --terse and --verbose
> output.
>
> Maybe something like:
> ---
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 869d80397f9f..07566cb3b3f8 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
>
> @@ -292,15 +292,16 @@ GetOptions(
>
>  help(0) if ($help);
>
> +die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
> +die "$P: --verbose canot be used with --terse\n" if ($verbose && $terse);
> +
>  list_types(0) if ($list_types);
>

Sure will do this. Sending you the updated patch in a while.

Thanks!
--Dwaipayan
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
