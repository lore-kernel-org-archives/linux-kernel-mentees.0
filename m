Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D53C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 17:32:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5740B2074A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 17:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCfLarjd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5740B2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C13BB85FC3;
	Mon, 30 Nov 2020 17:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Juhw9anDfdHZ; Mon, 30 Nov 2020 17:32:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3657F85F69;
	Mon, 30 Nov 2020 17:32:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EAB3C0859;
	Mon, 30 Nov 2020 17:32:41 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8421EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6E6F0203AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owpuxVQTb1CW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:32:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 2C9C520345
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 17:32:38 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z21so23134225lfe.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PE8fp+K02SctplBIINuNHMFuhz2IiCxj8rV/VVtbRc4=;
 b=XCfLarjdvF4B6QXu1MuLj8xXcDCUUSxB7m+BzaDrWlh3CDnGoStPuI+RcWZ3yVGyL7
 2hSnjlmIkLsHC4oJBR7MZCNbRnDqNl5MlJ/DK4o1ZeFVnIA37ip/TvaZgzJHYuYRiV7s
 9H/GPN74T/PzK9PDaG/KTThIKOHetiJX3hsMxAu2oX8l2DxPSnRVqxnwtub+5jo8E1Gz
 SQTBhm3Y9QK5aAIJ+TvCpckp50ifpVl+DWwiPIaPPg1QZQOaQWT0CPE+wSnxGEEV2cjc
 3x4arCyrog8OoRXESNMhEobaGSjSQAGs27Nqr+ejQhbiqcWHyBAuX3mniDtLQEPgIezF
 4wCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PE8fp+K02SctplBIINuNHMFuhz2IiCxj8rV/VVtbRc4=;
 b=emSAVuK1YBzD1UdFU1IxjXIPxIcGE89BdiY/dX2jPnvvqJtkOhYekAMKcEScN21X1T
 3yF+WNKyc5Kw27pF5CtzQqUNtQbOi1NlLKFybX9Py5orccsCYKnFK6RAK+PK4JW94ymh
 Np05dVxw2oJl40MioxXLWshiKit/ZUEdQct16u2mI+u4Jnnq5ZmzdC2ZKM83h00/Hjbs
 Zl/aaJS80FEfvPTzHq50ykTibFxSLMZxSB50NF+LQJl+coC2oh3umwjM/VWsC79mSV52
 tq/mUOJd7VgnUX10DxAe+1lEaxc+hGPC79GkaqJHXzdrmg5htB8gWccvDAabGMScQtfC
 UhJQ==
X-Gm-Message-State: AOAM533v4BPfuYkxEz5w9gKDnotF63a9fxhaaLlre1VyTTjdoNoTOdKa
 8/JyHXmeBq0OBmYqh6+MRV33tJY51/y+rYvuNrM=
X-Google-Smtp-Source: ABdhPJzqA9bsEW0q/DO4Rr8ve27Ee1mCQ0wNwOSJkd87RsHSepIgRTxq06oZzdVW0QQxi+xwWlAHHFF3CY7zBWFK9Gg=
X-Received: by 2002:ac2:51a4:: with SMTP id f4mr9808064lfk.365.1606757555939; 
 Mon, 30 Nov 2020 09:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20201130144515.8320-1-dwaipayanray1@gmail.com>
 <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
 <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
 <070109a56817288562a91dfeec74359eb948234e.camel@perches.com>
In-Reply-To: <070109a56817288562a91dfeec74359eb948234e.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 23:02:07 +0530
Message-ID: <CABJPP5BxO20-YzbTZij4gZGm4R63iG_n2kH58pSz5mgyXXwVBw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix TYPO_SPELLING
	check for words with apostrophe
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

On Mon, Nov 30, 2020 at 10:54 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-30 at 22:33 +0530, Dwaipayan Ray wrote:
> > On Mon, Nov 30, 2020 at 10:13 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Mon, 2020-11-30 at 20:15 +0530, Dwaipayan Ray wrote:
> > > > checkpatch reports a false TYPO_SPELLING warning for some words
> > > > containing an apostrophe.
> > > >
> > > > A false positive is "doesn't". Occurrence of the word causes
> > > > checkpatch to emit the following warning:
> > > >
> > > > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> > > >
> > > > Check the word boundary for such cases so that words like
> > > > "doesn't", "zig-zag", etc. aren't misinterpreted due to wrong
> > > > splitting of the word by the \b regex metacharacter.
> > > []
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > []
> > > > @@ -3106,7 +3106,7 @@ sub process {
> > > >  # Check for various typo / spelling mistakes
> > > >               if (defined($misspellings) &&
> > > >                   ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> > > > -                     while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> > > > +                     while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b(?![^\w]?[a-z@]+)|$|[^a-z@])/gi) {
> > >
> > > Wouldn't it be simpler to change the existing [^a-z@] blocks to [^a-z@'-] ?
> > >
> > Hi,
> > I tried it and it doesn't seem to work. Probably because the first
> > group already causes the
> > word to be captured. In this case `doesn'` was already captured
> > because of the \b group.
> >
> > Is the first group modification perhaps okay? Or would you suggest
> > something else?
>
> Seems to work for me:
>
> $ git diff --stat -p scripts/checkpatch.pl
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7dc094445d83..a6d4d524ae66 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3106,7 +3106,7 @@ sub process {
>  # Check for various typo / spelling mistakes
>                 if (defined($misspellings) &&
>                     ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> -                       while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> +                       while ($rawline =~ /(?:^|[^a-z@'-])($misspellings)(?:\b|$|[^a-z@'-])/gi) {
>                                 my $typo = $1;
>                                 my $typo_fix = $spelling_fix{lc($typo)};
>                                 $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
>
> $ cat t_spell.c
> // SPDX-License-Identifier: GPL-2.0-only
> void foo(void)
> {
>         //misspelled arne't word
> }
>
> $ ./scripts/checkpatch.pl -f --strict t_spell.c
> CHECK: 'arne't' may be misspelled - perhaps 'aren't'?
> #4: FILE: t_spell.c:4:
> +       //misspelled arne't word
>
> total: 0 errors, 0 warnings, 1 checks, 5 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
>
> t_spell.c has style problems, please review.
>
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
>

Sorry I think i explained wrong. For words like "doesn't", it still
has the same problem.
With your suggested modification in place:

$ ./scripts/checkpatch.pl
0001-checkpatch-fix-TYPO_SPELLING-check-for-words-with-ap.patch
--codespell
WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?
#9:
A false positive is "doesn't". Occurrence of the word causes

WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?
#15:
"doesn't", "zig-zag", etc. aren't misinterpreted due to wrong

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
