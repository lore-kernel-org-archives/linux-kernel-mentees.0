Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDA7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:06:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50AE207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:06:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="n3gXik2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50AE207FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 64E4D22640;
	Wed, 19 Aug 2020 21:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULVFLbpisl35; Wed, 19 Aug 2020 21:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2528522610;
	Wed, 19 Aug 2020 21:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18E93C0889;
	Wed, 19 Aug 2020 21:06:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4748AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 36CCE86205
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHvwZgoKpTRu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00D6286204
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:06:50 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id f5so11418097plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1fpazQzH5RzZYR8qQqnmyk9zH8WRFTB4V0IGSi9KdM=;
 b=n3gXik2Qgwut2dnhopHSM0ZTpUHIi6gVTF4XJRmDIngPNixlUNtHw0BoOxGRErlh+A
 NEUpm5nS07FYpoIukKItm8njOq+7W7HIDGDyeNyMu9V6y77m0BVMDgF60gWCiJ/yhILr
 rNBZhONTRkFZP0avtwKAX2L2fx7u95liCYCVGJy1fUyFFO6kG470mjAaO9JnjSrhlg4E
 LOqr5LEaNL9zO47CAFdHNfn0m79qaXwsCP0VcKQpsHDPRQN34/mBhVJpm+X+wCPQM7fE
 H/4G3VkM0prcDUokq+cvOa2llDTOpuWhWTPHey8eqP0ZulPhWDigdy6rWy4IJigjzjUo
 OeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1fpazQzH5RzZYR8qQqnmyk9zH8WRFTB4V0IGSi9KdM=;
 b=pzvDw+BjFScHUQEbr2jq48AxRv9BuJmLPiMjkdCsn8bWLHZwwH6KtJG6CPRPVOQl5K
 6plfgftvawPhy6uwdHQBJAheZ2mqafA4k9kXFKaUwBDtUx2UuLLGeDbB2Z8ZATyqj0Kh
 359xXvQln9aWshTrdmook0h2sGnO/7Evrx/s5iotoSQ/oC/Joku/ocC8fYce7H3LG1dt
 Fd+UD3wgi8ZK6RT1wPhNsq1ch03JNRm+ZG5l04xm9D+zfj2dGFqErw6PyypjjG8tiFId
 noXramELyV0FeverQxr1HbDz8Dr7UgMm0WkDPtCkEZpCXqNNM5Rlqw+cAwikYltLpvSO
 VHug==
X-Gm-Message-State: AOAM5319HwG9FqBrzgjJqOzx8C1GMDTGVhOdR4mUHWQxK7pexIKndQma
 FzoMlu7ilpw0uYuqvj7C3AZTMhFAK02MH0STbaYV0g==
X-Google-Smtp-Source: ABdhPJzzCiHuuzGcxULeosyTXBOlK4ZIt+/tGPvNknk5TvX+B4AW7O4jdcVufduouBXWPpOhHI87w0ZcR36cvNaGFFs=
X-Received: by 2002:a17:902:7405:: with SMTP id
 g5mr305146pll.325.1597871210318; 
 Wed, 19 Aug 2020 14:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200718005141.440405-1-vitor@massaru.org>
In-Reply-To: <20200718005141.440405-1-vitor@massaru.org>
Date: Wed, 19 Aug 2020 14:06:39 -0700
Message-ID: <CAFd5g47orvwzPOnFepDCjkv0nd08Ad2mmVp+XZgVmpGr5C2HwA@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] lib: Convert test_user_copy
	to KUnit test
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 17, 2020 at 5:51 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> This adds the conversion of the runtime tests of test_user_copy fuctions,
> from `lib/test_user_copy.c` to KUnit tests.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
