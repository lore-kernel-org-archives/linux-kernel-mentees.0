Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F54C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:16:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9D52063A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="PQ/fSMj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9D52063A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0623E86250;
	Wed, 19 Aug 2020 21:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAw7kbu0jmNx; Wed, 19 Aug 2020 21:16:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A8E0286243;
	Wed, 19 Aug 2020 21:16:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97C2DC0889;
	Wed, 19 Aug 2020 21:16:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82149C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7185A86248
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vF6FRyXP_zuf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:16:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 246A886243
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:16:31 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id l204so191845oib.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISHsgRR5gl1O/B06PdWuntMjm3+ExqlO30Mr+J1G2xE=;
 b=PQ/fSMj0XrmkoZzKZR0CPMZehNvw/44Weg4jc42HK+CIyf5qjE1PYJfGFJVOPM81+V
 XdTT7clkmFaPSu7YXUD0ZrfauGexDDFjQjV2cRtF26zDONqog/mxRakacI8dVVzSozhX
 xMfKADktTXL/7dktq6oytc9ioxlRzGZozrNUm+Ay1xRnBee+78WPtV2QzQFd2S4DmN31
 gPNqhIeFbPzbxsn9voCo03tsh1ZQl3mke4fF6i4t4CS62rSxrpLOZ/1RG4KnCAGFd0vG
 tkMLJgOofjISqXRv3MvFCFM48r5gZP80UDhEtmIk1N8a+SFWyIxnGU2SKV7aOrJW3+HL
 lPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISHsgRR5gl1O/B06PdWuntMjm3+ExqlO30Mr+J1G2xE=;
 b=FPn9xrU3UnQpFJoSNtbSQbk6P+IsfdAVVhnSW2nMIBzpDJ2FxF7ct0VSpV/mpe5sVE
 cNzC1D0k0t82HS3vLIL0OnOstyK4AWLpmZQngiAe4ekTZc5vsOHmK/SYl4zKMD3Z+Vm3
 lTpRoqzk22HwPwbz7KZ3pSZu+Nw/XYpeWSyeivILVL7Avy2zjpDSfDy8fo2mbQgpN4rg
 GVhYc6aXTPUdJfUu7XgbAQHmTUfPRLVsow/e+Cp7zZVoByv5VlnQtXq/N7N13DOFc9Ws
 08M+ftD74B23/drHQTbuC7zN5i78GONIOwl0+agrLjt3YmiIYHX2OqFRVEfhxw0gsYwA
 1iPg==
X-Gm-Message-State: AOAM530c42U6Z87F0H8e5U26+vc/w8tkJDLVLTqIXKuN4hzXv+5G7M8e
 v4XwqOHcr17wUjbtsdyn4ll89htSeRfutAGwYUWKxZSiVrUEJg==
X-Google-Smtp-Source: ABdhPJw3rds3hFHXZBmb2t1NM0mWnTXuiGc2v5dZ5hD8649AwV9NTlXL0gWQVpT+9K7Iz9ak0hBsrTEyeAh4Vu5T6LI=
X-Received: by 2002:a17:90a:d317:: with SMTP id
 p23mr3682356pju.217.1597871423161; 
 Wed, 19 Aug 2020 14:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200729175849.148332-1-vitor@massaru.org>
In-Reply-To: <20200729175849.148332-1-vitor@massaru.org>
Date: Wed, 19 Aug 2020 14:10:11 -0700
Message-ID: <CAFd5g47s09BfsqNx2RY1Zdp-TC4KbKgsMgr9-SHv1Nf6P9vAMQ@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-kernel-mentees@lists.linuxfoundation.org, kvalo@codeaurora.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: kunit: add bitfield test
	conversion to KUnit
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

On Wed, Jul 29, 2020 at 10:58 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> This adds the conversion of the runtime tests of test_bitfield,
> from `lib/test_bitfield.c` to KUnit tests.
>
> Please apply this commit first (linux-kselftest/kunit-fixes):
> 3f37d14b8a3152441f36b6bc74000996679f0998 kunit: kunit_config: Fix parsing of CONFIG options with space
>
> Code Style Documentation: [0]
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Link: [0] https://lore.kernel.org/linux-kselftest/20200620054944.167330-1-davidgow@google.com/T/#u

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Probably still want a review from Johannes though.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
