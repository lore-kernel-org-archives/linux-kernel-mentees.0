Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5A1C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 09:00:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B7622525
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 09:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49B7622525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BAFA985D45;
	Tue,  5 Jan 2021 09:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QslO5DQQuoIk; Tue,  5 Jan 2021 09:00:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79A1685D6C;
	Tue,  5 Jan 2021 09:00:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C10AC088B;
	Tue,  5 Jan 2021 09:00:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E648CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D40E485722
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T0pkniiQV4cT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:00:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 46290847C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:00:01 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id l11so70944331lfg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 01:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dxfXiWmXKjcXG7MiAZTrs2FCKGpxYiIgWMEbJGIs1oU=;
 b=bkywPztvzYitrJ+9cLUSF5xNfyzCrl3laky8babFYbiP9F302vAG2D4vJKb8Bu+ATk
 gw6O3vh2xmZDi1tttnT9qlzaIMRNlK99yS0y3Zgd9eM9YDx4htSuHYeFHOFTtxR915BU
 V1IqJ39uzNdPKE+7lWDtGZ1iGnoPXMt8u8MG970iuB71aSjr6WoF1ms5RifpA7714SrT
 Y/ARlYkS0+IRLxG4j1NvKGMzGLa08pEjBeA90fMJ9szWSOR4LussPSo7H1D2cZNlgx/E
 0aL/f8zmdD1dXNnaHcJkMeFREne/qB0K23FxKfzUx7by7WPpg/Tio/Kuv2bsZG9I/Y3c
 cQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dxfXiWmXKjcXG7MiAZTrs2FCKGpxYiIgWMEbJGIs1oU=;
 b=Zn5j8jJjRgzDIS9rQAV0/MHBqo8PMZHYhY6H/TIf2msKhrNFZLIpKOr3E28Ykc9Toy
 kTb9eU2PNEzdOU8pgQqmURwaDnbOA49vsufOjQjQM5DykBevL2N8gZy96TvHgUOORf/C
 EDj9ftSjzk2ciFLH5Ybkt2BCxo0jQKISTdF4BLEs0lx7HnpFXGq4d3mhvPbcK1zIWnxt
 4zZnbWhh6+7CfP4Q57OV3HkfaLtK/GTH6lNR4ULfz0/GigbvJVIFO5mYu3qVCGEfOyhx
 J2Y8Wjv+bKqtyqL0oN81csOh+G8nBFwo6LMy8DOPhUrlky3h/2zWfLvwDKqFEnIhILNy
 Zrcw==
X-Gm-Message-State: AOAM5326GDsEy5X4/fdxwUuDiFHmr/oGmE462n7vTN0LkFYTrFNYPPKd
 8UzvfY1uFlhvf/YFHVhCPLZJvAdcNuVFVXEFASk=
X-Google-Smtp-Source: ABdhPJzQxOLGksuAu1JGN5vDpr0EChMuotkNvYE/OJIEEJCLnVrn9F31pKW5KwltZMWoPZfDXWljJYSsh88h4gErtgg=
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr32214831lfp.117.1609837199235; 
 Tue, 05 Jan 2021 00:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20210105082303.15310-1-dwaipayanray1@gmail.com>
 <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
In-Reply-To: <50cc861121b62b3c1518222f24f679c3f72b868d.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 5 Jan 2021 14:29:46 +0530
Message-ID: <CABJPP5DQ0Y42z9ej_j06+KaQevT3ztWcwGMkismj4qv5EHvnxA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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

On Tue, Jan 5, 2021 at 2:14 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2021-01-05 at 13:53 +0530, Dwaipayan Ray wrote:
> > strcpy() performs no bounds checking on the destination buffer.
> > This could result in linear overflows beyond the end of the buffer.
> >
> > strlcpy() reads the entire source buffer first. This read
> > may exceed the destination size limit. This can be both inefficient
> > and lead to linear read overflows.
> >
> > The safe replacement to both of these is to use strscpy() instead.
> > Add a new checkpatch warning which alerts the user on finding usage of
> > strcpy() or strlcpy().
>
> I do not believe that strscpy is preferred over strcpy.
>
> When the size of the output buffer is known to be larger
> than the input, strcpy is faster.
>
> There are about 2k uses of strcpy.
> Is there a use where strcpy use actually matters?
> I don't know offhand...
>
> But I believe compilers do not optimize away the uses of strscpy
> to a simple memcpy like they do for strcpy with a const from
>
>         strcpy(foo, "bar");
>

Yes the optimization here definitely helps. So in case the programmer
knows that the destination buffer is always larger, then strcpy() should be
preferred? I think the documentation might have been too strict about
strcpy() uses here:

Documentation/process/deprecated.rst:
"strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading to
all kinds of misbehaviors. While `CONFIG_FORTIFY_SOURCE=y` and various
compiler flags help reduce the risk of using this function, there is
no good reason to add new uses of this function. The safe replacement
is strscpy(),..."


> And lastly there is a existing strlcpy test in checkpatch.
>
> commit 5dbdb2d87c29 ("checkpatch: prefer strscpy to strlcpy")
>
I will drop this patch. Thanks for your view.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
