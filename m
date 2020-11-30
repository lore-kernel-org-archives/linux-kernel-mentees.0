Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DD3C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 18:27:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571A120705
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 18:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nev2YXyv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 571A120705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCEBE85D9B;
	Mon, 30 Nov 2020 18:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Jvtzvaog1fI; Mon, 30 Nov 2020 18:27:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75CF485C9D;
	Mon, 30 Nov 2020 18:27:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6233FC163C;
	Mon, 30 Nov 2020 18:27:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8F3EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A81B985C9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ik8BPP0UpRYf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:27:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BF2F485C9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 18:27:29 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id t6so23480745lfl.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 10:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cC0JGbl2FGZrNCis0SJgSoGv2mflRVQSSrcIdCJ2JcQ=;
 b=nev2YXyvTVDb0ljD384vUGMR6QzpyxuCfM2yn+rG+oSk+Xinj+BGUZybSKPmenCrg5
 j6HUuw8EeIWk0MYJ0WbW1HzMCOgoVO7+URgdzDAzqOp10lVADlYmGnEaHAr7XHY0gecm
 NTD8LkfoMCkmb7htRA7Erh2NIllZLIO4fnhQQYO7mlmp1X5wIN4xWvpb9zLXc0y7b0ZU
 upCH2yFtc5dP5PKqI3vGo4prrBFmWzg2I2K1Dmnefcku3HZHzWA0ui3tHJx+/Ju7Kx5N
 iO26HyNZlEPimIkgGnnZPFR8+cobNHtAhLzGvkL9j9t87PokJgch0KKVi23j6ohS8U0g
 TQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cC0JGbl2FGZrNCis0SJgSoGv2mflRVQSSrcIdCJ2JcQ=;
 b=uQsCmoSdsTGRViW3kmE4ogtQDT+Y8YUdg9mX8wRMmKilScachMv0/lmUOiOC8mbzri
 96Iz/8XIQfCYM5w+vg7OowdUsLpwyj6IOFfXf6AJRyBWuSIuYZdBIaPNN95wN5Vl0et8
 BLFKTBU9Zyp2Od+vEswUzRQ5PyS1ntuU6pSLS4qzWcLcm8UuWqTgyiY+7SPGMrXzH8xV
 oUiS+1cLzVlG1vGh1ELeUXE/Uql2Pd33j/+tl94taVwVaeNulOG+Lqf8+At4w1QdKgKu
 Y3jKoAqPwmZSbEbehNhVFaEA5/8A8hRAGkwPpMtd8aUlS/0xSIdCNFVoPLaXXAxWlzwV
 2DnQ==
X-Gm-Message-State: AOAM533bkv2LfGdrStiOEqc1RzydW97MTBJGgCAeVblpLDdplDFJwFnt
 cTpKHJFgL+TZ7XPTRCRIZ5YV/joTBxeOt7E5zW8=
X-Google-Smtp-Source: ABdhPJywAt5REPStdIScNwTHzYyKNVPnyRgjV9ew+rDqRf/xeI8LRCcI9Gp/v3eNFQFhesnAEaOC1QgTD6lNUM2LEBA=
X-Received: by 2002:ac2:4199:: with SMTP id z25mr10153236lfh.148.1606760847697; 
 Mon, 30 Nov 2020 10:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20201130144515.8320-1-dwaipayanray1@gmail.com>
 <c8eeab847fc09368ce270ea3e06ea0bbbd7d1b7f.camel@perches.com>
 <CABJPP5BLjbx3FbvB3nAOiHfkRLUo7s0n-vboE+AXJqrZXseUNQ@mail.gmail.com>
 <070109a56817288562a91dfeec74359eb948234e.camel@perches.com>
 <CABJPP5BxO20-YzbTZij4gZGm4R63iG_n2kH58pSz5mgyXXwVBw@mail.gmail.com>
 <40b6e1fa9fc638a7e755f7e91f401b6019fee2fa.camel@perches.com>
In-Reply-To: <40b6e1fa9fc638a7e755f7e91f401b6019fee2fa.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 30 Nov 2020 23:56:59 +0530
Message-ID: <CABJPP5C0eN5kC8-jB0Bes438GxWbwnNyYeN5a+6uym5MgyuBPw@mail.gmail.com>
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

On Mon, Nov 30, 2020 at 11:31 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-30 at 23:02 +0530, Dwaipayan Ray wrote:
> > Sorry I think i explained wrong. For words like "doesn't", it still
> > has the same problem.
>
> I think you explained it wrong when you didn't mention this is
> _only_ a problem when using --codespell.
>
Sorry for that.
> Likely it'd be better to use "(?:^|\s)($misspellings)(?=\s|$)"
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7dc094445d83..b1783f02f745 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3106,7 +3106,7 @@ sub process {
>  # Check for various typo / spelling mistakes
>                 if (defined($misspellings) &&
>                     ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> -                       while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> +                       while ($rawline =~ /(?:^|\s)($misspellings)(?=\s|$)/gi) {
>                                 my $typo = $1;
>                                 my $typo_fix = $spelling_fix{lc($typo)};
>                                 $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
>
> $ cat t_spell.c
> // SPDX-License-Identifier: GPL-2.0-only
> void foo(void)
> {
>         //misspelled doesn' doesn't arne't word
> }
>
> $ ./scripts/checkpatch.pl -f --strict t_spell.c --codespell --codespellfile /usr/lib/python3/dist-packages/codespell_lib/data/dictionary.txt
> CHECK: 'doesn'' may be misspelled - perhaps 'doesn't'?
> #4: FILE: t_spell.c:4:
> +       //misspelled doesn' doesn't arne't word
>

Thanks, this does resolve the original problem, but again the following
line throws 0 warnings:

"zeebra" ther, yourr.

Any punctuation separators are ignored :(

 (?:^|\s)($misspellings)(?=[\s\.\,\:\;\"\?\!]|$)

Would this be acceptable rather? But again this doesn't
handle [therr] or (therr).

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
