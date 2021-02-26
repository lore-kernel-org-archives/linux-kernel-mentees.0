Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1733C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:20:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFBF64F24
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FFBF64F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2CB7431D0;
	Fri, 26 Feb 2021 09:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H59Xj79zJBUK; Fri, 26 Feb 2021 09:20:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA652431CA;
	Fri, 26 Feb 2021 09:20:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A40C9C000B;
	Fri, 26 Feb 2021 09:20:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80383C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BCC34EF9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZQ8E6GeWldm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:20:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B7CB4EEF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:20:51 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id h4so9636980ljl.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 01:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/+uOWPFzzCIa7OYqY/m1Q3ZpjqDPg+5pHoY+BALxZ/U=;
 b=Z3rbVEuy27QsFeKZW3PXq2Elhy38QzYQkMGUZuaCQQteEwN/jhUxUY9fbtCQqwK6Kv
 GtdHt/k67d1Ys2qI21wo0X7bE1OF+QmLJ93Exj34/bVHBj7R5sIlBbHKDc3nTW73Ppjq
 eEu5TGjUhTY97dEIDA2t2vH/U8wS282yAlXa3lKedB4ugsHCO66ax74UJd9cMM+0iWcx
 FpamZupq+ysl+W7OvoUNBKNLecDKkaA0rTZzu+/N7CgA4lraiGD9vFWgYo/ap31MTvWO
 izW4Byrt8c5/UbHRdMJuFPTUHWn68zRckOwMhhtTsKgExEpgYclhGzZaVyZpX/ITRh6c
 ED8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/+uOWPFzzCIa7OYqY/m1Q3ZpjqDPg+5pHoY+BALxZ/U=;
 b=eCHfRTNbsn8ndkZevReka81nd2Af77kgQwGTBIGyw0OPKeQqb/TNK27wetvbE3e84l
 nuJYayzZpUUOFFAx3CLMdP3SkFbbSqIM0JK8hCM0JDWhtHoqSod6wM5jEYsrGUK37x++
 z5Omy2I5qsnigoNhYwn/yxWWgiT94EGnNspprFoPw4VtO4i4dZ01mMFGtgtq7VBW4FTk
 TKEMBnG5hUtTwlLsr3IFmns1iSXD15T1lqfdL8Igec05OkXqe0WAIdDAFRDuInNskKmA
 x2RrtbhZrPV0Boy872ZJNQYE4CQhTx63f74ejnUx9Q/bKr1DlnDdsebR8+XQ6BJ7lSwr
 kusQ==
X-Gm-Message-State: AOAM532ewUqJVhS7Zv/28IZwK4SSHv75OuIqTBXoO6XT7OOse6032Dxs
 8DYA29Oaah56CBbzPkXFRoxdF9SwwpPA2K3bj5M=
X-Google-Smtp-Source: ABdhPJxHwDkk2RC7PSi6k/SLb9+txpNmUX6H23sBPggngMR9pIJX2L7M/PBPNvFd01zy6xoKYhf/pi55HjzF21w3+1U=
X-Received: by 2002:a2e:8e33:: with SMTP id r19mr1185265ljk.40.1614331249049; 
 Fri, 26 Feb 2021 01:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
 <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
 <CAKXUXMyShHc8wu1HhVvr5tJYNL+sc_Yc-mfeoosK6hAL-HF_gQ@mail.gmail.com>
In-Reply-To: <CAKXUXMyShHc8wu1HhVvr5tJYNL+sc_Yc-mfeoosK6hAL-HF_gQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 26 Feb 2021 14:50:48 +0530
Message-ID: <CABJPP5BTLzQHVBtyqHofiRxZ4QkQ-OxBECvnQJE8e-yKmuUJWA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
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

On Fri, Feb 26, 2021 at 11:29 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Feb 25, 2021 at 7:08 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
> > >
> > > On Mon, 2021-02-22 at 13:22 +0530, Dwaipayan Ray wrote:
> > > > Add a new verbose mode to checkpatch. The verbose test
> > > > descriptions are read from the checkpatch documentation
> > > > file at `Documentation/dev-tools/checkpatch.rst`.
> > > >
> > > > The verbose mode is optional and can be enabled by the
> > > > flag -v or --verbose.
> > > >
> > > > The documentation file is only parsed by checkpatch.pl
> > > > if the verbose mode is enabled. The verbose mode can
> > > > not be used together with the --terse option.
> > >
> > > I don't have any real objection to this patch set, but as this
> > > might be added to the Documentation tree and in .rst format,
> > > perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
> > > some opinion.
> > >
> > > Also I do not want to be a maintainer of this .rst file and
> > > likely neither Jon nor Mauro would either.  Perhaps you?
> > >
> >
> > I could take it up if everybody is okay with it!
> >
>
> And as I set Dwaipayan on this task on documenting checkpatch, I will
> assist in maintaining this file as well. I will also pull some strings
> to increase chances that Dwaipayan becomes a longer-term member in
> this community and on this maintainer task.
>
Sounds nice to me! I would definitely love to remain as a active
member even after the mentorship period ends. So I think this is a good
start :)

> > > Ideally, the patch order would be reversed so the .rst file
> > > is added first, then checkpatch updated to use it.
> > >
> >
> > Sure, if Jonathan or Mauro has no objections to it, I will be happy
> > to resend it so that it can be picked up properly.
> >
> > > And _a lot_ more types and descriptive content should be added.
> >
> > Yes that's for sure. If this makes it I will try to get all of the
> > other types in.
>
> I agree as well, probably a critical mass for inclusion is that we
> have at least 25% (so roughly 50 rules) documented.
>
> > And if Lukas agrees, a little help from my fellow kernel mentees will
> > be nice as well!
> >
>
> Completely agree. I will recruit new mentees and go through the
> exercises with them, until they are ready to send proper patches to
> checkpatch.rst. As the designated maintainer of that file, you will be
> busy reviewing, consolidating that content and pushing back if it is
> not good enough for inclusion (so just as in the typical "good cop-bad
> cop" game: I will motivate and help them to submit, you make sure you
> get good content).
>
That is a nice plan! Certainly looking forward to it.

Thanks & Regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
