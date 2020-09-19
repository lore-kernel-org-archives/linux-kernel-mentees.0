Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2085DC43465
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 19:39:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40C621707
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 19:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nia8DYZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A40C621707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 581938686F;
	Sat, 19 Sep 2020 19:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sRsRL+k4aeUZ; Sat, 19 Sep 2020 19:39:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C967D869CD;
	Sat, 19 Sep 2020 19:39:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C55D0C0859;
	Sat, 19 Sep 2020 19:39:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 351A6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 19:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 310F78720C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 19:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPNWvMh5w6YL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 19:39:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 575A38718B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 19:39:05 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id n2so11691020oij.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQtf4hjR8BiFGOzI+LyzpiVdQaOuYwnz9vzlK18ZLec=;
 b=Nia8DYZI/mMqQxifpx74lDImmy9AUam8ADyQOcXm9+e6QD9ucUMk6XThT1tPNESTRC
 f8p5NJ19KUWd8MQK6xciVegqGl8xpvAcfIAbNuANrdQw1H9VDABAvqsr76fSDG+giQB4
 3IWOWi3k89CW9Uo95nc4PRpHcDAf9eYNyEvOKGPyXrd9McxsPczGz+6IOLPa0SCzvukp
 J0ldT+f1JAGPFp8B5lUGjc6qRkejgLKpPbAEsFO8e8DDupalBdie/lz090kbm1mA5iV9
 DSVjwV0BfJb4IUmo22SMGk8UiEPsj8gR+V6sGVX5UfMc4AFRwv9aKsNug69rptP5ctn3
 TjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQtf4hjR8BiFGOzI+LyzpiVdQaOuYwnz9vzlK18ZLec=;
 b=tYqcr8M3iZjgq/L06PZN0WgYm8F1X6yS/9wdE8ggycGtbufYv+/e5OQgn93BxFiZOD
 n9z991TMeqDXcVfI/Qly8oEAqcLkqis/k8PBGNF1MqDVk6QZY9XQakuawuqrgCVEmTB3
 +Mmc6Jk3Zh5GtAQW+ieM9E65LpZ1iTTNqIb+vxu5zlGc/N/GtXNk8xffhPASqXlOCj9x
 0LyyMWLc7uNb00Po7hhkDAiNxvVv7DwMR7kyJ05i6KiTk3uEOcUtQr1uFXpsbyF+zQg3
 cvfvpZY8+Y+34QiSUvirskw5z/eqRwA8BReoIPv3amn1VmYzA8xmA28RDRxetqXe7o9V
 s3xw==
X-Gm-Message-State: AOAM532EVxxtrhMYOFjt8FlW21aSaxTavff8NShzf8ysMGC9B+LJCAqC
 ViRTSDrJSX3nBnmPTVcYpZNacEjPJ9cVO4bYxqQ=
X-Google-Smtp-Source: ABdhPJymaWNqXDl6382z1kJUQko1Vwg1BhFOsL7L7HSpu1Oz5OwlsxXbFgI4X9WyjtZUjHZ4Sa6LFInrF6ClkxP5Q8U=
X-Received: by 2002:aca:5050:: with SMTP id e77mr13203643oib.74.1600544344351; 
 Sat, 19 Sep 2020 12:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200919081225.28624-1-dwaipayanray1@gmail.com>
 <ad937bba6ebd306f6e467add90cfd857bb4f2391.camel@perches.com>
 <alpine.DEB.2.21.2009191950460.7901@felia>
 <f5d8124e54a50480b0a9fa638787bc29b6e09854.camel@perches.com>
 <alpine.DEB.2.21.2009192033030.7901@felia>
In-Reply-To: <alpine.DEB.2.21.2009192033030.7901@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 20 Sep 2020 01:08:45 +0530
Message-ID: <CABJPP5Daf0UiKjeQp71_bViAkQQh7znWrArKAS1FqnjGU1nX4A@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>, apw@canonical.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: extend author
 Signed-off-by check for split From: header
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

On Sun, Sep 20, 2020 at 12:06 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Sat, 19 Sep 2020, Joe Perches wrote:
>
> > On Sat, 2020-09-19 at 20:12 +0200, Lukas Bulwahn wrote:
> > >
> > > On Sat, 19 Sep 2020, Joe Perches wrote:
> > >
> > > > On Sat, 2020-09-19 at 13:42 +0530, Dwaipayan Ray wrote:
> > > > > Checkpatch did not handle cases where the author From: header
> > > > > was split into two lines. The author string went empty and
> > > > > checkpatch generated a false NO_AUTHOR_SIGN_OFF warning.
> > > >
> > > > It's good to provide an example where the current code
> > > > doesn't work.
> > > >
> > >
> > > Joe, as this is a linux-kernel-mentees patch, we discussed that before
> > > reaching out to you; you can find Dwaipayan's own evaluation here:
> > >
> > > https://lore.kernel.org/linux-kernel-mentees/CABJPP5BOTG0QLFSaRJTb2vAZ_hJf229OAQihHKG4sYd35i_WMw@mail.gmail.com/
> > >
> > > Dwaipayan, Joe's comment is still valid; it would be good to describe
> > > the reasons why patches might have split lines (as far as see, long
> > > encodings for non-ascii names).
> > >
> > > I will run my own evaluation of checkpatch.pl before and after patch
> > > application on Monday and then check if I can confirm Dwaipayan's results.
> > >
> > > > It likely would be better to do this by searching forward for
> > > > any extension lines after a "^From:' rather than searching
> > > > backwards as there can be any number of extension lines.
> > > >
> > >
> > > Just to sure what you are talking about...
> > >
> > > You mean just to access the next line through the lines array, rather
> > > than using prevheader and trying to decode that one line twice.
> > >
> > > I agree the logic is a bit redundant and complicated at the moment.
> > >
> > > Once prevheader is non-empty, it already clear that author is '' and
> > > prevheader decodes with that match, because that is the only way to
> > > make prevheader non-empty in the first place; at least as far I see it
> > > right now.
> >
> > Yeah, something like this (completely untested):
> > ---
> >  scripts/checkpatch.pl | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 3e474072aa90..2c710d05b184 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2679,9 +2679,13 @@ sub process {
> >               }
> >
> >  # Check the patch for a From:
> > -             if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> > +             if ($line =~ /^From:\s*(.*)/i) {
> >                       $author = $1;
> > -                     $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> > +                     my $curline = $linenr;
> > +                     while (defined($rawlines[$curline] && $rawlines[$curline++] =~ /^ \s*(.*)/) {
> > +                             $author .= $1;
> > +                     }
> > +                     $author = encode("utf8", $author) if ($author =~ /=\?utf-8\?/i);
> >                       $author =~ s/"//g;
> >                       $author = reformat_email($author);
> >               }
> >
>

Hi,

Yeah I think the backwards checking was pretty redundant after all. If the
extended encoding went too long, the From: header would be split into
more than two lines and my proposed solution would fail.

Thanks for the heads up, Joe!

> Yeah, I get how you would like to see that being implemented. I will work
> with Dwaipayan to get that properly implemented, properly described and
> tested.
>
> But let us keep the fun of that task to Dwaipayan... that is what a
> mentorship is all about :)
>
> Lukas

Yes definitely, the task is interesting for me, and I would like to solve
it in a proper way.

As for the fix, shouldn't we stop the author string concatenation once
an email address is found? something like:

  last if  $rawlines[$curline] = ~/^\s*(\S+\@\S+)\s*/

I will update the patch and sync up with Lukas on this.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
