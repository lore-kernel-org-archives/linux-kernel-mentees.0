Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13549C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:21:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AD4A20870
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 18:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uX0hz1qc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AD4A20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1CC2878BD;
	Tue,  1 Dec 2020 18:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdyAjFfesbz2; Tue,  1 Dec 2020 18:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 297B487847;
	Tue,  1 Dec 2020 18:21:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03937C1833;
	Tue,  1 Dec 2020 18:21:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6520FC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4BF5286B1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lTjqt4Xi9ly
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:21:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EC95586B0E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 18:21:50 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id t8so2606085iov.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ouobtBm8sSQb0vz2vqGGkrgo2OjHAJ9nHVRL58pUGE=;
 b=uX0hz1qc271RdjaSAXcDDyqtvFg0GUk//wxyUkAsoxen3KpmlHi3IEYgsenDvk5C80
 v4/0ljBXXPLRJnotPXKT9MRhl3nAX1NTudLW4h5x91eDfsC3vHaL9P2xj+hoMD5OoIxD
 vOu22nw2eghmX+PK/io3Z3qq8xU2jQ6DrZWJbWXIJVfPigqXzYlq02nNIfaigGWmzlan
 bYKfGEjAplaTTjwl10RX/HUvN/N3A+ItWennAFnc3Hy2TWtSKqLj/2BNXYqlPQDcnPi9
 k/C3gOOSfhkXezcbjhASXWGhQuyTSdGrQ6fNxVM5EbaDxXVnN0EVe/OdvS5QjxCsSGKR
 1dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ouobtBm8sSQb0vz2vqGGkrgo2OjHAJ9nHVRL58pUGE=;
 b=UrQ3fPOvyKDVtZ7aEJsQvJXPRIBHOn2r7XJMeBJ5pAx0qeFJ9g00SD+9qtqbcLr66b
 Uw+LThNzKaSetcIsP3Ci42CEJ+4ZmZTCLwEBcjOKFlZoRwA/RD66hTQHFhmgKTXz7LUB
 zxduteMKMB+r0X5Ofvvwl3Hx1UDDwyMcC3K2RmhEDtr5H2tcbByO047PKK7PpPYRhILw
 u6TNMhgPBVcuuMZcdFLUqhFCU2Eb4F6zxl9A6LpvQ0mntZ0Qn4zTxMxiMEXOYNJfoCwB
 ASBRJ60PR/5RwlUZI9Xub9wae4rKCjdCL2nvveJohUSnB4Tp2Yw6n0ZfZSRUj3gqClKS
 5zmg==
X-Gm-Message-State: AOAM532waZGBHgqCRA5fsXZcRBy3KQ6wf6VdecactqnzT0qm8YhNE9yK
 oWKK40rtNEnoKJ25nNvCqUuVzJUuCGRzBIpBwmY=
X-Google-Smtp-Source: ABdhPJwtX+nHYBolzK2l0oZRuVJ03EZTJvWOEnie/fZJWiF3VTwTR48gquIufwsVkdo+3j96NU3nHOCXX1vVhZTCD+g=
X-Received: by 2002:a6b:c047:: with SMTP id q68mr3418312iof.189.1606846910267; 
 Tue, 01 Dec 2020 10:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20201201112931.11192-1-yashsri421@gmail.com>
 <f4392362e682ce7a02eee8a2036e1035342a0b4f.camel@perches.com>
In-Reply-To: <f4392362e682ce7a02eee8a2036e1035342a0b4f.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 1 Dec 2020 19:21:39 +0100
Message-ID: <CAKXUXMx8RURmeyzp5Ak7_409oaVJo622ndpC5VceN-C_f-HPdg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and
 improve warning msg for Non-standard signature
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

On Tue, Dec 1, 2020 at 6:24 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-12-01 at 16:59 +0530, Aditya Srivastava wrote:
> > Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
> > styles.
> >
> > This warning occurs because of incorrect use of signature tags,
> > e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
> > signature tags, which may seem correct, but are not standard:
>
> I'm not a fan of this patch.
>
> There is already a "non-standard" signature warning for
> all of these cases since 2012, predating the range of this
> retrospective evaluation by over 5 years and yet these
> existing commits have been accepted.
>
> The value in actual standardization and effectively
> requiring specific signature style tags is quite low.
>
> Anyone that signed a thing a particular way should be free
> to sign the thing as they choose.
>
> Most of these warnings would also still be in the tree in
> the future in new patches as running checkpatch without
> it emitting a message of any type isn't a requirement nor
> should checkpatch use actually be required workflow.
>

Can we scale this fixing feature down to the very obvious synonyms
that simply do not add anything but confusion?

Such as for those four here:

Co-authored-by (count: 43) => Co-developed-by
Reviewed-off-by (count: 5) => Reviewed-by
Proposed-by (count: 5) => Suggested-by
Suggestions-by (count: 3) => Suggested-by

Then, we can probably also drop the rationale because it is pretty clear.

Of course, the impact might be really zero, given that it is unclear
if those authors did actually ever run checkpatch in the first place.

Joe, if you see no value in even such a minimal fix feature, let us
drop that idea and move on. There are enough other things to work on.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
