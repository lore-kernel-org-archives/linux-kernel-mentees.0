Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81185C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 04:33:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1804206CA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 04:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2KJOrIt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1804206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 592A120435;
	Sat, 17 Oct 2020 04:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JOlbNxsVOWO4; Sat, 17 Oct 2020 04:33:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD5CB2046C;
	Sat, 17 Oct 2020 04:33:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84A9FC07FF;
	Sat, 17 Oct 2020 04:33:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5770C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 04:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AB6F988E57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 04:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgCIGEUKXYgq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 04:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E65BF88E56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 04:33:18 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e20so4471545otj.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 21:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyIT3KDc657FTDBbPllL5gNl/9qPglQwQSgiFUmTmhQ=;
 b=n2KJOrItLONyucDgNwFYobyDFs+b1ckgNXl7VW6UicOXTWsHj4WlMojIBI8GjDuXUd
 dWaRkMXZ+crAOGyvKniSSTRXa4B/fR6HDfFjXaBr64MtGomUiqZycIaGThuD/OH9/KfC
 aCD90YLR1yYkXLpLtA2IQenlyiJSoggpORClX35oxO6TufDvF1ivvltx3E4CormVde3G
 QK91RM94BoA4sjbPldMNGdVGjWdYHkszL4ufG7KZysaQbRO8y9A8jTLt9ZVSF3r0dkfF
 kudkS3O1kSBOpwkaQv3ClJjJYTJLEkdfYLoM2IBFJ9Gzn74zA7c96k5mxF7Vos8bcFdr
 IrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyIT3KDc657FTDBbPllL5gNl/9qPglQwQSgiFUmTmhQ=;
 b=Wu1l2SPGVbkY92v67JVuR/VXMS65YQk4agpS5gykawuTYJaDyMFQLHPYnTUxSHIQGd
 1UzWp9RWEG3x/0cn+jOLvF42uGYIUMO+T4FSUCTPDtQCUTQQdPIM71nXwije00pkYMad
 xv50y0MdzbtYAu+wGXC+0IYvr+vQmg2CsfWU86lfIMKOcXF2gleoWHrT0Mp6GFrjrB4u
 oqTYNpkFCys8eaQEite9UtvEw09JZvEJv2+jH7F2n/KMwpJM9xhPtfI94w5XLV0VOZUl
 doImzrAo+et7J3/OdTkq4PESPlruRH+XmiIi7SEZKn8Ink9gguapt0tsIyZSdL1dIRV/
 AiXA==
X-Gm-Message-State: AOAM533XWhLlLPrgfw0673BFZNWQywfeyi4dH1eCkuxM5z44zj0lEKRf
 AeBfGGIeR1JInZRdbUP7qgGCVRnxOq/wocCpqRI=
X-Google-Smtp-Source: ABdhPJx8xcFVIZjN/KaRIv7WT3MHFAHET8yuV8lcDte3eCZ+pmCVMZSbMAQsl1HKfTHIveyLvYG46KW2kxUqO61TOlQ=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr4772542oth.215.1602909197796; 
 Fri, 16 Oct 2020 21:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201014163738.117332-1-dwaipayanray1@gmail.com>
 <ea011df1e30ce445d51e128287e2c6c38de20949.camel@perches.com>
 <CABJPP5DrSL7GoZUWc7P02CfLHfTBmfpLxrVOVQ08KH3pPontoA@mail.gmail.com>
 <7d8c7d80aa7b0524cca49a6dfe24e878bea6ab12.camel@perches.com>
 <81b6a0bb2c7b9256361573f7a13201ebcd4876f1.camel@perches.com>
In-Reply-To: <81b6a0bb2c7b9256361573f7a13201ebcd4876f1.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 17 Oct 2020 10:02:51 +0530
Message-ID: <CABJPP5DjmY8N18XOhikHymiwkF9h213Rwi-ffQiBvKSrw2WqyA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add new exception
	to repeated word check
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

