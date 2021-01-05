Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EACC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:41:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF71322525
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF71322525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7045C87092;
	Tue,  5 Jan 2021 08:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SnxfMyjFIJcX; Tue,  5 Jan 2021 08:41:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA37C8708F;
	Tue,  5 Jan 2021 08:41:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1C9FC088B;
	Tue,  5 Jan 2021 08:41:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A30EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D07C867D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JK8e0HUqmtjn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:41:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60EB584EA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:41:18 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id x20so70727578lfe.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 00:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NenDwkrpbvd557UF+4eIUPLbDddtzQBzcLFfoXbGKdY=;
 b=XLcEkNGR9V6PxTDRn8SaMQcT4HxzkpjACmlsXCswx0mAekpax9s0NxlcQIZUPLtjCZ
 pTXb3Y/my8bKOsv/GQwKMDovZT+WDzdROdLmYJcaIpCwnQ81fOtIL972I+htbziw5Y4U
 1f/kgV+DdXdblrVW409sS6yXwgpIUVqrqLKezjg+g3pcrpS4ExNIKXMKpdg+cgrI229C
 K7AillBX5BE6ZDdZJM2zW+DRORefJnqkCXVs6yYLqeJ9eTXb3CauS888B/tfNWDU1Ima
 qE4AdlUPZm3F5zQukDYaOh+C1OHO0eYH+VvEViCeKd1RadPL8AnIiEX6ze0wQByLJi/9
 60+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NenDwkrpbvd557UF+4eIUPLbDddtzQBzcLFfoXbGKdY=;
 b=HAmRkJdYBFeVbm7AkZ4gD/J1lbR8cpkhaIBmkDGlN3MOrTy+Gmtz1ue19B3sE7jr2w
 5LiiXSBSUPVsPnwe2Hh6ZvZKPEnd4iYlma6SH0ec86ooLD1bzJQQ2LVJMtthDZf/rUDy
 S1Pi7kBOicyPImACHJxjILngxtux9WSl7f2eJmX9ai8H2QHnd6FopvnPeMpqVpRfG3tg
 K+lGbJCjqB+k2qmEFrqjit9Bfj6b0+N9FvwMmtrbMoO2elC2gkEbsFOJNLo5Lm9EL2fe
 tfPddv40tUREnUTgNo+24iEsOo0A4XpUcjtaBaLN3ffZN89F5DI150WUHTch8npi3i7o
 Os4g==
X-Gm-Message-State: AOAM531EnjrRVbT2uJ6jMbOE/H94AEt7t7nNV+MzbshVGHdKVwGTsRDu
 zxxJzLCV4sau+u7QPtsnwbUwwpGesfGGUeUH+V8=
X-Google-Smtp-Source: ABdhPJwJCIe0/dfprNuQFZabAD/hM5SzSE8m+aT873oyweh642ct8cCOeCHDpdt3DvG4K6Di70Fy54nZhC9Yk5VJK0w=
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr32181442lfp.117.1609836076495; 
 Tue, 05 Jan 2021 00:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
 <CAKXUXMxFRU=1V+dRGX8MkK329VoSH_gUVDOxscwh1K4OeQhs=w@mail.gmail.com>
In-Reply-To: <CAKXUXMxFRU=1V+dRGX8MkK329VoSH_gUVDOxscwh1K4OeQhs=w@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 5 Jan 2021 14:11:04 +0530
Message-ID: <CABJPP5AzpXD7Okx5m3J01aY27xBJm6-Ax4Zn9zOD4=AB217epA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: trivial style fixes
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

On Tue, Jan 5, 2021 at 1:34 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Mon, Jan 4, 2021 at 2:25 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Indentations should use tabs wherever possible.
> > Replace spaces by tabs for indents.
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
> Looks good.
>
> Find out who is to blame for this stylistic mess up. (use git blame).
>
> If it is Aditya, let him know to check better and how you discovered
> this mess-up.
>

I think some of Aditya's earlier patches caused this. I was idly running the
regex "^[ ]+" on files which detected these misuses. Probably it's a
broken editor
which expanded tabs, maybe vim with exandtab set. Aditya could you verify your
editor config? Thanks.

Thank you,
Dwaipayan.

>
> Lukas
>
> > ---
> >  scripts/checkpatch.pl | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index b212f5f12ca6..d6a4d25b0972 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2973,7 +2973,7 @@ sub process {
> >                                 }
> >                                 if (!defined $lines[$linenr]) {
> >                                         WARN("BAD_SIGN_OFF",
> > -                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
> > +                                            "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
> >                                 } elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
> >                                         WARN("BAD_SIGN_OFF",
> >                                              "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
> > @@ -2996,8 +2996,8 @@ sub process {
> >                         if (ERROR("GERRIT_CHANGE_ID",
> >                                   "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
> >                             $fix) {
> > -                                fix_delete_line($fixlinenr, $rawline);
> > -                        }
> > +                               fix_delete_line($fixlinenr, $rawline);
> > +                       }
> >                 }
> >
> >  # Check if the commit log is in a possible stack dump
> > @@ -3239,10 +3239,10 @@ sub process {
> >                                 next if ($start_char =~ /^\S$/);
> >                                 next if (index(" \t.,;?!", $end_char) == -1);
> >
> > -                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> > -                                if ($first =~ /\b[0-9a-f]{2,}\b/i) {
> > -                                        next if (!exists($allow_repeated_words{lc($first)}));
> > -                                }
> > +                               # avoid repeating hex occurrences like 'ff ff fe 09 ...'
> > +                               if ($first =~ /\b[0-9a-f]{2,}\b/i) {
> > +                                       next if (!exists($allow_repeated_words{lc($first)}));
> > +                               }
> >
> >                                 if (WARN("REPEATED_WORD",
> >                                          "Possible repeated word: '$first'\n" . $herecurr) &&
> > @@ -4426,7 +4426,7 @@ sub process {
> >                         WARN("STATIC_CONST_CHAR_ARRAY",
> >                              "char * array declaration might be better as static const\n" .
> >                                 $herecurr);
> > -               }
> > +               }
> >
> >  # check for sizeof(foo)/sizeof(foo[0]) that could be ARRAY_SIZE(foo)
> >                 if ($line =~ m@\bsizeof\s*\(\s*($Lval)\s*\)@) {
> > @@ -5279,7 +5279,7 @@ sub process {
> >                     $lines[$linenr - 3] !~ /^[ +]\s*$Ident\s*:/) {
> >                         WARN("RETURN_VOID",
> >                              "void function return statements are not generally useful\n" . $hereprev);
> > -               }
> > +               }
> >
> >  # if statements using unnecessary parentheses - ie: if ((foo == bar))
> >                 if ($perl_version_ok &&
> > --
> > 2.27.0
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
