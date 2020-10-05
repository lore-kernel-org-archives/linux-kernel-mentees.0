Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C878C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 06:46:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0F4206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 06:46:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXZSc2Tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0F4206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 10A798484C;
	Mon,  5 Oct 2020 06:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpfxEDQseu5o; Mon,  5 Oct 2020 06:46:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64E29854F8;
	Mon,  5 Oct 2020 06:46:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DB25C016F;
	Mon,  5 Oct 2020 06:46:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD5A5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C3A0484E68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQxhPN56ApjT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:46:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0E29684D3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 06:46:29 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id n61so7585538ota.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Oct 2020 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eW6EII5FHtVbq4+ZPfGXlYgyltCmpc5w+Yx+FkktXVU=;
 b=jXZSc2Trg1ZfD3D3e+ULgBUgG0Vsu4cFW877lJS01uNqjT3KfEMWhDGC+5PzJGHuwX
 naAdzs/+4YgYnrimPAsscWeZewb+hk3FzVxvV+aI2gW2YLqE0XWVUbXQpm0slz4WvCOt
 7/7KVE7MCWyHwq+Fg48mBxgsDknFOQWs2YPLc62A748Bmovn3sM1XH1CA43nb6aS0/Xl
 b23wXnj1jiQjQsWM7xdBsWHSwtd2nI2hzB0tTXvHI3Qgw2HMnCL7ORyAMu+wwDoFAFOE
 kqxUyICC0BCv6bWAFn2b/guy9b+GABe+sPGjrwGo87LQLEAhr/JGHfxhQkmW2Kj263iJ
 3nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eW6EII5FHtVbq4+ZPfGXlYgyltCmpc5w+Yx+FkktXVU=;
 b=bWQ6EyCR9BSL6R/VWYVQ8qCW6z0kTm4lGLgz4Wyy2SLPzz7phD/KYJmu1DRz70uhZL
 vd/o68kO7v5Kq0u8/apbaIjL4Hxl2lLVnPaIlRFYOUYemPBVR50dTwcAdt9jxgSXkD2V
 WEAHY5mmLAttrrndZJQYj4sLti2bxOjbssTwhbFYaTmsifWDl+sD4iXS61CWx5EZu588
 3iQTnqsfiIYLZs54ogaN/Jafemn3rP0CzxHoWFgg6YMnT/i9AvLxI5UyEczJNX14UnH9
 Tmp+OQrx4i46V3MQR0REiWIg2RT8Fm/OVndl5+RuFLtfvziy8gWcOqSr+tCjixfUa6Hu
 nOzg==
X-Gm-Message-State: AOAM530dduTU4i6MBEN3UF83RPoZ9oCDRvKI0Zv/hBkZ9P7jX4oJHMSv
 b9g+jjTn92YskmuuG4wcXYVe1iae5zcYwXip5DI=
X-Google-Smtp-Source: ABdhPJzkudPSP84jgWI9YAmwbGuZtgn82nKuscGcpi9GVoL6P3uTI3D9ezPpvQcOtoXabw5lJ0oMvwAGd5Z47DyP3Jc=
X-Received: by 2002:a9d:53cc:: with SMTP id i12mr10199568oth.215.1601880387941; 
 Sun, 04 Oct 2020 23:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201004143812.117455-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010050811200.6202@felia>
In-Reply-To: <alpine.DEB.2.21.2010050811200.6202@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 5 Oct 2020 12:16:06 +0530
Message-ID: <CABJPP5BX6q7eCYSeL9Pca-UTWff+W_JRJpvO+SLDWn3G0pDCUQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new warnings
	to author signoff checks.
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

