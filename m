Return-Path: <SRS0=MEeH=BB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA3AC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 18:30:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE51207E8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jul 2020 18:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="elNYwD1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE51207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3C5D868A8;
	Wed, 22 Jul 2020 18:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9K6cAb4_kQr; Wed, 22 Jul 2020 18:30:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D5934864F4;
	Wed, 22 Jul 2020 18:30:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5903C004E;
	Wed, 22 Jul 2020 18:30:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2850EC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2333486519
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pO3c2NNsBJ9Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:30:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A987864F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 18:30:04 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id 2so1483860ybr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jul 2020 11:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4e/KF48f9JUg5sygJxwMfUiq+YIbJ7Nlc7LSKPnv3rI=;
 b=elNYwD1e4l5A1KsSeru0ittmsBZcP9Qvxdm6i1W2vAadzRzceSIF8GOqVbab64YGjI
 xla+wgOFhaQAak7QezviTywlZwEDOs3EXob3DAeRjPBLlU/sRfiK0NJkdC02HnGu3cmm
 9Tza53NoK+Rx72dBOeEZt1gA3coJhMDCGjdVwsJMp35icIDjL/wLEA4XVM/l3n55IkYS
 LYiOBfmW64KojOHqjG6zVHTj5OVcDb9Q0fpMkzzJQon9sjivSRMjJguIdTyhBEQqBFMl
 I8ZkXOoRyc93D0lDVv7Jvo31XOVIfoCPP9bzu+FUgajm3oMoxsvj+snvVne/3F1M2nu0
 gj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4e/KF48f9JUg5sygJxwMfUiq+YIbJ7Nlc7LSKPnv3rI=;
 b=g/9bGo7wAz0T1rHLemeeXbcLEgwTXKM/tcB1aos+WLEqWyOZHzm2zcegOEirWGgG2N
 ELC4HpnbWCsi4eLNHjcVWLs5X0Deu/hbOCE570vxdqzVby5Boz1IDyzWDf2lAZdQHeyL
 nAbVF+/K1xF88yLLtyyjDyekgoJnKoHW36UAnZx5AoHJoiA5oMAQZbk40AmS8xuttPiz
 OfDXU9TJdEaqRfi2ijVdhRCwM8M+Iy5Qqky6XDPsPfNvl+prsHJYB1+DKrOpdZRxds/7
 WSlsKsJUbcwW8qB9t9vtIfKUla9xEYDSShJEI+IBoSkxLfawXBQm4nTtZ6wRKQCd4cC2
 urXQ==
X-Gm-Message-State: AOAM5331VcbrbiHlkXfdptaVuC+Najr/LZD3uutCLeoHmHL/muSWQzlp
 TcIYiRJbkZcAQmUW7Be+phB/fdALiV7B4XmYrldhAA==
X-Google-Smtp-Source: ABdhPJy+ZrG8SAw6xEmL/PrEzWg/CRqYaJT9N71mtGNjeBynwVo4OjeQbE9HHYEo9y47LHFPFKU+nTWaSv5a+5HPYl0=
X-Received: by 2002:a25:4e45:: with SMTP id c66mr925374ybb.333.1595442603378; 
 Wed, 22 Jul 2020 11:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200721174654.72132-1-vitor@massaru.org>
 <202007211207.5BAA9D8D@keescook>
 <CADQ6JjU8rX2F_iBqth3u0EiA+CBgz4H+YL_-nbQ_cojYeLFXKQ@mail.gmail.com>
 <202007211911.666E080@keescook>
In-Reply-To: <202007211911.666E080@keescook>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Wed, 22 Jul 2020 15:29:27 -0300
Message-ID: <CADQ6JjUgVXBfHfb=V2ajwm=rHi12rxiqEtpivjY03xZbp6k7wg@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Gow <davidgow@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_user_copy
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Jul 21, 2020 at 11:12 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Jul 21, 2020 at 07:19:12PM -0300, Vitor Massaru Iha wrote:
> > When you talk about end-of-test summary, is it what is written in
> > dmesg and not the kunit-tool?
>
> Right, if I build this as a module and do "modprobe user_copy_kunit",
> what will show up in dmesg?

No, It doesn't. I'll put the messages again.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
