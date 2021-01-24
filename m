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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB17C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:47:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F65922AAA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F65922AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0C5F868BB;
	Sun, 24 Jan 2021 16:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqzWUVyw75IQ; Sun, 24 Jan 2021 16:47:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 10A9F86913;
	Sun, 24 Jan 2021 16:47:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F04DBC0FA7;
	Sun, 24 Jan 2021 16:47:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0867C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BA3542042D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:47:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VswT9CaL7ssn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:47:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by silver.osuosl.org (Postfix) with ESMTPS id 78E812034B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:47:04 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id l12so9830378ljc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9NIS6Ud3qDNLiPYZEyQHP2TMK0Z6bt1uyc35KdYk/s=;
 b=FppXdg8qC1ODKhZSCj2zjrCpnTIrMyr2Ea7bZfueOW1SJtLT7U2UPLRf5HnHEP1OIs
 wGdAMKahrpKHZXf1HbN6qSHJZqoggU+LeaGHZODA2TNSDRlYeS0Q5qSaNQF7OiuMabOo
 i9Ot+xfimWtFbGF9kqotSTpsDvxTuN/PeBYhdpEPIQWdpMvcEB7g4mitjki/6CCicC+0
 DrQQMTijqxBUzaUYbg6GVmvlDQ6MnDoTlr1dHetk7xaVNGB85i5Blaruxrue7HRkU5fT
 4znIBTFxiazBk9AjanEHCVzhsyqMnbJCxcokorDYKaiWwRFUinGOhbOcGOb3HmOrl6do
 tiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9NIS6Ud3qDNLiPYZEyQHP2TMK0Z6bt1uyc35KdYk/s=;
 b=EdOcPwIYGjRivVm8WmlkXSFwuUbj7axnQdSsiMGlNvNFcw0ef5wf12hDmHbma35ML+
 qUJh4OnxDRjNVMa9CWnGCr8O7gC8xSKuDOb/eptEZj2QFnbroohB5iqA9oQUtBelquCG
 GyVxgegtbj5kBaWpyv0YM1s8y5OHqupOLjbzuaBLTpVRi/jpCIfPJ60EpaT2I+KLzaXp
 e09HyVp5hfPPRiuTlCQ/Q0hop7b8FdW9MewIwe5NjQWhU/rJ/tQNtdvW4IbGx3+EWdTl
 aE4Lw76di8VaGOjE08rRFS51rsiZE7zSAe2EX/4jAZpTWqFDDL/UazKizRm7TUtVmjk3
 0Xow==
X-Gm-Message-State: AOAM531Cq9EwuenWYYmjqKMV1YwRx3dmUcW8biEOOIkNDibt3//eZTQ0
 7sF3oMHQP82K2ohg1sbAgyUvJn2XOxUehCwEL/o=
X-Google-Smtp-Source: ABdhPJwwsIdjnF70Ofww6mvJ4WQtVhX6udRo5HgycZAK7P3l9g2SKyWAIbPNC4e3XVveSKKGCe6Utbt5DwqIrfqASf4=
X-Received: by 2002:a2e:960d:: with SMTP id v13mr1545712ljh.370.1611506822515; 
 Sun, 24 Jan 2021 08:47:02 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
 <20210124151933.19696-4-dwaipayanray1@gmail.com>
 <CAKXUXMyCU=QLtoXAtvzsa4WjU0Pnw4iezcgja9bSPZJyEPa5qA@mail.gmail.com>
In-Reply-To: <CAKXUXMyCU=QLtoXAtvzsa4WjU0Pnw4iezcgja9bSPZJyEPa5qA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 24 Jan 2021 22:16:58 +0530
Message-ID: <CABJPP5BegcYznJ0wTBDoUg2b+wKeVrUxMnCQLowbOjMBDZkztQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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

On Sun, Jan 24, 2021 at 10:08 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Sun, Jan 24, 2021 at 4:19 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Link the tools directory to the document root for Sphinx.
> >
>
> Sorry, I did not mean "Documentation/tools/checkpatch.rst"
> _literally_; I only remembered that there is a subdirectory for
> "tools" in Documentation; and quickly wrote the mail without checking
> the actual name of the directory... assuming you would find the
> directory I meant.
>

Oh my bad! I actually searched for a while for a directory which contained
the scripts documentations actually and this totally slipped through my eyes.

I will correct the linkage.

> The directory is called "Documentation/dev-tools", it already has an
> index file and the checkpatch.pl documentation fits nicely there.
>
> Luksa
>
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  Documentation/index.rst | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/index.rst b/Documentation/index.rst
> > index 5888e8a7272f..ddd30e08a440 100644
> > --- a/Documentation/index.rst
> > +++ b/Documentation/index.rst
> > @@ -182,6 +182,17 @@ subprojects.
> >
> >     filesystems/ext4/index
> >
> > +Tools Documentation
> > +-------------------
> > +
> > +The documentation in this section provides details about the kernel tools
> > +and scripts.
> > +
> > +.. toctree::
> > +   :maxdepth: 2
> > +
> > +   tools/index
> > +
> >  Other documentation
> >  -------------------
> >
> > --
> > 2.30.0
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