On Mon, Oct 5, 2020 at 11:49 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Sun, 4 Oct 2020, Dwaipayan Ray wrote:
>
> > The author signed-off-by checks are currently very vague.
> > Cases like same name or same address are not handled separately.
> >
> > For example, running checkpatch on commit be6577af0cef
> > ("parisc: Add atomic64_set_release() define to avoid CPU soft lockups"),
> > gives:
> >
> > WARNING: Missing Signed-off-by: line by nominal patch author
> > 'John David Anglin <dave.anglin@bell.net>'
> >
> > The signoff line was:
> > "Signed-off-by: Dave Anglin <dave.anglin@bell.net>"
> >
> > Clearly the author has signed off but with a slightly different version
> > of his name. A more appropriate warning would have been to point out
> > at the name mismatch instead.
> >
> > Introduced three new types of warnings:
> >
> > 1) Address matches, but names are different.
> >    "James Watson <james@gmail.com>", "James <james@gmail.com>"
> >
> > 2) Name matches, but addresses are different.
> >    "James Watson <james@watson.com>", "James Watson <james@gmail.com>"
> >
> > 3) Name matches, but addresses without mail extensions are same.
> >    "James Watson <james@gmail.com>", "James Watson <james+a@gmail.com>"
> >
> > For the 3rd class, a --strict check message is generated, and for the
> > other two, warnings are generated.
> >
>
> Dwaipayan, I think it a good patch to start the discussion.
>
> Feel free to send this to Joe and lkml.
>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/checkpatch.pl | 57 ++++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 53 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 31624bbb342e..80feb15f93cb 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2347,6 +2347,7 @@ sub process {
> >       my $signoff = 0;
> >       my $author = '';
> >       my $authorsignoff = 0;
> > +     my $authorsignoff_ctx = '';
> >       my $is_patch = 0;
> >       my $is_binding_patch = -1;
> >       my $in_header_lines = $file ? 0 : 1;
> > @@ -2674,9 +2675,34 @@ sub process {
> >               if ($line =~ /^\s*signed-off-by:\s*(.*)/i) {
> >                       $signoff++;
> >                       $in_commit_log = 0;
> > -                     if ($author ne '') {
> > +                     if ($author ne ''  && $authorsignoff != 1) {
> >                               if (same_email_addresses($1, $author)) {
> >                                       $authorsignoff = 1;
> > +                             } else {
> > +                                     my $ctx = $1;
> > +                                     my ($email_name, $email_comment, $email_address, $comment1) = parse_email($ctx);
> > +                                     my ($author_name, $author_comment, $author_address, $comment2) = parse_email($author);
> > +
> > +                                     if($email_address eq $author_address) {
> > +                                             $authorsignoff_ctx = $ctx;
> > +                                             $authorsignoff = 2;
> > +                                     } elsif ($email_name eq $author_name) {
> > +                                             $authorsignoff_ctx = $ctx;
> > +                                             $authorsignoff = 3;
> > +
> > +                                             my $address1 = $email_address;
> > +                                             my $address2 = $author_address;
> > +
> > +                                             if ($address1 =~ /(\S+)\+\S+(\@.*)/) {
> > +                                                     $address1 = $1.$2;
> > +                                             }
> > +                                             if ($address2 =~ /(\S+)\+\S+(\@.*)/) {
> > +                                                     $address2 = $1.$2;
> > +                                             }
> > +                                             if($address1 eq $address2) {
> > +                                                     $authorsignoff = 4;
> > +                                             }
> > +                                     }
> >                               }
> >                       }
> >               }
> > @@ -6891,9 +6917,32 @@ sub process {
> >               if ($signoff == 0) {
> >                       ERROR("MISSING_SIGN_OFF",
> >                             "Missing Signed-off-by: line(s)\n");
> > -             } elsif (!$authorsignoff) {
> > -                     WARN("NO_AUTHOR_SIGN_OFF",
> > -                          "Missing Signed-off-by: line by nominal patch author '$author'\n");
> > +             } elsif ($authorsignoff != 1) {
> > +                     # authorsignoff values:
> > +                     # 0 -> missing sign off
> > +                     # 1 -> sign off present
> > +                     # 2 -> address matches, name different
> > +                     # 3 -> name matches, address different
> > +                     # 4 -> name matches, address matches without extension
> > +
> > +                     my $ctx_msg = "'Signed-off-by: $authorsignoff_ctx' should be:\n'Signed-off-by: $author'";
> > +
> > +                     if($authorsignoff == 0) {
> > +                             WARN("NO_AUTHOR_SIGN_OFF",
> > +                                     "Missing Signed-off-by: line by nominal patch author '$author'\n");
>
> I think in this case, we could actually turn this into an ERROR; now that
> we have the refined cases (2,3,4) on which we would just warn or 'note'
> with --strict checks.
>
> Send it as is to Joe Perches and lkml and I will repeat my comment on that
> mail and we will discuss it with Joe.

Okay sure I will do that. Thanks!

Dwaipayan
>
> Lukas
>
> > +                     }
> > +                     elsif($authorsignoff == 2) {
> > +                             WARN("NO_AUTHOR_SIGN_OFF",
> > +                                     "Author name mismatch:\n$ctx_msg\n");
> > +                     }
> > +                     elsif($authorsignoff == 3) {
> > +                             WARN("NO_AUTHOR_SIGN_OFF",
> > +                                     "Author address mismatch:\n$ctx_msg\n");
> > +                     }
> > +                     elsif($authorsignoff == 4) {
> > +                             CHK("NO_AUTHOR_SIGN_OFF",
> > +                                     "Author mail extension mismatch:\n$ctx_msg\n");
> > +                     }
> >               }
> >       }
> >
> > --
> > 2.27.0
> >
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
