Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763EDC64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:10:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8919206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jd8NCTLO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8919206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A4F68818A;
	Tue,  1 Dec 2020 18:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7EhiLbJLV1RV; Tue,  1 Dec 2020 18:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BCAC7877EF;
	Tue,  1 Dec 2020 18:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1CE6C1833;
	Tue,  1 Dec 2020 18:10:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A86FFC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 98C618764A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEqEWlV9Gceb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:10:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B63E78763A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:10:16 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y16so4537599ljk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 10:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5abX7MmZ8u7dm9lClNeO6iU0UD2UQZWPold2l0WgmI=;
 b=jd8NCTLOi/t7oIgpm4GVcEhDJdcWcrvyD8R2dORLa016CDb32ZI3mx960CIJjQUx33
 bSnMYi6x/CtMfngRFTgs+rZJSSIXuEC5aMTY8XeUO6RLJJfK0A0zOL1ZIKpzh9OebYnF
 hHt0bpVddFF24/P0T1cINe82Qvjjtpb1NVYMaJvHqgTZj+8VMMINqKbx2ddsAw4dcnrk
 DX30ChvJIqTxPiBrDQiGkGw/HvlpcS+W8U8u/rforInXq58klZPL0Ed7R/vrkC7w410R
 /pmvrEb6OS+YLcQZXuHKmWtYg2pmfu34xbbE9busXp6UwBgog9hMqTJFdCDQG8pfzZ7b
 USmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5abX7MmZ8u7dm9lClNeO6iU0UD2UQZWPold2l0WgmI=;
 b=Gj3plDysKJmvZGZkaipe/rR0FCzrOf9zdzUe+0TgVH7Zm+56pnp2ipsPoLd/IRO9Kv
 yoDlvOy3rOasulk8KaLoPiyTUnDFQsFigdQ6/EcfgYhcee3A7N8/GiI5mG1SobRSYz9U
 X3oDaAb4u48mlhkJYKQOhiL4tQMtgyXkuCMGUW7Tx0Q5TelxenGy6tvzPFVetd9uUbGJ
 B57k/h7VbLY8V03itrUmNEbwQondoIckqvaiGEsnaBGkfpnPF8NqtBQP+RhntcQYkH0T
 8QkpyL5rByB+h3wRFdkUbdeUw/94zwIYm8jHiISPmPCuC+SRR/rn3WQ10Ot91ng432Nn
 z/5w==
X-Gm-Message-State: AOAM530W8wrgC5DZateRWuqk/Qh7KGpFgJ3Jv7MZDwD9s1ZkKJP8++Qr
 rT5ulXO8sOFf5qlUaeLoNqZjTuycMUog1SEOqWI=
X-Google-Smtp-Source: ABdhPJz/nYzMJPiXpXkp7KIwgYj5vUEFPbUG6EBnzhSK8i2kXlmfSuaqWGsIrypp//JvdE+zZsUDaZERdfnDSaUvziE=
X-Received: by 2002:a05:651c:cb:: with SMTP id
 11mr1964692ljr.159.1606846213318; 
 Tue, 01 Dec 2020 10:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20201201072320.44544-1-dwaipayanray1@gmail.com>
 <2d507d3042a97613078554b1b5f1169ab8c41b42.camel@perches.com>
In-Reply-To: <2d507d3042a97613078554b1b5f1169ab8c41b42.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 1 Dec 2020 23:39:44 +0530
Message-ID: <CABJPP5A75ufynVGn37XteQ=KBrTenr2dGHPPdz83n1=qg6vztA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix TYPO_SPELLING
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

On Tue, Dec 1, 2020 at 11:32 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-12-01 at 12:53 +0530, Dwaipayan Ray wrote:
> > checkpatch reports a false TYPO_SPELLING warning for some words
> > containing an apostrophe when run with --codespell option.
> >
> > A false positive is "doesn't". Occurrence of the word causes
> > checkpatch to emit the following warning:
> >
> > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> >
> > Modify the regex pattern to be more in line with the codespell
> > default word matching regex. This fixes the word capture and
> > avoids the false warning.
> >
> > Suggested-by: Joe Perches <joe@perches.com>
> > Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> > Changes in v2:
> > - Use the default codespell word regex.
> > - Modify commit message to specify --codespell usage
> >
> >  scripts/checkpatch.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > @@ -3106,7 +3106,7 @@ sub process {
> >  # Check for various typo / spelling mistakes
> >               if (defined($misspellings) &&
> >                   ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> > -                     while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> > +                     while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
>
> This regex seems to work well, thanks.
>
> >                               my $typo = $1;
>
> A trivial improvement might be to highlight the location of the
> misspelled word with a caret using
>
>                                 my $blank = copy_spacing($rawline);
>                                 my $ptr = substr($blank, 0, $-[0] + 1) . "^";
>                                 my $hereptr = "$hereline$ptr\n";
>
> >                               my $typo_fix = $spelling_fix{lc($typo)};
> >                               $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
>
> and using $hereptr and not $hereline when emitting the message.
>
>
Sure I will do that.
Is the color highlighting also supported in most systems? Maybe a red colored
word would be nice to notice as well.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
