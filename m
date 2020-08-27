Return-Path: <SRS0=GPwV=CF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A986AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 07:24:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DF822BEA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Aug 2020 07:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn9L5Y4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DF822BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4ECB486382;
	Thu, 27 Aug 2020 07:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzhdFpGcTSn8; Thu, 27 Aug 2020 07:24:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D5E3B863A8;
	Thu, 27 Aug 2020 07:24:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1F7CC07FF;
	Thu, 27 Aug 2020 07:24:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A464C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 19FF8863B2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ua9MiW2OgUHK
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0422A86416
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 07:24:39 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id f75so4057992ilh.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Aug 2020 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JWPl57tf9w4YugJKGhi2SJEhhJabztAvPbOq+1hSSaQ=;
 b=dn9L5Y4roWbC1wjeaob9/y+ZUbOs7yaF9mw5VKt4To+MclsXT7bmxeeJ5qUi0E+n9u
 5JIh/1vU9LqFyvdD9I5/2rcv+DKdWKKXmQal9YSPx78RDkql4IUN7pCnZkq0/N5oMIT6
 Mxt7oWPF7p2bZYQRRoNd3iycO8/UXlLlAAnRnGFxxqAR4zg0Cr5XDn4MJKD7+wWUAcE5
 e1Sqz5gusDftlA+xyCnP3AOQ+Tq9D+P8xOLYq5Hir8euSfzZ261cmKaVQlN9/a8lU447
 1j35Nxf+0TCjo20mScOlHdmVHgcmngM5N93LXpgmDTiCuqZaVcwxOAfN85YeBX4vc2q1
 yN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JWPl57tf9w4YugJKGhi2SJEhhJabztAvPbOq+1hSSaQ=;
 b=M6MCIGDTSnCaidC4M5yXku0Jz3AdtIqN/tkXYlR1t33K7M5/4Xta0FIZaElOvUocEB
 OIOMcjRb5nsKeVH2KlFz/AlNdQwgyxNR/7gxeL7EsCHXdyGHpa3QIaPIWMOWbtKynveN
 DRq2UUyqeE9rwKNCi/8rtbWYN2UHGJNXdrC55MPnoHZYsGAuu/dd1q+qqQyyAjOhPVGe
 ReHNXzcPsF6QT4l9Q7W0eCw5uPygFirrOBbsymzH2v69wzu4nOStohpR+Ml0msxOPeEW
 rwoW0fBiapsx0sGykEBI4O9ilbGJWcoZUMT1l2dQU9eGIPblBWLx6+QHPED+hSysuW3y
 /jmA==
X-Gm-Message-State: AOAM533NolZWartnbsPjSQEp3RbxuU31kpJ7DovOekzJxPy7zCqA33n9
 zUKzgI4gxbF8tADhcXcleuTC38Qvo8ExRJCBjMk=
X-Google-Smtp-Source: ABdhPJwIC1ayIQUhoKmYC4pgiTkQ877WPX6OmOKKHS1QxuAwZwAEN/Er73lV6Auz5pPDE1lIFqPrJE+WhMcDDGxpMds=
X-Received: by 2002:a92:3209:: with SMTP id z9mr16651391ile.260.1598513078207; 
 Thu, 27 Aug 2020 00:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200827060523.6fi34tcrg5xndzuu@mrinalpandey>
 <20200827061307.54526dz54p3gd45u@mrinalpandey>
 <CAKXUXMyZsENwp2jM106N_uao+yj=R-tGJDLerSO-GqtL+Qd3qg@mail.gmail.com>
 <20200827062647.7olorxqfd2nrbzyf@mrinalpandey>
In-Reply-To: <20200827062647.7olorxqfd2nrbzyf@mrinalpandey>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 27 Aug 2020 09:24:27 +0200
Message-ID: <CAKXUXMwpbvLCGzh7_OaETaF6PSbbd4ta4fmsz1FTBgECZa91fg@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: Add intended executable
	mode and SPDX license
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

