Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B069C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:53:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CED422CF6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CED422CF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A37087128;
	Sun, 24 Jan 2021 16:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twcM5OITEvds; Sun, 24 Jan 2021 16:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D9E1F85B4A;
	Sun, 24 Jan 2021 16:53:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3988C0FA7;
	Sun, 24 Jan 2021 16:53:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF9AC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EED732042D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJwzikJvp55z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 4468320407
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:53:14 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id h11so21642209ioh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0byFTmg6hureAhgoankuFAlesb7KbNDQ8uuYz9H2URQ=;
 b=B3HKppl4KPBHo1W5fAv/dRWm/M+qaushTRQ2t0wUC7J1pFvs4iNNghNGJzxRUh//zH
 jojt0j3wcTlH8Mk0NaNrTXEryvGCohUksukmRN2uPXhxVsVS15l+H+Yn2/Lj1a+6rPIw
 a3c64SjYwZIAYKG50gM2b+drr1Tr8lQQzVHVbz7UaZcSqpc9lWGIzwna/Es3v8hRTOX8
 zLRnqkyIjNLLG03wIACjeCofhIGbtAdCyGRlgZj+jOP/AKVAE/s1jKMSeJKImuDRfJeT
 bL7Hmud+QEgYcT6TJLUxZrOigrpysmdKtGP7YSyI9L3EW5z+pxG/OxiAVGDM4eXeG1GO
 Mz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0byFTmg6hureAhgoankuFAlesb7KbNDQ8uuYz9H2URQ=;
 b=sj/EmWXvIYObmyxUQ9DPN1NGI7KF7eYw+hKyTDsZQxUP1GJtcv/Y8wDWlWLIXBNqFP
 oadePBJ5N6P1O1m4MeBtMvsEvWx3+JVVxAsZQbxYFfBzXNbNg82gbm1gil8fRCpBcUZe
 iFEDvBNIh78j5qdjecADuvpnzyUgFaw2xVKuN2nQ1ReA+7uibkGVepgTRGBcFG3Tiphh
 sivMAJtRj5mIktFP+XGCmP3kkSDrPTwIBWbNcrM+d4mAkcrV2PjSB93DOsIlIQDyjNfB
 kop8uxMC1kKofnpfVJ6o2yP++/Hz3ZGV6ehCJgSZFVSsM069y/fN7jA+4I7J2cLNZZ/L
 2F6g==
X-Gm-Message-State: AOAM533IWSWAtLj2zF9QvdlSXY9RmsPolhuTlGIMvbUSgY0ogVHJtm1r
 g9eYJzOjyaw3KS/IAeoKJ8ZdXOqtAiDOh1FgT/4=
X-Google-Smtp-Source: ABdhPJwPTsW1FdsPQ3ojF1BdQ9++N0K84UDtXNiHs+cwUGbHIT+wsUxZHTOYikbfJ+5FwunI33S8dXUWdSjde9K2QVI=
X-Received: by 2002:a05:6e02:1a68:: with SMTP id
 w8mr138154ilv.147.1611507193598; 
 Sun, 24 Jan 2021 08:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
 <20210124151933.19696-4-dwaipayanray1@gmail.com>
 <CAKXUXMyCU=QLtoXAtvzsa4WjU0Pnw4iezcgja9bSPZJyEPa5qA@mail.gmail.com>
 <CABJPP5BegcYznJ0wTBDoUg2b+wKeVrUxMnCQLowbOjMBDZkztQ@mail.gmail.com>
In-Reply-To: <CABJPP5BegcYznJ0wTBDoUg2b+wKeVrUxMnCQLowbOjMBDZkztQ@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 24 Jan 2021 17:53:02 +0100
Message-ID: <CAKXUXMw-6tUGco4Ra1Lg67cXSZGKomSHngMKa3QpYhTELU0riA@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 3/3] docs: add documentation
	for checkpatch
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

On Sun, Jan 24, 2021 at 5:47 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sun, Jan 24, 2021 at 10:08 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Sun, Jan 24, 2021 at 4:19 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> > >
> > > Link the tools directory to the document root for Sphinx.
> > >
> >
> > Sorry, I did not mean "Documentation/tools/checkpatch.rst"
> > _literally_; I only remembered that there is a subdirectory for
> > "tools" in Documentation; and quickly wrote the mail without checking
> > the actual name of the directory... assuming you would find the
> > directory I meant.
> >
>
> Oh my bad! I actually searched for a while for a directory which contained
> the scripts documentations actually and this totally slipped through my eyes.
>

Documentation structure is a mess... but it is slowly getting better :)

Lukas

> I will correct the linkage.
>
> > The directory is called "Documentation/dev-tools", it already has an
> > index file and the checkpatch.pl documentation fits nicely there.
> >
> > Luksa
> >
> > > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > > ---
> > >  Documentation/index.rst | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/Documentation/index.rst b/Documentation/index.rst
> > > index 5888e8a7272f..ddd30e08a440 100644
> > > --- a/Documentation/index.rst
> > > +++ b/Documentation/index.rst
> > > @@ -182,6 +182,17 @@ subprojects.
> > >
> > >     filesystems/ext4/index
> > >
> > > +Tools Documentation
> > > +-------------------
> > > +
> > > +The documentation in this section provides details about the kernel tools
> > > +and scripts.
> > > +
> > > +.. toctree::
> > > +   :maxdepth: 2
> > > +
> > > +   tools/index
> > > +
> > >  Other documentation
> > >  -------------------
> > >
> > > --
> > > 2.30.0
> > >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
