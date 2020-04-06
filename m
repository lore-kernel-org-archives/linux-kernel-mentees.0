Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0685BC2BA17
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 18:20:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C447A206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 18:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="vQ3F4e20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C447A206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C06F888574;
	Mon,  6 Apr 2020 18:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOFjqp24yDGq; Mon,  6 Apr 2020 18:20:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A39F8855F;
	Mon,  6 Apr 2020 18:20:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E5DEC089E;
	Mon,  6 Apr 2020 18:20:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 030B8C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 18:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D920A2338F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 18:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmDlEykzNYxj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 18:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 93BCF2046A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 18:19:58 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id r21so5516125oij.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ver6n6MUoiKJ9YQThw8+RbAg+VfgvE+bRaGA1TEZ9VE=;
 b=vQ3F4e20+rPDeXfCEpsaDzx4gn2vua9DgaFCprSToBwI20LZ5YB4UsBIJfyfRVCQw/
 Ink+pTcBBewybEaXx8NhUDqYX8w1Dw/rPVxpaIcMBOJUv/wyf3ZSTAsysrxDoksvoQSO
 fIQ4fEdj10/Ux4gC4Dwl6bekkG5P3XmylDoxXB/x1CZNeuPgacxGKd0niIyMFLCM0lw6
 n4KXDQTbJXV2JO2k6TDP7q2ntBK6053pabIyqsUvJS+migpswwmAjIk2FFPdLbXpEZ21
 Zn0OdSBc+7IDjqFnbKm82vd0w9UMPwNmD1cDMyreHkwtazMNAyR+RfJnBTfsPRxlF3Lk
 vwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ver6n6MUoiKJ9YQThw8+RbAg+VfgvE+bRaGA1TEZ9VE=;
 b=XpI5e//5GG9sWmFhPIHPaKqviGFREUNDzYJBZJZaW1sGMvSoVBVWxnGDvgNxSIWSwU
 iYbcczsbt9SwuQJeKJmVNgGBZdxJIC8RB8RPXRcA21JD7ZO7Ls1tY3K4PeT4dkI/UN4Y
 zW3R7RSa2gfZ9Rbb5FmPIBqa/froZYuNwFzoKGmUYfwwUhwQiXm2FKm+oEG6xXVDQgOk
 tKuOyA1a5FxPB9uozWxxZ825o3Y9MQq+NeWwxuBmi7GS/rQI4wnbO+DonEDQ834WobHI
 cf1eh29ReRC4tsgYjKQxmZARW/eyg7Xr7A8pWbqVUrsb5VK1L8+f04jaWyszJdTDHz3l
 it7w==
X-Gm-Message-State: AGi0PuZxP2CaFEI8EmRdkyL1aIl/ndcBzu72igY/vLjzhbGpAZz6sWm5
 Eg9KfTxHKKpqDoyqI1HB8S9Hd5zBj7ZJ3rSlxToUToU/INw=
X-Google-Smtp-Source: APiQypKrJQ4k0jrnTIHHGTaNBKzi/QJwJ+B536oRq/t8JvxDSa97hNj3Szu7UByf6aPQ0mNLznHy80PVB1X5w5GHgBU=
X-Received: by 2002:a17:90a:9f03:: with SMTP id n3mr639147pjp.29.1586196735041; 
 Mon, 06 Apr 2020 11:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200401013639.16388-1-vitor@massaru.org>
In-Reply-To: <20200401013639.16388-1-vitor@massaru.org>
Date: Mon, 6 Apr 2020 11:12:03 -0700
Message-ID: <CAFd5g47Ot-MfxzYmU8kfxpfv2pWhgb_2WigouuHnPT+20Ejk_w@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kunit: Fix kunit.py run
 --build_dir='<foo>' fails on "unclean" trees
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

On Tue, Mar 31, 2020 at 6:36 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
>
> For some reason, the environment variable ARCH is used instead of ARCH
> passed as an argument, this patch uses a copy of the env, but using
> ARCH=um and CROSS_COMPILER='' to avoid this problem.
>
> This patch doesn't change the user's environment variables, avoiding
> side effects.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Sorry for the delayed reply. I had two people finish up on my team
last week and I needed to do some things for that. You now have my
undivided attention.

So, I tried to apply this patch and it still doesn't apply on
kselftest/kunit. At this point, basing your changes on torvalds/master
would be fine since kselftest/kunit just got merged for 5.7.

Can you use the --base branch option when you send your next revision
so I know what branch you are working against (just to be sure)?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