On Thu, Aug 27, 2020 at 8:26 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>
> On 20/08/27 08:16AM, Lukas Bulwahn wrote:
> > On Thu, Aug 27, 2020 at 8:13 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
> > >
> > > On 20/08/27 11:35AM, Mrinal Pandey wrote:
> > > > commit b72231eb7084 ("scripts: add spdxcheck.py self test") added the file
> > > > spdxcheck-test.sh to repository without the executable flag and license
> >
> > s/to/to the/
> >
> > > > information.
> > > >
> > > > commit eb8305aecb95 ("scripts: Coccinelle script for namespace
> > > > dependencies.") added the file nsdeps, commit 313dd1b62921 ("gcc-plugins:
> > > > Add the randstruct plugin") added the file gcc-plugins/gen-random-seed.sh
> > > > and commit 9b4ade226f74 ("xen: build infrastructure for generating
> > > > hypercall depending symbols") added the file xen-hypercalls.sh without the
> > > > executable bit.
> > > >
> > > > Set to usual modes for these files and provide the SPDX license for
> > > > spdxcheck-test.sh. No functional changes.
> > > >
> > > > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
> > > > ---
> > > >  scripts/gcc-plugins/gen-random-seed.sh | 0
> > > >  scripts/nsdeps                         | 0
> > > >  scripts/spdxcheck-test.sh              | 2 +-
> > > >  scripts/xen-hypercalls.sh              | 0
> > > >  4 files changed, 1 insertion(+), 1 deletion(-)
> > > >  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
> > > >  mode change 100644 => 100755 scripts/nsdeps
> > > >  mode change 100644 => 100755 scripts/spdxcheck-test.sh
> > > >  mode change 100644 => 100755 scripts/xen-hypercalls.sh
> > > >
> > > > diff --git a/scripts/gcc-plugins/gen-random-seed.sh b/scripts/gcc-plugins/gen-random-seed.sh
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/scripts/nsdeps b/scripts/nsdeps
> > > > old mode 100644
> > > > new mode 100755
> > > > diff --git a/scripts/spdxcheck-test.sh b/scripts/spdxcheck-test.sh
> > > > old mode 100644
> > > > new mode 100755
> > > > index cfea6a0d1cc0..758fa645ed99
> > > > --- a/scripts/spdxcheck-test.sh
> > > > +++ b/scripts/spdxcheck-test.sh
> > > > @@ -1,5 +1,5 @@
> > > >  #!/bin/sh
> > > > -
> >
> > Why do you delete the newline?
>
> Sir,
>
> I will rectify this and include the above suggested change in the final
> patch.
> >
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > >  for PYTHON in python2 python3; do
> > > >       # run check on a text and a binary file
> > > >       for FILE in Makefile Documentation/logo.gif; do
> > > > diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
> > > > old mode 100644
> > > > new mode 100755
> > > > --
> > > > 2.25.1
> > > >
> > >
> >
> > I think it is fine to have this as a single patch. It is local enough
> > to say that we are touching all those files in a single go.
> >
> > Other than that, it looks good to me.
> >
> > Please state to whom you intend to send this patch.
>
> Running get_maintainer.pl on patch suggests to send it to the following adresses:
>
> Kees Cook <keescook@chromium.org> (maintainer:GCC PLUGINS)
> Emese Revfy <re.emese@gmail.com> (reviewer:GCC PLUGINS)
> Matthias Maennich <maennich@google.com> (maintainer:NSDEPS)
> Thomas Gleixner <tglx@linutronix.de> (maintainer:LICENSES and SPDX stuff)
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:LICENSES and SPDX stuff)
> kernel-hardening@lists.openwall.com (open list:GCC PLUGINS)
> linux-kernel@vger.kernel.org (open list)
> linux-spdx@vger.kernel.org (open list:LICENSES and SPDX stuff)
>

I think you should ask for a quick ack from (Kees or Emese) and
Matthias and Thomas, and add

Andrew Morton <akpm@linux-foundation.org>

and ask Andrew to pick up this patch once the ACKs from the people
above are there. The patch travels best through Andrew's tree.

Also, CC linux-kernel-mentees, Shuah and me.

So, go fix the minor points I mentioned above and then send it out to
the proposed list with my mentioned additions here.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