On Sat, Oct 17, 2020 at 8:26 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-10-14 at 11:35 -0700, Joe Perches wrote:
> > On Wed, 2020-10-14 at 23:42 +0530, Dwaipayan Ray wrote:
> > > On Wed, Oct 14, 2020 at 11:33 PM Joe Perches <joe@perches.com> wrote:
> > > > On Wed, 2020-10-14 at 22:07 +0530, Dwaipayan Ray wrote:
> > > > > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > > > > moved the repeated word test to check for more file types. But after
> > > > > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > > > > new warnings of the type:
> > > >
> > > > Perhaps instead of adding more content checks so that
> > > > word boundaries are not something like \S but also
> > > > not punctuation so that content like
> > > >
> > > >         git git://
> > > >         @size size
> > > >
> > > > does not match?
> > > >
> > > >
> > > Hi,
> > > So currently the words are trimmed of non alphabets before the check:
> > >
> > > while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
> > > my $first = $1;
> > > my $second = $2;
> > >
> > > where, the word_pattern is:
> > > my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> >
> > I'm familiar.
> >
> > > So do you perhaps recommend modifying this word pattern to
> > > include the punctuation as well rather than trimming them off?
> >
> > Not really, perhaps use the capture group position
> > markers @- @+ or $-[1] $+[1] and $-[2] $+[2] with the
> > substr could be used to see what characters are
> > before and after the word matches.
>
> Perhaps something like:
> ---
>  scripts/checkpatch.pl | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index fab38b493cef..a65eb40a5539 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3054,15 +3054,25 @@ sub process {
>
>                                 my $first = $1;
>                                 my $second = $2;
> +                               my $start_pos = $-[1];
> +                               my $end_pos = $+[2];
>
>                                 if ($first =~ /(?:struct|union|enum)/) {
>                                         pos($rawline) += length($first) + length($second) + 1;
>                                         next;
>                                 }
>
> -                               next if ($first ne $second);
> +                               next if (lc($first) ne lc($second));
>                                 next if ($first eq 'long');
>
> +                               my $start_char = "";
> +                               my $end_char = "";
> +                               $start_char = substr($rawline, $start_pos - 1, 1) if ($start_pos > 0);
> +                               $end_char = substr($rawline, $end_pos, 1) if (length($rawline) > $end_pos);
> +
> +                               next if ($start_char =~ /^\S$/);
> +                               next if ($end_char !~ /^[\.\,\s]?$/);
> +
>                                 if (WARN("REPEATED_WORD",
>                                          "Possible repeated word: '$first'\n" . $herecurr) &&
>                                     $fix) {
>
>

Hi Joe,
Thank you for the insight. I was also doing something similar:

---
 scripts/checkpatch.pl | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f1a4e61917eb..82497a71ac96 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -595,6 +595,7 @@ our @mode_permission_funcs = (
 );

 my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
+my $punctuation_chars = '[,:;@\.\-]';

 #Create a search pattern for all these functions to speed up a loop below
 our $mode_perms_search = "";
@@ -3065,6 +3066,21 @@ sub process {
  next if ($first ne $second);
  next if ($first eq 'long');

+ # check for character before and after the word matches
+ my $ca_first = substr($rawline, $-[1]-1, 1);
+ my $cb_first = substr($rawline, $+[1], 1);
+ my $ca_second = substr($rawline, $-[2]-1, 1);
+ my $cb_second = substr($rawline, $+[2], 1);
+
+ if ($ca_first ne $ca_second || $cb_first ne $cb_second) {
+ if ($ca_first =~ /$punctuation_chars/ ||
+     $ca_second =~ /$punctuation_chars/ ||
+     $cb_first =~ /$punctuation_chars/ ||
+     $cb_second =~ /$punctuation_chars/) {
+ next;
+ }
+ }
+
  if (WARN("REPEATED_WORD",
  "Possible repeated word: '$first'\n" . $herecurr) &&
      $fix) {

Does it look okay to you??

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
