Return-Path: <SRS0=x+JC=FH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A80C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 11:00:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B773208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Dec 2020 11:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B773208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D02E82044E;
	Thu,  3 Dec 2020 11:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BafEu21Oa19C; Thu,  3 Dec 2020 11:00:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 47B8D200ED;
	Thu,  3 Dec 2020 11:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 241B1C0FA8;
	Thu,  3 Dec 2020 11:00:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD943C0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 11:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D213A87AD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 11:00:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5kz07RWzZHTT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 11:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1EEF3878AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Dec 2020 11:00:06 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id x15so1512246ilq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 03 Dec 2020 03:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCBJlUWH+dW7aWaKcrrL+ZaUSjhi3vUF7NMntXueVo8=;
 b=r8Sr9p4jQrUiKkGT1lccCyvzLSPvC/tFZoa3kvBITuDo0aNqqwYyEBr4ZX57brV2TI
 8ggs1nRgefvljtaew03Sgh2Edd5GsXUTZL6yebMypz2YncmNkHUvmN7BEXv0kild4ABX
 Wycb4OF1hTuFuNb5GiD8GAP9dx+NYaUX/1UvgGS7wQqugmc2WHnWflsuTY0rKenU1NNU
 LZ83vNj0dbj4kWWF3kPxv45BsR0eiiblOrp3MHuldTW2iarz6/oNlXqR/Z++sNK+ckk6
 yDUySjZc0bx725eOCu+b0TNXkvl7hukrIHn3zE304gfAPa89JlCZuPBp0HIdLJE0mAGp
 IIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCBJlUWH+dW7aWaKcrrL+ZaUSjhi3vUF7NMntXueVo8=;
 b=VYanxJ8R5Be16UN1/HDDUVVb2DV1ZItLvnq3qucC2SWfX/Z6lLpUC4IhhIzUJYdfOG
 AU4IzpDC8MelMQP1BBYZzUSDlWKDYoRvwc9m23a5kd7vb9SlsAEdMd8VI3bdJCYAWIus
 ixcQ1hSt7Sc3PTnqo68W1+QjSlTQUH8kGwjNPNKbFVjKTuFV2bB5Odu3wq2zWMCLepN2
 u5hYbEXPaEc72t4mIurDKWcqGqehbDDwYBoC991Fl6jswRebk5a5Y5bNHaOmSxeP8reW
 Qz/NMN6kh4XY+OCLYLJKCc4tL5WMNJdLyO66UDnuJ0z6P63b57mF78/iDI+FgAyNFs8J
 t45w==
X-Gm-Message-State: AOAM533ehEIIzrbV8+e4bqnHtTG/o2okx7PxOOOcRKwsbCW7x3I+yKPw
 4KkuCHGvRKIVjvchwTs7THNM+WWd0+kRaDX8YrQ=
X-Google-Smtp-Source: ABdhPJwf0+pHYWwFyNweDxYeQYaI7uM/O1LxJXxJ1BGQmbhiDeF70u0g5K94a7ixSkKBIAzsSQcrRGg8eALz5YE9I+0=
X-Received: by 2002:a92:8587:: with SMTP id f129mr2473789ilh.251.1606993205259; 
 Thu, 03 Dec 2020 03:00:05 -0800 (PST)
MIME-Version: 1.0
References: <280235acc0e91365f3fd3b5be5a5244eced1ff61.camel@perches.com>
 <20201202183045.9309-1-yashsri421@gmail.com>
 <5afbcd1423ee8fc2dfad191d94aef6efc17198c8.camel@perches.com>
 <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
In-Reply-To: <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 3 Dec 2020 11:59:54 +0100
Message-ID: <CAKXUXMxPMdGmnOWdYnS0VQXaAH9dTe7uNfUUPp-GLy2xTXuABw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH -mmots] checkpatch: add fix for
	non-standard signature - co-authored-by
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

On Thu, Dec 3, 2020 at 10:59 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 3/12/20 12:26 am, Joe Perches wrote:
> > On Thu, 2020-12-03 at 00:00 +0530, Aditya Srivastava wrote:
> >> Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
> >> non-standard signatures.
> >>
> >> An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
> >> non-standard signatures, 43 are due to the use of 'Co-authored-by'
> >> tag, which may seem correct, but is not standard.
> >>
> >> The standard signature equivalent for 'Co-authored-by' is
> >> 'Co-developed-by'.
> >
> > I'm not going to ack this as I don't mind non-standard signatures.
> >
>
> What do you suggest?
> Should I drop this patch and move on?
>

Joe does not ack this, but he also does not nack it.

You either move on (which is perfectly fine), or

you either wait that Andrew Morton reviews it and accepts it because
he thinks it useful, or

you reach out to the git committers that have been using
Co-authored-by in the past and ask them if this kind of feature would
have been helpful for them and you get an ack from them that convinces
Andrew Morton to pick this.

I hope this helps. If nobody thinks it is a useful feature, move on to
work others acknowledge as useful. We have enough stuff to work on.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
