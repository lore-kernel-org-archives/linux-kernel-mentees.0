Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13999C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:42:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F722074F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:42:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRbZ0XnC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88F722074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2FFFA87539;
	Sun, 11 Oct 2020 17:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fz4p3J4PFkat; Sun, 11 Oct 2020 17:42:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9075687546;
	Sun, 11 Oct 2020 17:42:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7379DC07FF;
	Sun, 11 Oct 2020 17:42:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54D82C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3BCDB85FB0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWV2Jgav5pKP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:42:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 11DC285F95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:42:27 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m11so13696936otk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 10:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EPS3MxFjnmdID8Ajl1yTcC/EgqmVKG7AJ6HVdhuwbqg=;
 b=jRbZ0XnCyGHpR3cFi8IxwVKWJU8FwrKmfZUONrdvzNpnTU05paaF8hfjTpAeJUqHvq
 SadK17fuLCtairE0y861HlvkMCAa1cGMXfNfbI3Wz1n4PxGsZb3ZWPUlA+qLC6dSe0/l
 W6vRQErtg7NovwRPJJIphFSzMo+bJ1cj2gh2W55MsYxWmNR3sWG4Ui7mUMx+FQVhswvd
 mjPit7P/z2uOMI3Ipib3qKekZNG86YpA5SfL7eGxyEeP5oIw3VByJqXQqNXwEbXtvOzJ
 TBPIKRrAmAKhszJSvjmDgd7jpphFHgsj0lC4zcqGAHDdXpF8GmrMQ1AOzez+KFAIdeQy
 lA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EPS3MxFjnmdID8Ajl1yTcC/EgqmVKG7AJ6HVdhuwbqg=;
 b=f0mafzsDS+0PQ+skKuAQaEuZt3QW5DOCO9uL1F9QleuRlSb5kzh9n68PAOQm2OGSmV
 RRUIm8kL5xss4MGHl9lv8rzbT2klTIJ4Yuoqw+4O07JCwg+/OGhisNeLAbIRIBAo0J7d
 +QvHshqkvsh9SjfjIYTpzn8OHKLNl9UZYlc7PXvC/vBYBVJYlhkLjn30+lxpy5zpIoFn
 LWXVhVLJxM6L7/75aGxu5ojH6I5lPu9JAol1Flt2fdRG+GxA9op7Clx6iyKW0fLgMGIo
 PyTF0ikp+laBMabCsNJW1F6CXiji96oNVzOA1AIFusJs+NJ0bZ++gHjr4plkorAoEwLL
 xSLQ==
X-Gm-Message-State: AOAM533pW4KOKj43zs5iFZA+b8rofqZ1Aq/HoKwFNUhojKjrXQNMUv8M
 4yGGmI3l+ozcX2bZh+zAq3QpBBXx+zWOTdBRrKo=
X-Google-Smtp-Source: ABdhPJwLkD6aDg05sGE6f94JNNV3fK5mty0JvF4SVFvsf02b+tGHeYx4mMfZwmDHUaMlt4/tP8fsmwCpqUUBZSHmLrc=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr13908646otq.265.1602438146056; 
 Sun, 11 Oct 2020 10:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201011064348.14015-1-dwaipayanray1@gmail.com>
 <CABJPP5BBMbUyzssxckDrTgpTya-onB9LjpvA14k-UhGW7zL5hg@mail.gmail.com>
 <alpine.DEB.2.21.2010111937100.5535@felia>
In-Reply-To: <alpine.DEB.2.21.2010111937100.5535@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 11 Oct 2020 23:12:01 +0530
Message-ID: <CABJPP5BvD-6QZ_tbFcTyRmBq_w8NES9v528Q3PeA9w8y0-nznQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new
	exceptions to repeated word check
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

On Sun, Oct 11, 2020 at 11:07 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Sun, 11 Oct 2020, Dwaipayan Ray wrote:
>
> > On Sun, Oct 11, 2020 at 12:14 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > The repeated word check generated false positives for
> > > the following pattern:
> > >
> > > "git git://..."
> > >
> > > This resulted in lots of warnings in the MAINTAINERS file
> > > which shouldn't have been generated.
> > >
> > > Fixed this issue by adding "git" to the exception list
> > > for repeated word check.
> > >
> > > In addition, modified $word_pattern to capture words which
> > > may contain a single letter like "a".
> > > This ensures that repeated word warning in cases like
> > > "This is a a repetition" are also generated.
> > >
> > > Link: https://lore.kernel.org/linux-kernel-mentees/b6cd81b936671a8868fe98536d7c80771bdfd61c.camel@perches.com/
> > >
> > > Suggested-by: Joe Perches <joe@perches.com>
> > > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > ---
> > >  scripts/checkpatch.pl | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 124ff9432b51..0ef75d2fb5cf 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -588,7 +588,7 @@ our @mode_permission_funcs = (
> > >         ["__ATTR", 2],
> > >  );
> > >
> > > -my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
> > > +my $word_pattern = '\b[A-Z]?[a-z]{1,}\b';
> > >
> > >  #Create a search pattern for all these functions to speed up a loop below
> > >  our $mode_perms_search = "";
> > > @@ -3364,7 +3364,7 @@ sub process {
> > >                                 }
> > >
> > >                                 next if ($first ne $second);
> > > -                               next if ($first eq 'long');
> > > +                               next if ($first =~ /(?:long|git)$/);
> > >
> > >                                 if (WARN("REPEATED_WORD",
> > >                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> > > --
> > > 2.27.0
> > >
> >
> > One more additional improvement to this would be to make
> > comparison case neutral.
> >
> > Like:
> >
> >  -  next if ($first ne $second);
> > +  next if (lc($first) ne lc($second));
> >
> > What do you think?
> >
>
> Sounds good. Please evaluate though. Then, we can really judge better.
>

Sure, I will run both the evaluations:
1) For case insenstitive matching
2) For single letter words

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
