Return-Path: <SRS0=IG3V=II=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B73CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Mar 2021 06:19:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B0164FE8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 Mar 2021 06:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B0164FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4032A6F6A2;
	Wed, 10 Mar 2021 06:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elMQ4eAx4Urg; Wed, 10 Mar 2021 06:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 574A16F521;
	Wed, 10 Mar 2021 06:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31D65C000A;
	Wed, 10 Mar 2021 06:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3651CC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Mar 2021 06:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 086604EC33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Mar 2021 06:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbAPPS3FILgS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Mar 2021 06:19:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 058EE4EC31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 Mar 2021 06:19:44 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id i18so14471773ilq.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 09 Mar 2021 22:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5p/SXRe4HjTxgctJ5m48amd8gNDg6K092/5QjLT6b4c=;
 b=afTJ02CA0fyqSMV6hiFeYZ2votdnUzaUNActc9myS2kr7PuOKFpuyRsgQ2nGtNApqs
 L9Ml/Z7a0Q3KLYL7B5L7XzSDdEamBMaleMUOsUiWEj6kVzw8F8v4qV+DbL88tX/0dkKJ
 2YfjTMGrLcDWKJVhfUvmUd/YdbhcOaD5exougRrwepHaQVM/in1TDfEsNpvlm3zA/Yq9
 9SkrNVAUUQP++4zcG6YTmIh1r1r3iX3e1hjwWlME7L1fjUe0hCMQAA9RzGkm52PA4ZiS
 rin/UKxeK6XREnLXUjKiIptzYOtubAX3JHgLcZ/esMNcOi12MOz9PQ3ERZt3pkfy1lvO
 s9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5p/SXRe4HjTxgctJ5m48amd8gNDg6K092/5QjLT6b4c=;
 b=MN1CE7lBPlDh/y9FSjM98fkfa/aUFxEGDbruticC8mDQ0j+Ot4O+nEt65g7k3jGJII
 3w6kcZxeEWeLmBGgIeWUZR3tHjPklDMIZF4//AWTRnhZBV3RRSBoJ0vusIdym/kGkCpT
 mFfxhP4FK/03HsJyBgE2peec1z7uETbWyXUQRfBZGSDdSGBCZyHlUe2wKkbEOKlAKd8R
 hLUvgbz3GIcLPbs++egiDLjXnuZ+Gce1w4ydfFoP34KpyspFWzssn7Puq9DPUMJWXMw+
 Ypu+/jc8aO9pBd34cL5oOWOI9lvGdoL2dBdUt4HiFYrJcQdciX9NI7qvnGklXgIZ7znc
 WPEQ==
X-Gm-Message-State: AOAM532A/n6w+qsC28etXuNz8kIh4jQ8cd8Mh8Vaf8fULS5RwulsPkLE
 pMIJMq8r1FC1EyQA+FLZvNJ5/kSVR+dIR/fLKN0=
X-Google-Smtp-Source: ABdhPJzekvuj7UiN+GP4cNsd4Jrk+KGKWCCq+ycOpS7ANtQi+AXKXRa3yuozVnszTI1wJnoZnnq+TdtB8Bbljlj7CH4=
X-Received: by 2002:a05:6e02:1aaa:: with SMTP id
 l10mr343415ilv.251.1615357184067; 
 Tue, 09 Mar 2021 22:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
In-Reply-To: <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 10 Mar 2021 07:19:41 +0100
Message-ID: <CAKXUXMwg7Vs5hm_X3ZHJj9309w5VYbnNeqXaajHBHS1oAKQydw@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Aditya <yashsri421@gmail.com>
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On Tue, Mar 9, 2021 at 10:24 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/3/21 7:00 pm, Markus Heiser wrote:
> >
> > Am 09.03.21 um 13:53 schrieb Aditya Srivastava:
> >> Starting commented lines in a file mostly contains comments describing
> >> license, copyright or general information about the file.
> >>
> >> E.g., in sound/pci/ctxfi/ctresource.c, initial comment lines describe
> >> its copyright and other related file informations.
> >
> > The opening comment mark /** is used for kernel-doc comments [1]
> >
> > [1]
> > https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#how-to-format-kernel-doc-comments
> >
>
> Hi Markus!
> That's true. But the content inside the comment does not follow
> kernel-doc format.
> For e.g., try running kernel-doc -none/man/rst on the above file in
> the example("sound/pci/ctxfi/ctresource.c").
> The starting 2-3 lines in files generally do not contain any
> struct/enum/function, etc. declaration.
>

Aditya, can you provide a diff of the warnings over the whole kernel tree?

At the moment, your patch just implements ignoring the initial
comment, which probably is good for experimentation.

Alternatively, we could simply have a dedicated warning and then
ignore it or even warn and then parse it as-if.

In the "long run", we would probably want to fix all current files in
the repository by just replacing '/**' by '/*' and have kernel-doc
warn about this suspicious pattern, when new files appear (maybe even
configurable, but that is another feature to enable or disable certain
kernel-doc checks and warnings). I would certainly assist and
contribute to such a clean-up task.

I think the first step is to look at the diff, and see how many cases
really appear in the tree... then check how many patches throughout
the whole tree are required and if they are generally accepted.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
