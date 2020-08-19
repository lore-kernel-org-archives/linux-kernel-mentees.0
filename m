Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDFBC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C2C20758
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="IgLyJH3u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C2C20758
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D28BF22720;
	Wed, 19 Aug 2020 22:24:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMpRmHyPogWt; Wed, 19 Aug 2020 22:24:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 553C72266F;
	Wed, 19 Aug 2020 22:24:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F247C07FF;
	Wed, 19 Aug 2020 22:24:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2B48C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9796A87CB9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnHvRihFRU8H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:24:19 +0000 (UTC)
X-Greylist: delayed 01:18:29 by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F9FE87CB6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 22:24:19 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id d4so81217pjx.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 15:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mwKR6nVMsgYYs/B7Ul4QvpDyXnAKjHXbGGpIAyK6X6A=;
 b=IgLyJH3u6Pz4eV0GcQ4tlmNWV6kzDzfuGoD+/a6GpCiqCtVC+j1xHuuYijwL6FZq/3
 TDESwYKf3yzfNnjm3z7RJ2F62YellEDt0uk2noFYmd1VgZSTm0JztjjvAb1Hzr/DWkR+
 BFl21K4iOfyMqMBETpIo0Apy6kz1jT5UqL2iuDhSCx7doo74ztudwuykQZz1GapAMcAw
 zcR6BNWyRPRo8dXqdrNwVsQunwtWHDqvU2ENpyzgCNP2pKMmGHGb0SQfG6YTDcN4sHG+
 Jw2ju7j6tF1wKpuMBVEBe+C34LG0P6uKL5Z3EPnzNqv8cCQbS1RDHlQosW/9oyALWyhb
 xjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mwKR6nVMsgYYs/B7Ul4QvpDyXnAKjHXbGGpIAyK6X6A=;
 b=LewqSYaLLF4Ao71HuC2C+RneBPuDxVK6Dsw4zBl4fg4y7EMutreiG7ggBnMH73D9Xq
 Df6tabNSkxjUfFhaX3i1CPHok/zRgh79Xw0EkRa1XuwXLQWPptxgJREr2bAfQhFzq3mA
 /n7d4FPitYbw2ytqtuzGVY7eh1D1mIlo6UzSnvelwt3trPOZ7WJPrzkKGQ7Qcm7SOWCn
 zZzdnrb1eBNVzg765VsaDqA+QBTh7iGWDOvH1ZYtE7Q1Af0o1KRWsBf/npo3BuwJFqqM
 EcfwOT02DdWr7PX/thC/ZK/E3rurUcTWdkAva71NM0GplTO7xo6x7iivfWIZREj6ZrV6
 Hmog==
X-Gm-Message-State: AOAM532k7bFNF/3qJLf0W+faKcq/neWAFS9UCo7fG/Q5DNQEuI25n8XJ
 OlxgciwXRXfCFVucH1OJ5BG4rXaH37R6I8GG3OCWtA==
X-Google-Smtp-Source: ABdhPJyjxTBnEsfMorPrBFzUbmi+b9Ju+01D9r12pOISge3wUkXvOjxPz4AqmsYd+WBIAuVXkXNsZyrEPIZiAw9c9pI=
X-Received: by 2002:a17:902:c382:: with SMTP id
 g2mr201443plg.297.1597875858377; 
 Wed, 19 Aug 2020 15:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200819193917.67409-1-vitor@massaru.org>
In-Reply-To: <20200819193917.67409-1-vitor@massaru.org>
Date: Wed, 19 Aug 2020 15:24:07 -0700
Message-ID: <CAFd5g45_6mA7c4Bu9jSigEzeGqQgLz=o5v6VrSM7Qx39c_WDFQ@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: Customize
	KUNIT_EXCEPT/KUNIT_ASSERT Expected messages
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

On Wed, Aug 19, 2020 at 12:39 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> In some cases, to maintain the consistency of the Expected messages
> with the original runtime test, it is necessary to customize the
> Expected messages on KUnit.
>
> As an example test_overflow conversion to KUnit (I added 1,
> p->s_of+1, just to fail the test).
>
> Using KUNIT_EXPECT_EQ:
>
> Expected _of == p->s_of+1, but
>   _of == 0
>   p->s_of+1 == 1
> not ok 1 - overflow_calculation_test
> ok 2 - overflow_shift_test
>
> Using KUNIT_EXPECT_EQ_CUSTOM_MSG:
>
> Expected 0 + 0 to not overflow (type u8)
> not ok 1 - overflow_calculation_test
>
> Which is more similar to the error message of the original test.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

All in all this looks pretty reasonable to me; however, is there any
chance you could provide an example of its usage?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
