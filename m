Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7840C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 13:36:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0528020870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 13:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/KEMNxt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0528020870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 787BD85E40;
	Tue,  3 Nov 2020 13:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AfiFHjekZgSM; Tue,  3 Nov 2020 13:36:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C07685DDB;
	Tue,  3 Nov 2020 13:36:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66AE2C088B;
	Tue,  3 Nov 2020 13:36:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6D49C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C2E5E86C3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3caP1qzBsegE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:36:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2068586C23
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 13:36:41 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id n12so6783609ioc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gY1u6ZkeKxW3rEhgQHoCRPePepvGwjLIGlkb4AU8gxo=;
 b=N/KEMNxt1YPiTf2Wirl5gz7YXDn9NIOlABEcUtLudtjfYEcZlZj7YJKs/FU8Ss9DXk
 VjrNV5VFjashK10zOUK9H00p2AB9xaZSxxn9IZ4BvDry4+sfmpyjr8gb8+E8mY2ymtYy
 WEQtCulwnuZJU+r7L8u9ESiIuLej50N/riYI7qo82Sr5YT+K6m9jXpANNk0n/pGehpq1
 qfBz+0O+z2OmJJbpcmj+VBjnLn7JRQiLTdLxDD1hQc3Duhp2UaUGNyKzbxRIMZYklBLD
 Sz8hF9EL2ONsi059+dY6W28LqVx1//RVdJEtn5o9MYPzN4P8GFQdaMYjPrhb45Jmmk68
 Y2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gY1u6ZkeKxW3rEhgQHoCRPePepvGwjLIGlkb4AU8gxo=;
 b=SzgqSCKIBwzAXOHzl/Jyi4uJgPJTX2m3KqZJ2Ub/FcyoxJSjxJ2608ckoyH1YAGYL1
 GLJoH8slBe724zqZoalNqnfksy7F+KXt91yVCGdS9r5KvcbG0m7+Q4pNB0YicowdNIRY
 l4s9aKImXljOB5UFy1PH4t24arWllsfZZ9KvKJfVgLrmEmfXsQd337EBsKwA7blZGJqa
 iFmOwS+joR+7p33y2lRk7ZreFYWkQDPWFR8fWXcYs+moZRfPSpr42Ry9wae0t5BohkdZ
 jwBDz+0GIMxGhAz39MKkQGzXCptWn/MU6O7J84wU97gY1JwqpQ4iud7sQuh+07WS+xx5
 TGAQ==
X-Gm-Message-State: AOAM5324kDZJVBeg4p4WFleku40tUgFwSr/bWOXmH7ZtZlkMM+rblZev
 iqPIUlI7ZfRIJ+3F5E74TxzTdFsskNhUOdV8B9w=
X-Google-Smtp-Source: ABdhPJyMNax0IOPqXNtoudB6BM+6ozYrekHii+LNGl2FuUHUL0qZ30eC0Viq6ZVvGGm5EsdkWL2KUxoUxDHINJDmIlE=
X-Received: by 2002:a5e:9743:: with SMTP id h3mr13850833ioq.158.1604410600333; 
 Tue, 03 Nov 2020 05:36:40 -0800 (PST)
MIME-Version: 1.0
References: <4b8da06a-5162-28da-d4d8-91feaa172231@gmail.com>
In-Reply-To: <4b8da06a-5162-28da-d4d8-91feaa172231@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Nov 2020 14:36:25 +0100
Message-ID: <CAKXUXMy0LD3w5in+wUiG4ELPJb44=Uw9Eqv1=WcrK6KiGWjFvw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch: add fixes for BAD_SIGN_OFF
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

On Tue, Nov 3, 2020 at 1:11 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 3/11/20 4:11 pm, Lukas Bulwahn wrote:
>
> >> 1) WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to
> >> attribute nominal patch author '"Zhang, Jun" <jun.zhang@intel.com>'
> >>
> >
> > I think the fix here might be to drop the Co-developed-by: line,
> > right?
> > Can you confirm this fix on your evaluation?
> >
>
> Yes, we will drop the Co-developed-by line for the author. As he has
> already signed off for the patch, co-developed doesn't make sense.
>
> >> 2) WARNING:BAD_SIGN_OFF: email address '"Matthew Wilcox (Oracle)"
> >> <willy@infradead.org>' might be better as 'Matthew Wilcox (Oracle)
> >> <willy@infradead.org>'
> >>
> >
> > I think Dwaipayan and Joe are discussing the proper handling of
> > quotes. I suggest to understand the resolution that Dwaipayan and
> > Joe
> > are working out before thinking about a fix for this option. They
> > might decide that only a few specific cases should be warned about
> > or not at all in case of quote mismatches.
> >
>
> Alright, I'll omit this one for now.
>
> >> 3) WARNING:BAD_SIGN_OFF: Duplicate signature
> >> etc.
> >>
> >
> > I do not see the fix option for this case 3; the duplicate signatures
> > are mostly due to the integration Signed-off-by trail.
> >
>
> Sir, mostly the duplicate signatures are occurring when the user signs
> off 2 or more times for the same role. For eg,
>
> For the commit 6dd47d9754ff ("mac80211: fix
> ieee80211_txq_setup_flows() failure path"), we get
>
> WARNING:BAD_SIGN_OFF: Duplicate signature
> #16:
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>
> as the user has used 'Signed-off-by' line 2 times. The fix for this
> can be to remove the repeated line, similar to co-developed-by one
> we're doing for the (1) case.
>

Bad example here as in many others probably as well. Johannes signed
off in two different roles, once as author and once as maintainer
(integrating it into the kernel tree).

It is NOT recommended to simply delete the second sign-off.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
