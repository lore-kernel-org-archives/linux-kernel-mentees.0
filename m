Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683C8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:20:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C2B60FC2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07C2B60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9EEA83A72;
	Tue,  3 Aug 2021 18:20:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjoDlJzFTJ3H; Tue,  3 Aug 2021 18:20:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 28E9383A66;
	Tue,  3 Aug 2021 18:20:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05F1DC0010;
	Tue,  3 Aug 2021 18:20:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14487C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 047D16061A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8JwMG5fModk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:20:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2807C605B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:20:35 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id k65so66976yba.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ykUghgVs2ie1mqQ8GP6DsAi6Z3T0zWRrWjpsADmaPK4=;
 b=j6Zu10wPkB9LwaLkr8KwT+MYH/kMVl57EkEO1BVPTZ43AlzdFgkau2kTQlPGZyWBmN
 +L7rqvhoqT0odxbkEZMVYL3RrQYdMms8WEMegk+QDoxXTBAfx0s+vlc2wbh3SJjf7nCd
 JFgGQpYNoORuIQRGEWtD9s4G8VRk0rw26PjZps7WyMCx1Nus2tOR0sXkK1NsQJSaGkLY
 oEmXsKSjtZiYXtPevv9m6Eme5X8EO+89WjUiBVRrq3YbnMumv2iFGaIMoO/DZiU6/stn
 Gr/6wRJnZPerqAEPfKuzj3ecZpu0PLx+d8y+DUj3dSbJXpH9IV5q3AFBZPD7Ma5FoyLn
 0vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ykUghgVs2ie1mqQ8GP6DsAi6Z3T0zWRrWjpsADmaPK4=;
 b=PSkbGbdZySJ+2gIHtcQPDjbN7bnDKEUTB5Z8ioyTU7Y751ZC3UtBPuGcYJwgQRk/Sj
 syBvM7/VXa4s/wWG6S1qyPKqRl6dtAlyCRpVhAVZhm2hYQXzj0l/WleaNBqo3u3iaVH5
 UTKEmqn1kW5hQjdPu/xDyBc+8b9Zsgpf1vHDETaGlQMPh2KWoicSE58SS7Rt7JxiAIvO
 wtKFxs+ZtBaIsokbMaigrJBSz89t3xNWrDT7U9efjwvrdMBbnhQrPeWBNTK1nqCHzFmb
 2W6HOh7JbrhR1XRCG+d357w1tc+WoxuzQ29WkAMDKSilSD4kuWNPWzJ1UfHzyTTrJBua
 2lJA==
X-Gm-Message-State: AOAM530BbDw4U8te4xjWpbazLmb6RvDET6wyw1xQdUYYCsDKZDUY0n+g
 dIYzOMM7PLiiJbzdTG3Tlec3N8YSkmgAHJrxh8Q=
X-Google-Smtp-Source: ABdhPJyMigwTgWakgmE+ugu17AzcA2PGXv3pbLY2YNllU5wClpKydppvS2fxa+HETEXd/J8EYC0sCqckO2wHs46uBXw=
X-Received: by 2002:a25:f310:: with SMTP id c16mr22337239ybs.464.1628014834035; 
 Tue, 03 Aug 2021 11:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803141751.16893-1-utkarshverma294@gmail.com>
 <CABJPP5B90d_wsEjcG=agKO8KAHaB11Bjh-mgtZtdmrkfooWcYg@mail.gmail.com>
 <20210803181357.GA2736@uver-laptop>
In-Reply-To: <20210803181357.GA2736@uver-laptop>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Aug 2021 20:20:23 +0200
Message-ID: <CAKXUXMwp+mNPcZNUjNqShY_9my_iBp=oojy7EGpgbu6OpE-bMQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Add SPLIT_STRING message
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Aug 3, 2021 at 8:14 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> On Tue, Aug 03, 2021 at 08:22:39PM +0530, Dwaipayan Ray wrote:
> > On Tue, Aug 3, 2021 at 7:49 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> > >
> > > Add a new message type SPLIT_STRING under the 'Indentation and Line
> > > Breaks' subsection. Checkpatch documentation for the splitting of
> > > quoted strings that appear in userspace, across multiple lines.
> > >
> > > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > ---
> > >  Documentation/dev-tools/checkpatch.rst | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> > > index f0956e9ea..32a26a800 100644
> > > --- a/Documentation/dev-tools/checkpatch.rst
> > > +++ b/Documentation/dev-tools/checkpatch.rst
> > > @@ -710,6 +710,10 @@ Indentation and Line Breaks
> > >
> > >      See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
> > >
> > > +  **SPLIT_STRING**
> > > +    Quoted strings that appear as messages in userspace and can be
> > > +    grepped, should not be split across multiple lines.
> > > +
> >
> > Is there any reference you can point to for this?
> > Usually LKML links are okay. So you can try adding some discussion
> > link which helps know more about why this message is important.
> >
>
> Is this reference fine:
> https://linux-kernel.vger.kernel.narkive.com/vc8OoIUF/patch-checkpatch-check-for-quoted-strings-broken-across-lines
>

Use Links to lore.kernel.org.

> Should I include these references in the commit description or the
> documentation file?
>

Add them in the documentation file. Then readers can follow those
links if interested.

Also, if there is some general conclusion within the referenced email
thread, it is good to summarize that in the documentation.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
