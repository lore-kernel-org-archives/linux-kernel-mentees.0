Return-Path: <SRS0=EZza=B6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B6C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 20:03:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922A7207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 20:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="iV5dB/t3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 922A7207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 92D20883F0;
	Thu, 20 Aug 2020 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7usyAW6tEIWT; Thu, 20 Aug 2020 20:02:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3471988411;
	Thu, 20 Aug 2020 20:02:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13EFFC07FF;
	Thu, 20 Aug 2020 20:02:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A45C5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 20:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94C45882CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 20:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGOrEa+-a+w1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 20:02:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 74E41882C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 20:02:56 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id i10so1759058ybt.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKzOsx3lB8pzuOnpghHkzifipDVHUez5Ep3w+VChvf0=;
 b=iV5dB/t3SeBM+FwAbkWuzlVj7dB/3sx6clIP6cToxRAKGcIsGtW43y7PIOaTMuPXOb
 xRI8hv+9CZJ1X5Z2rRl94DLH3a/Ls8H6OX1cjHiy3lOIrqI4LThU43BR8aDebN82Z/Ol
 eTEded8ta1Rq53oy8ny+wdVIS6YIqmJWFXFjfy7mmIdyy7vagX7XpsAEAgUz46sQThTv
 D3gjB1/GosxtfNunimcT9BPagecNLl004x0DAUeY5dBeYfW6zCieS0S0GslqBSY/Us1m
 FoFnE4IQIX9qcWbekRlyAkngQnj8V6qaV+AfXL4JCxY0ywsiQWEPqXLSMQTIG3v55ezo
 nTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKzOsx3lB8pzuOnpghHkzifipDVHUez5Ep3w+VChvf0=;
 b=NBA4xT8UwqESPW5mK5UTM4VvmGwLbB0FovwN17aINpT0tp/WcjVPOaEY3C023VIDVN
 WfCe0qvhiiphidEAnz0/cJpqoeM06DUUopzYK3QMSzbqYbvH6X2JmrgBUghyqFRVMW9h
 pO1LHv0HveXj+dH/4TYtFJn9132ONyvKQGdK1P/CbFg10Wazz1YKxuz72PdQYXfOa86g
 o9Dvdt/D2nIeLK5gFSgt9m7C72EFCfzVDW3nX6Elqyb3BFtVChI35E1u3saa4rRgB9Ne
 un+Mxtc2kNVEKyqDgGZ6UqY9OITGNajK96Vx6y3ukB9GysOHyz4KETkQiq8dcqwML9Mt
 TmSg==
X-Gm-Message-State: AOAM532GaNmZBFcdiHiBHGiXjIy/frcxZfPHlTFjJTcROOzIZnuTXp4X
 5UNdCuQBCz9e5ivO+0zTiryOLjMvJi9hdZ8U+sdGYA==
X-Google-Smtp-Source: ABdhPJxiVxLbcB0tn2f/pg5YuwsWHw31MGw6sjXeQSIBYBTKIYOVjOLw2jEetHYAwMcfXDPX8GrHs38hjbuuVhldjD4=
X-Received: by 2002:a5b:c44:: with SMTP id d4mr6648410ybr.488.1597953775217;
 Thu, 20 Aug 2020 13:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200819193917.67409-1-vitor@massaru.org>
 <CAFd5g45_6mA7c4Bu9jSigEzeGqQgLz=o5v6VrSM7Qx39c_WDFQ@mail.gmail.com>
In-Reply-To: <CAFd5g45_6mA7c4Bu9jSigEzeGqQgLz=o5v6VrSM7Qx39c_WDFQ@mail.gmail.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Thu, 20 Aug 2020 17:02:19 -0300
Message-ID: <CADQ6JjVDvfUaT-rZ2PVYgKpyBZfOm7UmyfaY=btZAmfHXLBjBA@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Aug 19, 2020 at 7:24 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> On Wed, Aug 19, 2020 at 12:39 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > In some cases, to maintain the consistency of the Expected messages
> > with the original runtime test, it is necessary to customize the
> > Expected messages on KUnit.
> >
> > As an example test_overflow conversion to KUnit (I added 1,
> > p->s_of+1, just to fail the test).
> >
> > Using KUNIT_EXPECT_EQ:
> >
> > Expected _of == p->s_of+1, but
> >   _of == 0
> >   p->s_of+1 == 1
> > not ok 1 - overflow_calculation_test
> > ok 2 - overflow_shift_test
> >
> > Using KUNIT_EXPECT_EQ_CUSTOM_MSG:
> >
> > Expected 0 + 0 to not overflow (type u8)
> > not ok 1 - overflow_calculation_test
> >
> > Which is more similar to the error message of the original test.
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
>
> All in all this looks pretty reasonable to me; however, is there any
> chance you could provide an example of its usage?

Sure I'll do that.

I am reviewing the errors reported by 0day in the overflow_kunit patch v3,
and I noticed when compiling overflow_kunit with the parameters of
0day and this patch, there were some errors related to this patch that I sent.

I'll fix it too.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
