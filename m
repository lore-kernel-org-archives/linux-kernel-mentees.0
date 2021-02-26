Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F95C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 08:53:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A04164EC3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 08:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A04164EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0DCF43372;
	Fri, 26 Feb 2021 08:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HY2Ck1yLUhw5; Fri, 26 Feb 2021 08:53:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12612431D0;
	Fri, 26 Feb 2021 08:53:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2728C000A;
	Fri, 26 Feb 2021 08:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DE29C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C1714EF6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O85RSajwa3gl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:53:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A12D4EF6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 08:53:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b3so7787046wrj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kNEmrMUnoRO3jTYiSsoULEzq/+mwZ/afdSXWdymP48=;
 b=tAlcyLRXVkY+yIqpFQ3R3Y5HkxH6+QALeswaRb1bDca5i33FVKfdIHrQTxPq3myZqG
 BVxiEeXozhM7ONvkyzC/j+n1doiN2U94iG7AAX6vejluri/HNv5FGT2QxRQ/intiKyEZ
 ulcS0+AnNdOT8X1oX7rP3mHIcXXwCoe3n2q4GvbGAw+yGJybvPYEqJ2tfIg6DJOMHWCD
 Chmn6raavsakWK/afMhft765MroKboZf1Fz6Nm/5z6x+EJRb2VJ5ldD3wSf0FtVSYXCN
 mwpmIesKoW42UahpeHVtfCvq6KfT3dagb5iQfECwUjPF64Y7+gLjosKnJ/ZiA91cpvru
 LhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kNEmrMUnoRO3jTYiSsoULEzq/+mwZ/afdSXWdymP48=;
 b=PuSpTzb9Te57YNrFlz3tybI2zWp91Xxn1PRBZnHeUE99OhhA6Li64wfXbT4pVeN7kV
 HdoBbLR3hymmN1MM7DvbxTnsGn7oyuZtfa/4D07j4r0zcG2ZneUMlAplcj7b97sDQFiY
 jnDzVi9JDV/GVKtTSL8WaUQ9MZVQar8kNnXDTWXfi23v0/NpDdUA8393DzBP2ysyzmhJ
 8vicZC5KwqM1lQXl5osBNYuQGyzlp0Hz6ZvXFfOpLYO5ce4Vku2m6b8wSiskVyLfkVw4
 MFIAl1h3c/tEGCYcot1o02ZR7YZxT9MP5zp2i386IAFfnxvCZLNxkFWUzZIoJHC5MyfQ
 DUPw==
X-Gm-Message-State: AOAM532yiUTg7Fu2rY1hg774MVwSCu+JPRkmLBR8CiXb90JSS1EdBW+F
 e970qcBmQnmzxVWwt+T+2y1Iwh2JwRKZSFu2NpI=
X-Google-Smtp-Source: ABdhPJyPB9pHDA3cux0fkSStbgJSLMHmFjWlwBhDYI4jG2WuPBWqV7hlzmOlRQdWCRI90pIDl/VB8gR8RAXsWWfRIJQ=
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr2091283wrd.118.1614329626375; 
 Fri, 26 Feb 2021 00:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20210222075205.19834-1-dwaipayanray1@gmail.com>
 <bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com>
 <CABJPP5AARO3h2mt-piPWuOD3kY_XzNfW-s2mi=btfOayVPURHg@mail.gmail.com>
 <87mtvrc0gz.fsf@meer.lwn.net>
In-Reply-To: <87mtvrc0gz.fsf@meer.lwn.net>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 26 Feb 2021 14:23:46 +0530
Message-ID: <CABJPP5CjbKCCtnafg6BP6CXTwCVMtGw15jk=jFvWLjij2kp_jA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] checkpatch: add verbose mode
To: Jonathan Corbet <corbet@lwn.net>
Cc: Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Fri, Feb 26, 2021 at 2:46 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Dwaipayan Ray <dwaipayanray1@gmail.com> writes:
>
> > On Thu, Feb 25, 2021 at 11:03 PM Joe Perches <joe@perches.com> wrote:
> >> I don't have any real objection to this patch set, but as this
> >> might be added to the Documentation tree and in .rst format,
> >> perhaps Jonathan Corbet and/or Mauro Carvalho Chehab might have
> >> some opinion.
> >>
> >> Also I do not want to be a maintainer of this .rst file and
> >> likely neither Jon nor Mauro would either.  Perhaps you?
> >>
> >
> > I could take it up if everybody is okay with it!
> >
> >> Ideally, the patch order would be reversed so the .rst file
> >> is added first, then checkpatch updated to use it.
> >>
> >
> > Sure, if Jonathan or Mauro has no objections to it, I will be happy
> > to resend it so that it can be picked up properly.
>
> So I haven't been copied on this for a while.  Looking in the archives,
> I see that you have a manual table of contents at the top of the
> document; you could take that out and let Sphinx generate it (and keep
> it current!) for you.
>

Sure that sounds nice.
I will modify the series and send the v8 in so that you can pick it up
from there. That shall include the MAINTAINERS patch sent by Lukas
as well.

> Either way, though, if you want to merge this via some other path, it's
> OK by me:
>
> Acked-by: Jonathan Corbet <corbet@lwn.net>
>
Thanks for the ack!

Regards,
Dwaipayan.

> Thanks,
>
> jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
