Return-Path: <SRS0=jYeA=JZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09513C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 05:42:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896836141E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Apr 2021 05:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896836141E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BACA60908;
	Wed, 28 Apr 2021 05:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SViWS9_M0lVS; Wed, 28 Apr 2021 05:42:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E66C60BB3;
	Wed, 28 Apr 2021 05:42:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2921CC0022;
	Wed, 28 Apr 2021 05:42:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2ADDC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 05:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D3E40E6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 05:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vr6EpXdkdyig
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 05:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3A86406B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Apr 2021 05:42:53 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id v23so10437835qkj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hDpUHNVlApc3M1gUd0n7KzIr3losrUHtyKPIA5d1mxo=;
 b=TvVBvO50395v8tIoLy/TdDIdnnkRE4a7TAu9l5pFkApyFKRh/BOYSHs6OO1UhBzrAn
 esbv5AlTYswyFXYLZMTQ0oPf94D0SqzNvMzjlPOzZCRLgjBRrinmb20diG+V5VPpIp1q
 4SyB3TI71ZE0A297KOOFMT4dU10u5Us04x5lCBsw6h9GqRzfCZplKk/4q7A3nqfGdy03
 M/lv5nCuty/rQzgqCMX9rdr3d0LmV/1teW1sVfCLGA2FBNsQpfGeimpsHe5J5lnmAHN/
 32EG+mrk58yd85qvk0gfzkW1qo1ujI+4NUUVHkiWEWfniXmmvjLbILGfEpq7i8lMsaNp
 xsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDpUHNVlApc3M1gUd0n7KzIr3losrUHtyKPIA5d1mxo=;
 b=fq5E5McNvotEFDpEzKO0uF7qIQti9eCD+SyNFRpvUKDfyTCZ/7EevOFaljveiIXDVZ
 6HA9yMlYFTfewFYG9JEJjChA6BxPEJsFju18fVXTDtCitT7Zac7JsXclfudK30jxZ6OX
 upRzVSt723dTW6AdJQeptrMHOhMDUTm/L8zxpdaD4t+ZpXouzDlnDgL/n6UpyOneq7P9
 I+J+uPeM7DYeZK9hgKMuY0vKJPwULpOT/4SATC/s/N3Xho0gzb41HiNOtgJuaAPlYJrR
 pTVT/Lh3eJbyD1UPNzyBXeOjqgHpY9coIaWHJMxXbdSxPZP96d4T9ZtfQTOf38HePdhT
 ASKg==
X-Gm-Message-State: AOAM530VqQKpR3qw9wUV01tQ4KwtEAoeiL5qSshXLNDcXtiNae17iDjJ
 6Tf7GbP3NDgUX18mXfHyTXOeN2DjtDABv6dw4zUroQ==
X-Google-Smtp-Source: ABdhPJxDayuh19fA98SPic8G/wSJ2VP2vj/37uFUHCRDysWDJohr44nN1QemsaVd3GsE+JO1hrz5u+A/PeQFoq2UsCM=
X-Received: by 2002:a37:4042:: with SMTP id n63mr26241646qka.501.1619588572286; 
 Tue, 27 Apr 2021 22:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <e486aee7-993c-e50f-f14f-aac7f701b752@gmail.com>
In-Reply-To: <e486aee7-993c-e50f-f14f-aac7f701b752@gmail.com>
Date: Wed, 28 Apr 2021 07:42:40 +0200
Message-ID: <CACT4Y+aw5TifZuhA_T4728iA-=LPa9Tqm6akWa6v_RGpvPjJKQ@mail.gmail.com>
Subject: Re: Starting a Wiki for Syzkaller Bug Fixing Resources
To: Esme Xuan Lim <esmethedev@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Apr 27, 2021 at 10:50 PM Esme Xuan Lim <esmethedev@gmail.com> wrote:
>
> Hi there,
>
> Having been on the bug fixing mentorship, I've been collating a bunch of
> resources that helped me as I was going. I've been thinking that there
> might be a big gap in resources in where interns might be looking and
> was keen on trying to put one together. Given the current conversation
> Greg has brought up about syzkaller bugs needing more attention, I
> figured this could help fix it if interns are the only ones available
> for this task.
>
> I think it'd help the kernel mentees current and future sink their teeth
> quicker into fixing bugs, and less into helping themselves learn what is
> needed. This appears to be a big gap that would really help if it were
> filled. Resources are heavily abundant for the Linux kernel, but a good
> level of curation and maintained resources could help with bug fixing.
> Resources look old, but are incredibly insightful. I would have skipped
> looking at these resources given my experience with more modern
> frameworks and toolkits (which is that it would be best to avoid
> outdated ones as APIs change very quickly - but this is not the case
> with the kernel)
>
> I've got links and things but I've been wondering if it made sense to
> build on the Kernel Mentees or to build a wiki (and host it) on
> something more modern like github.
>
> I'd love to hear suggestions for how best to go about this, and if
> anyone would like to contribute to it too.

Hi Esme,

I totally agree.

FWIW I am ready to host it at:
https://github.com/google/syzkaller/tree/master/docs/linux
I guess it won't be that much syzkaller-specific, so I don't know how
much you want to host it in the syzkaller repo.
Otherwise it would be useful to at least announce on the syzkaller@
mailing list and/or add a link somewhere in the docs.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
