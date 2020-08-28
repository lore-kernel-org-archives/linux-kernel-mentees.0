Return-Path: <SRS0=3tna=CG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6053BC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Aug 2020 11:06:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2166C207DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Aug 2020 11:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqNXrGMQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2166C207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD40388052;
	Fri, 28 Aug 2020 11:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id efV0dOe3A8Bm; Fri, 28 Aug 2020 11:06:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72E7187FFE;
	Fri, 28 Aug 2020 11:06:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59820C016F;
	Fri, 28 Aug 2020 11:06:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A15CFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Aug 2020 11:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 89C7C86E07
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Aug 2020 11:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaOTfUHkebti
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Aug 2020 11:06:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B64D886D9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Aug 2020 11:06:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q9so552369wmj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Aug 2020 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzCkNueS5Za9fJgI1E1trgmJ9rPWtcxrqIv2kBAEIIA=;
 b=nqNXrGMQwoqzpRB0gErrvZ6yYPDlhcf0cEjJP4PIpxwB3TJzLQD9R6QDUdKahtv6/G
 ZG5GzNPiR3HzMBsN7cl7yvedrbGYXei4jvXKk0FC+HLsZk4t3B8ErGvWAi6d0A1Hz3kD
 cqzdi1s+VA8IcfGwk04GBOtpvpWF3RhR4DZWmDeft7V1jvKr3zwKGJdg/60VgxmAE6T5
 /r/dLa1uLko+S0/vjA52DFxzWzL1etpUz08eF86r1EkTpCn33uxnV9yZ3UEHiMonJsZ2
 nVKQawEmps+uIMH/wWb+Bl17iC79KiLZDSXwusWhNGVKTqelTrDd0SzrUeaKdQ5YGE8P
 4fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzCkNueS5Za9fJgI1E1trgmJ9rPWtcxrqIv2kBAEIIA=;
 b=ZAND2PEO0ztlDRFIJpvOSmjlvPLBtXQAx9Ly718qQ6mOamMGKR6el6O1CO4T5RrFkT
 drOilb8ZzPGCzRXh8nw4vCAaNfbCv+5ZTtuozYJDB9jhStmijbKIsc/SKkuyIixdEf4w
 88BHUV5Jg4GPJDbtPzruntWrLqbI5nPw5Xjf/fqAjfGfQCfJmSGyl4bQpHvIYBTQhlTY
 dsLOOliuddEGH8J04QhxH+ab9dSUg4bqGw7GyzlFq2ZxAOD1OzJqWQagUTBO8Iuo9lKL
 KBiTnRsL/qnaHhjmaj4TuW9W2GHHu+3NUSpIqLpKMm1Kco7Bv2ZwwxTC2uCHXpKe9scB
 rymw==
X-Gm-Message-State: AOAM531M1k6L2AR5R+k8xyUNHtU0zcyVMOWEzJO83SVO2hJEtGm4M28I
 R00B7nWSQ/uQmJEdAzjMrfp5z4KNWpjIuWV4SNc=
X-Google-Smtp-Source: ABdhPJwEGhSTxPCFU8vPrE3opqM8wcD1YF7m5PGxddaCKQmaFW5dJBzjJv1a3VJ25037p9UaUp0nkEGDo0oVxkrByx4=
X-Received: by 2002:a7b:c923:: with SMTP id h3mr1025587wml.29.1598612795186;
 Fri, 28 Aug 2020 04:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200827065355.15177-1-himadrispandya@gmail.com>
 <5dd266df-33cf-f351-7253-33a7f589cd56@gmail.com>
In-Reply-To: <5dd266df-33cf-f351-7253-33a7f589cd56@gmail.com>
From: Himadri Pandya <himadrispandya@gmail.com>
Date: Fri, 28 Aug 2020 16:36:22 +0530
Message-ID: <CAOY-YV=Ad6E2nbJ-m9SHW4zuet9VeDMLw9M-VtTebp0Far-8SA@mail.gmail.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_phy_addr()
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

On Thu, Aug 27, 2020 at 1:28 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> Hello!
>
> On 27.08.2020 9:53, Himadri Pandya wrote:
>
> > The buffer size is 2 Bytes and we expect to receive the same amount of
> > data. But sometimes we receive less data and run into uninit-was-stored
> > issue upon read. Hence modify the error check on the return value to match
> > with the buffer size as a prevention.
> >
> > Reported-and-tested by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
> > Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> > ---
> >   drivers/net/usb/asix_common.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> > index e39f41efda3e..7bc6e8f856fe 100644
> > --- a/drivers/net/usb/asix_common.c
> > +++ b/drivers/net/usb/asix_common.c
> > @@ -296,7 +296,7 @@ int asix_read_phy_addr(struct usbnet *dev, int internal)
> >
> >       netdev_dbg(dev->net, "asix_get_phy_addr()\n");
> >
> > -     if (ret < 0) {
> > +     if (ret < 2) {
> >               netdev_err(dev->net, "Error reading PHYID register: %02x\n", ret);
>
>     Hm... printing possibly negative values as hex?
>

Yeah. That's odd! Fixing it.

Thanks,
Himadri

> [...]
>
> MBR, Sergei
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
