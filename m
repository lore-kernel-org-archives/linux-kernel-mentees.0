Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDA1C43465
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 15:16:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B9E2388B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 15:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6ObtlMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B9E2388B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6CEE12E21C;
	Fri, 18 Sep 2020 15:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjNGsaP56plG; Fri, 18 Sep 2020 15:16:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1B5AB2E230;
	Fri, 18 Sep 2020 15:16:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F400BC0859;
	Fri, 18 Sep 2020 15:16:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4E74C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 15:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7AA8C859B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 15:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X7BBWRAgoTu1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 15:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 15AEF873C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 15:06:10 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o8so5676290otl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jpTWYSBhlvqEV7VXUdbzFtHEGYHuNoDqlXffuZERf0Q=;
 b=I6ObtlMKhYTdt12N5Ee8Q1v2Hun290JwspKusehHNE4yxCl761gstGVAlggtXgDlKr
 aYuIF5o8S/+UTisbKazT/2itQsFGxEF+pH/fJH2z90UkivfKMn9wPUVmdJEhxxGdax2n
 XK2TOqNyqv38Z8kTFYSN4vNcljBtcRjvZuwvnxLfT3WqkVO1PrarsXbADDWLrQi6Kmgs
 2zec2q1pfYa5PZF9o01Cs3E2+q5qU5d/heeSIzDshx65XI34UghQy7JoYnqB+Z77Qzev
 e/Y0j1U5us/dK4zVP39H8VNI1kp/EQ5tTTw+0/E7DIkYA7bF5OyJsYtOwnlUIc6qudz6
 5RXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jpTWYSBhlvqEV7VXUdbzFtHEGYHuNoDqlXffuZERf0Q=;
 b=REz8J8iNBy89PS1BrcAN5eEoJh/TvqaEa3PrakfueotkpOeD+I7BKZ35weF16yImRY
 SVwk6pMM0OOIhYxzhxpDChYevTCoZrjwG3Z272sx91PXfchyRrslBVYMlEAqY3DwbrQv
 WyEc5OBwo0JlPZ8KDjasG3nl5FHT3PH+k5Nv7vWpOyfSxf2wR1Xfk6JEnbU89nBVITth
 iRTOMbJXa8Y49Viwl+wOpw655ESEgUWKtf31xj8AB1ocZJYeeGMBDd1bhu8LJps0AMDT
 +D5vtsLxUjKr5GBGN/pMmGwrw5AqEQ46U7jDvip+JZ9KLCmfhujiCxpuVU89VWpbVvkb
 2+wQ==
X-Gm-Message-State: AOAM531YPd547h5dt+MHQvSo5rrc/TN6zoJhRc+lVvMasYv5kM3yUICG
 +UKLxFHf5K9A3pnKH/X8aSoA6xN0rvlYOzXaOOI=
X-Google-Smtp-Source: ABdhPJyohTFlTEDtNJcAmg4aB3A/6ty7WMxiqnMrO+Utkpueee8R6aIAUv6rpFvyI+zRzbQQ+dqkaz0PjhLs5hgkF5k=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr22377978otf.265.1600441568982; 
 Fri, 18 Sep 2020 08:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200918122950.94098-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2009181439160.14717@felia>
In-Reply-To: <alpine.DEB.2.21.2009181439160.14717@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 18 Sep 2020 20:35:50 +0530
Message-ID: <CABJPP5BOTG0QLFSaRJTb2vAZ_hJf229OAQihHKG4sYd35i_WMw@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix author
 Signed-off-by warning for split From: header
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

