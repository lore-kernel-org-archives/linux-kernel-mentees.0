Return-Path: <SRS0=BNRj=NA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AA9C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 13:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAF060EBC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 13:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BAF060EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D152482433;
	Mon,  9 Aug 2021 13:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V3D12uentYpG; Mon,  9 Aug 2021 13:32:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EF9DE82B34;
	Mon,  9 Aug 2021 13:32:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6ED7C001A;
	Mon,  9 Aug 2021 13:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 117EFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 13:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1BF06071E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 13:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhZEXtgg3I1r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 13:32:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB39960647
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 13:32:55 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id y130so5644654qkb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 06:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kDc+zEFlNfSRNqWBIihxaIKiRuWuKU5lfZI0WUrgOo4=;
 b=Z7wIq/Ehq6ekbDhqbI1F1TCo7ar61zSJs14wnsQTnODz6TbFy79M+YtoCSsnE+lp7o
 BQnLgJMHidQ47Y66cS+Xd8KM+nvLEvUXzX/gXeCwu0/GocMU6Ps9lRYEtJGwnQdvJKVE
 MkvSFNVAEgsKrkAoJN5LSZpvV9BT5/Xp5bQ2TQCd5JFamaQo6ULe0A81mB9yM19ZmtnT
 yYTK4ouOLoAK0YkHtBXLr3sQldh2S3mIwx2UtQS31lgsGNVr/rl9BKdFevdoZKCjKgS+
 jSADkp8LlWQzWpDq8z5B3lAYBQwoJrBHY7ZvReRgNY2oJsLkXB/+tQfahl/nVg2XWbO9
 Jnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kDc+zEFlNfSRNqWBIihxaIKiRuWuKU5lfZI0WUrgOo4=;
 b=NspdkSF3jdv5cHC2SZpd/ty4HyxxiLA6PgYf6XWMgImPbjgWc5R91Eej7Kwy9X53RL
 2JB1jTa/h1Q0QtEPWG9YfJ9iGZOunLH1UODWbiYhFtfXnLUZVDyU3JA8fx+A1mRyCMZq
 xBv0EkNt9CXnQsqrH+IOaEPAoUg2Y+HLpo3pGtc7llPFEcgk2zvBddDQcKYgx6riaJHV
 XjcEyJHjKaY2Nc+bmKSc7IGYDJeSm9rOPKA8POfJBhGwT6Urn/ivTcIMYgSJ74hqqOL1
 vIzYxxzg6DU00tOQEzfe197UuwvjpfiMZd0Rq8OZ5F7UEEl8nVKXg2nLN3tp9VEwgLvF
 CteA==
X-Gm-Message-State: AOAM533qpKQPQVTdGNZtEZCC+kKyKC4jW56EaO4RWkhOfm8qyw0V1ZtO
 mhQkCaPyTfGHIuS9YwLGpKnSPOWxQJAmgevgeXI=
X-Google-Smtp-Source: ABdhPJxfzi73VTf8rk0kAS6xjbRkchw17CnK7TfKdlgoFuNAiyK5FaXhIUTq0LVpyagXF5InTFKo7er+Qe2OwYaDFtQ=
X-Received: by 2002:ae9:e213:: with SMTP id c19mr22821608qkc.451.1628515974555; 
 Mon, 09 Aug 2021 06:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210806151841.13940-1-vineshraut2017@gmail.com>
 <CABJPP5Byjb+xz3QZMo38bHu02rqwOfwuPjdzsyiHRUpr_zyhDA@mail.gmail.com>
In-Reply-To: <CABJPP5Byjb+xz3QZMo38bHu02rqwOfwuPjdzsyiHRUpr_zyhDA@mail.gmail.com>
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Mon, 9 Aug 2021 19:02:42 +0530
Message-ID: <CAMqN5U7xVZ2zjGT1upR9XxThR6RMk4J8LTB69CnkY0igxdKdFA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: checkpatch: add UNNECESSARY_CASTS
 message.
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Aug 7, 2021 at 1:36 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 8:49 PM Vinesh Raut <vineshraut2017@gmail.com> wrote:
> >
> > Add verbose description for UNNECESSARY_CASTS message type.
> >
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
> > ---
> >  Documentation/dev-tools/checkpatch.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> > index f0956e9ea2d8..9cb6b9059fc6 100644
> > --- a/Documentation/dev-tools/checkpatch.rst
> > +++ b/Documentation/dev-tools/checkpatch.rst
> > @@ -268,6 +268,15 @@ Allocation style
> >
> >      See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
> >
> > +   **UNNECESSAR_CASTS**

+   **UNNECESSARY_CASTS**

> > +   Cast should not be done to any alloc functions.
> > +   Appropriate type of pointer is pick by compiler at run time

+   Appropriate type of pointer is pick by compiler at runtime

> s/run time/runtime
>
> > +   Cast may hide bugs, as compiler suppresses the warning after cast.


+   If a pointer is cast (wrongly), bugs like memory corruption,
segmentation faults can occur.
+   Also, It can affect functionality of the program.


>
> The question which arises here is what kind of bug is suppressed.
> Maybe follow http://c-faq.com/malloc/mallocnocast.html as checkpatch
> says to write up a paragraph on why it is bad.
>
> > +
> > +   See:
> > +   1] https://lore.kernel.org/lkml/20070808024321.GA6316@redhat.com/
> > +   2] https://lore.kernel.org/lkml/a5e60a2b93e10baf84af063f6c8e56402273105d.camel@perches.com/
>
> These links are just patches that introduced the test. There is not much
> information about "why" they were introduced.

Should I remove it?
And I didnt found any discussion on LKML regarding  UNNECESSARY_CASTS issue,
other than this patches.

>
> Other than that change the enumeration type to be
> uniform with the rest of the documentation maybe?
> The thing followed till now is:
>
> See:
>   1. link_1
>   2. link_2

+   See:
+   1. https://lore.kernel.org/lkml/20070808024321.GA6316@redhat.com/
+   2. https://lore.kernel.org/lkml/a5e60a2b93e10baf84af063f6c8e56402273105d.camel@perches.com/

>
> Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
