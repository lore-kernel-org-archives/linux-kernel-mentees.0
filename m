Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DD2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 10:55:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63F1164E07
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 10:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63F1164E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E780F4ED2C;
	Thu, 18 Mar 2021 10:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Be6R2UrcK27V; Thu, 18 Mar 2021 10:55:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5DA04ECC6;
	Thu, 18 Mar 2021 10:55:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DBECC000B;
	Thu, 18 Mar 2021 10:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8052AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65BE54ED1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9v2tmsTdMCpw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B9564ECC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:55:16 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id m6so4425768ilh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=98pxet5C8Gy9S6SIgsmctncU1QY7hRiKp+O67nhGkow=;
 b=uMqQlC9MavXYkB3kXbenRs4kfB7G4L7LXt93bxBJ0oImb0yLDPiOGn158iYYIi6wJe
 qBFhMWmNwYpdNImlAhLHUa5n+0rscYmzi+2G2SyHssG3jeoVZ58Ax+eiLGNP7ej1zc/9
 qzBi1DgfSEr1v79waqfnsgbyEKhfKmKB0M0zs2RZdvB4p7K7f+ikYi5Rs2ml+sN7k6oJ
 RvyEzHLbEsjo/09tTwv9j2+Pw4LQL6OFI+t62UEJurVc3+x4iJdqA8TzJPMrw4oZYY23
 jRmso1NujbFnyaWHBGNcV+ihb13EUs43KG9gakaiCWbhmvuzsIpLbUqIJRsOUlEJah39
 fxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=98pxet5C8Gy9S6SIgsmctncU1QY7hRiKp+O67nhGkow=;
 b=HGXLUC+5idm7+gRXmRNB/0aANt1YcgAKbO8NnaB+I7iNk5bORoPFnhYbURAhZexEIY
 CrIH3hAazNUqzRTcoJoua8/ibxnGSUFUUrVXBpolyyeNFqXV3TAjgk365EZJsq6TlsSL
 nx57lQMVRC7CmqvOG08gUoNiEi+AskdLRewdZpXFA3YRpnShCfJNccm/KOMkJu+vtqOI
 BcOusJzmvi+JaxAoXmE85rMh4Ydiep+sLusn9ncxhG9fFL+a3cALWjUrzxIHaU4Aq2qI
 EklRc4ElIK/SCh/TedEI5JSCFsphkIgQjisO0q2IRrXm84oWDlwk61IhmadvjKt5ZKCd
 u6xg==
X-Gm-Message-State: AOAM533AYdIca1l5Sw/W9GizT2FRa7s7AxClo/xcI4ndzqK2DpZQxXpp
 1nE0HCv7xBPmkyCfJcb3UK4GgFFENUK9qIj6Mro=
X-Google-Smtp-Source: ABdhPJwCUz3YalePN71JfUxCQ+3ETyztCla/KstVAsnn2Y02f0u5BDOaY4GLiv8BmqjbQ9EaZMXtwwG4iM6kbJYnyyg=
X-Received: by 2002:a05:6e02:1aaa:: with SMTP id
 l10mr10477638ilv.251.1616064916024; 
 Thu, 18 Mar 2021 03:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com> <871rcg2p8g.fsf@meer.lwn.net>
In-Reply-To: <871rcg2p8g.fsf@meer.lwn.net>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 18 Mar 2021 11:55:05 +0100
Message-ID: <CAKXUXMzwTp1H_vokVEAJSnmm7jNHfWzhhmLfpcrrBD9b8ak+dA@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Jonathan Corbet <corbet@lwn.net>
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya <yashsri421@gmail.com>
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

On Mon, Mar 15, 2021 at 8:25 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Aditya <yashsri421@gmail.com> writes:
>
> >> The opening comment mark /** is used for kernel-doc comments [1]
> >>
> >> [1]
> >> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments
> >>
> >
> > Hi Markus!
> > That's true. But the content inside the comment does not follow
> > kernel-doc format.
> > For e.g., try running kernel-doc -none/man/rst on the above file in
> > the example("sound/pci/ctxfi/ctresource.c").
> > The starting 2-3 lines in files generally do not contain any
> > struct/enum/function, etc. declaration.
>
> The problem is that it's marked as a kerneldoc comment without actually
> being one; it looks like somebody's internal corporate formatting.  The
> fix is not to put a hack into kernel-doc - we have more than enough of
> those in the file already!  The right thing to do is to remove the extra
> "*" so that the comment doesn't look like a kerneldoc comment anymore.
>

Jonathan, I agree that that is the right thing to do. Aditya is
already following through and is cleaning up the repository. So, let
us be optimistic that we will have cleaned up all of those occurrences
within a few weeks. But how to continue? Someone is going to come with
new files and introduce this pattern again in the repository; and as
of now, we do not have a script to identify that pattern and react...

Running kernel-doc on the whole tree continuously and just observing
the new warnings is probably not going to work as of now: there are
20,000 kernel-doc warnings and at least, I cannot see a really good
way to filter out this one specific type of issue among all the
warnings that will might appear in the future (without specifically
applying Aditya's patch and looking at the diff before and after).

I wonder if we could extend kernel-doc (not your preferred option as
it seems) for a new dedicated warning message or maintain a separate
kernel-doc sanity checking script to emit a dedicated warning based on
some heuristics that suggests when a "header comment" is probably
unintentionally declared as a "kernel-doc comment" when it really
should not be.

Jonathan, would you then prefer to have a separate kernel-doc sanity
checking script that then allows us to maintain checking for patterns
we already cleaned up?

Eventually, we might have cleaned up enough to just use kernel-doc and
keep it kind of warning-free (as with make htmldocs now) and then, we
can simply follow up with kernel-doc and some basic monitoring
scripts, but with 20,000 warnings in the whole repository to start
with, it is still a long way to that point, IMHO.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