On Fri, Sep 18, 2020 at 6:28 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
> For the patch subject line, I actually think this patch is a new feature
> or extension, not a fix. It was not broken, just not supported before.
>
> So maybe: extend author Signed-off-by check for split From: header
>
>
> On Fri, 18 Sep 2020, Dwaipayan Ray wrote:
>
> > Checkpatch did not handle cases where the author From: header was
> > split into two lines. In those cases the author string went empty,
> > and checkpatch generated a false missing author signed-off-by
> > warning.
> >
> > This patch adds support for split From: headers and resolves those
> > false warnings.
> >
>
> You can drop 'This patch adds'. We see it is a patch, and we see that it
> adds something. Just use imperative tense:
>
> Support split From: headers in AUTHOR_SIGN_OFF check.
>
> (That is a good commit message header as well.)
>
> Can you provide some statistics on number of warnings before and after
> and maybe even in more detail, how many of the warnings disappeared with:
>
>   Missing Signed-off-by: line by nominal patch author ''
>
> Probably even new warnings appeared?
>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 504d2e431c60..8c4119ca7d17 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2347,6 +2347,7 @@ sub process {
> >       my $signoff = 0;
> >       my $author = '';
> >       my $authorsignoff = 0;
> > +     my $prevheader = 0;
> >       my $is_patch = 0;
> >       my $is_binding_patch = -1;
> >       my $in_header_lines = $file ? 0 : 1;
> > @@ -2658,12 +2659,22 @@ sub process {
> >                       }
> >               }
> >
> > +# Check the patch for a split From:
> > +             if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
>
> How about extending to check if $prevheader is not 0?
>
> > +                     $author = $1.$line;
> > +                     $author = encode("utf8", $author) if ($prevheader =~ /=\?utf-8\?/i);
> > +                     $author =~ s/"//g;
> > +                     $author = reformat_email($author);
> > +                     $prevheader = '';
> > +             }
> > +
> >  # Check the patch for a From:
> >               if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
> >                       $author = $1;
> >                       $author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
> >                       $author =~ s/"//g;
> >                       $author = reformat_email($author);
> > +                     $prevheader = $line;
> >               }
> >
>
> So here we see two almost identical parts of code now, right?
>
> Either use a small function or restructure the code such that the
> differences are in two branches and the common code is part of one common
> control flow. You are a good programmer, you can figure this out.
>
> Generally looks good. Let us know once you think it is ready to be tested :)
>
> We got some checkpatch.pl evaluation experts here and I am sure they are
> all happy to test your change and see the evaluation get better.
>
> Lukas

Hi,
I will get back with the changes you told once I do it in a clean enough way.

For now, I have generated the statistics for my patch. I ran my script on
all non merge commits between v5.7 and v5.8.

Before applying patch, no. of warnings:
NO_AUTHOR_SIGN_OFF: 278

After applying the patch:
NO_AUTHOR_SIGN_OFF: 251

Comparing the changes before and after applying the patch:
(Entries are given as no. of warnings of type NO_AUTHOR_SIGN_OFF
before and after applying the patch for given commit hash).

e33bcbab16d1: 1-> 0
6a5d6fd33262: 1-> 0
424c85e1ffea: 1-> 0
c7ff09f6e262: 1-> 0
148dd20602d5: 1-> 0
d5f74a1eff9a: 1-> 0
6c47660e3c3a: 1-> 0
9d9cc58aff46: 1-> 0
9a618e6f8cdd: 1-> 0
980f91778a2f: 1-> 0
b77da87c84f8: 1-> 0
15e3ae36f71e: 1-> 0
c5b4312bea5d: 1-> 0
41aef04524d3: 1-> 0
37d1e94692e0: 1-> 0
79eb8c7f015a: 1-> 0
8211d1e83ade: 1-> 0
9a42a5ff3dac: 1-> 0
440d7a6f7390: 1-> 0
6b6aeffc932d: 1-> 0
ce1d86dc9249: 1-> 0
f645e6256bd1: 1-> 0
770ae40cd6d2: 1-> 0
f4d12d8009d9: 1-> 0
f0a087a533b3: 1-> 0
772563b27c9f: 1-> 0
b03628b73564: 1-> 0

So, no new warnings have popped up, and the no. of warnings have
reduced significantly. :)

I will send in the new patch once I am done with it.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
