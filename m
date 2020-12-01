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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862D6C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:53:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0C10208C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwmRrxBn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0C10208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58C3D86EB7;
	Tue,  1 Dec 2020 18:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id As1zZckpjW5P; Tue,  1 Dec 2020 18:53:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C55A386E4F;
	Tue,  1 Dec 2020 18:53:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAECCC1833;
	Tue,  1 Dec 2020 18:53:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F32CC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6469E86E6D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DcgINTURPWyk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:52:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 519C386E4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:52:59 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j205so6413400lfj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 10:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FEYVCv8TnmCI7uv6OUfQ32ulBDRxFGwRjOItlKb1Mjo=;
 b=XwmRrxBnOMIWhJIc2+fPMDzSTCHg/fEFQTGguBgxsiCQ0UzqJZPLZ00Z+lehvtjTGv
 ew/sGWeY7G5MXO/JQgcbXZGPTGsTqyETV2aNP5ypjsF1KZ0FBkUEqbYEs7eOYMpcDkvc
 i58dHrYOY0vKBJhvotJTtyG4OR8OsM4bnPZRTa6LTvOlWlZnsZVC/Xdv9qF9wEFQWJg0
 +T8ad/LIh7xbCdmAw/w3OJMoPDrwV6cpOoAHBGLDBy0OFNRSQDB3fQyAq+F0Z2K6f3yR
 AoVnmP/L/X0F5d+PEIEfWMOeAs0EKg+ODnJocfurpDXMJbm7iHvKd2tR1S4Ag954aSMg
 slEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FEYVCv8TnmCI7uv6OUfQ32ulBDRxFGwRjOItlKb1Mjo=;
 b=lkMU2xkqo5c6YtwtRckmxYuY++eiSHF0jj0nP+exb51kkoiltzInZkLjxyaAg6rVEI
 Tsz1wI2Bqj+IsLtF1c4A7hlSSswfh9imEpXUMdzx9F7FaKUZkLOw8gNijWQIcRqbi52F
 +YshCxMJZJghIe15zN3OHK+/jXkXPKWUSDHwu3bLH0/EKU5KxeA3oepxNHcoaMgMdKAR
 78cC0SHjoUqx1EEY9NUcsZ52Y5Hfofq3LrpDoa8e1aVQozNe8vRQdA0akL83nN+wNQ7t
 xxjwzPVPcZc/z/BkNwLWPJ2t7i/yMsr70DZ5uH10Wg6QBNs7kB7pA0hfRl/IpMvxLW3v
 FhDw==
X-Gm-Message-State: AOAM533KKHxQ22iAiWSMVIDGN1/Uk6EK6dAn6XErb9lj2p6bbnxq+n2q
 Z3qPSIz15dzabY/jNBe2YTpSq6uV4BdLaWi5ElM=
X-Google-Smtp-Source: ABdhPJw/N7Vw2HhO/nR45c8ublKgv3J1A+5miWn0r44o/UaJ+p2Dn8HImSzfg/sVswTMnj8gNHMu2KdEG7KkLR+YrsM=
X-Received: by 2002:a19:5003:: with SMTP id e3mr1876048lfb.148.1606848777264; 
 Tue, 01 Dec 2020 10:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20201201072320.44544-1-dwaipayanray1@gmail.com>
 <2d507d3042a97613078554b1b5f1169ab8c41b42.camel@perches.com>
 <CABJPP5A75ufynVGn37XteQ=KBrTenr2dGHPPdz83n1=qg6vztA@mail.gmail.com>
 <f5c7211fc8521248fcb7409f95afadda932a7fe7.camel@perches.com>
In-Reply-To: <f5c7211fc8521248fcb7409f95afadda932a7fe7.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 2 Dec 2020 00:22:28 +0530
Message-ID: <CABJPP5DpDUCjcW3ic+w-h8aQjTCyrY2kHe1QJ1O_=kf57o6hXg@mail.gmail.com>
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

On Tue, Dec 1, 2020 at 11:59 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-12-01 at 23:39 +0530, Dwaipayan Ray wrote:
> > On Tue, Dec 1, 2020 at 11:32 PM Joe Perches <joe@perches.com> wrote:
> > > On Tue, 2020-12-01 at 12:53 +0530, Dwaipayan Ray wrote:
> > > > checkpatch reports a false TYPO_SPELLING warning for some words
> > > > containing an apostrophe when run with --codespell option.
> > > >
> > > > A false positive is "doesn't". Occurrence of the word causes
> > > > checkpatch to emit the following warning:
> > > >
> > > > "WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"
> > > >
> > > > Modify the regex pattern to be more in line with the codespell
> > > > default word matching regex. This fixes the word capture and
> > > > avoids the false warning.
> > > >
> > > > Suggested-by: Joe Perches <joe@perches.com>
> > > > Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - Use the default codespell word regex.
> > > > - Modify commit message to specify --codespell usage
> > > >
> > > >  scripts/checkpatch.pl | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > []
> > > > @@ -3106,7 +3106,7 @@ sub process {
> > > >  # Check for various typo / spelling mistakes
> > > >               if (defined($misspellings) &&
> > > >                   ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
> > > > -                     while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
> > > > +                     while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
> > >
> > > This regex seems to work well, thanks.
> > >
> > > >                               my $typo = $1;
> > >
> > > A trivial improvement might be to highlight the location of the
> > > misspelled word with a caret using
> > >
> > >                                 my $blank = copy_spacing($rawline);
> > >                                 my $ptr = substr($blank, 0, $-[0] + 1) . "^";
> > >                                 my $hereptr = "$hereline$ptr\n";
> > >
> > > >                               my $typo_fix = $spelling_fix{lc($typo)};
> > > >                               $typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
> > >
> > > and using $hereptr and not $hereline when emitting the message.
> > >
> > Sure I will do that.
> > Is the color highlighting also supported in most systems?
>
> I believe so, yes.
>
> Color is only used when the output is to stdout and not redirected
> and not otherwise specified on the checkpatch command line.
>
> > Maybe a red colored word would be nice to notice as well.
>
> Maybe, but that might make the code around the message output of
> $hereptr a bit obscure.  Presumably the code would not use $hereline
> but something else new and specific for this message.
>
> The output is done via the report() function so adding optional color
> for only a portion of the new $hereptr string might be a lot of code.
>
> If you try it, maybe make the misspelled word color match the message
> level and not just be red.  Also the caret line wouldn't have much
> value with that added color highlighting.
>
> Try it and see what you prefer.
>

Thanks for your view.
Colors seem to obscure the word even more. The carat one seemed nicer
to me visually. I will send in a new version for that.

Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
