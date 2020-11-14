Return-Path: <SRS0=iase=EU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A59C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Nov 2020 03:17:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D6822245
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Nov 2020 03:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="V7otNblM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D6822245
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 37253876B4;
	Sat, 14 Nov 2020 03:17:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CGwYbHCkRF2; Sat, 14 Nov 2020 03:17:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1D85876B3;
	Sat, 14 Nov 2020 03:17:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5977C088E;
	Sat, 14 Nov 2020 03:17:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 932DDC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 03:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7A2FB879C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 03:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwHejN9+YuIy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 03:17:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AB7F9879BB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Nov 2020 03:17:51 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u19so10838593lfr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 19:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=toERlzzL8WsCdEJfo/3bQq0LwXblt9dO26uWe3e3YTc=;
 b=V7otNblMuyZJjoIlSQV8V3el9jARxmNTrT4RNaPNgCDMAs6a8ZyF72bmMx/Puc7Z4B
 fTlnLfxV+9FVrwnZTwLcBybPWeVSZid1maToFquae9JPCw+wLluljYJWKP0aFiHbKQ+a
 C7UpxYgvZORZD8n0v8Ad5ZTGd8NYrz9W4r5EUDeltqDSuoIhDJT2ZZ3wtq62iCaYQgkw
 uGmjfgCLmoirVbHly8G9MdrrjFWCr2LBQUiWPxfaX+zBUEguGmVOpw8Z6HYyGdad67MC
 4i3mDgKKMnweBfOtBTVpeeSAgrLlGbhOY6BX9KMwPwrGxlGmX6Iz1cdceIL0DXQVChXf
 618A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=toERlzzL8WsCdEJfo/3bQq0LwXblt9dO26uWe3e3YTc=;
 b=XAeR8SUs6UcVX2t5UWDqdCoEb5JlaWoCkIuyCb+PzmMNf+2CuUoWKzDIFbqYVXJGNY
 v2v9/z7gp/TGHEqH0dLY5A8GPIry9rJabdRx8me2LF24DWP2H2heO6UXcFoReDmX5leO
 lVxOICopKTmRE+MYOxJLa1pxtrFQh8kpz2ijoxAwdJT4z3/m72+8wczJe5KhCtAlRNB4
 6eR1JIrSP5NHhljgOXIjPQSBZjwvFU3E02xIiXMpmkOKcjYOwoRhEc6L5CsVUCj+3PoY
 D/bfI3fyvUKRSTRmLPEroFsghEQG0d1uByi2pVI7zQ3LWUQee25y7oWjZfXA1qR4n/Qz
 TFbQ==
X-Gm-Message-State: AOAM532nlVIUyuZqmYzIYeDDbl+J2A3V331IgZMHuEtUGKnYn9A2/An1
 DCkRTKaW6aAWdzjMxP39MJIv6LkFJqRLBS+N8C2IsQ==
X-Google-Smtp-Source: ABdhPJzbOz34I7Z/noAxv/VgqHN/KtzJ/v+YY+qrROjrv3c/EYOpfeZxrDMfk5BeKnwQG9XwDsNMt8EnbVtsDL0qJGE=
X-Received: by 2002:a19:5e5e:: with SMTP id z30mr1879264lfi.277.1605323869521; 
 Fri, 13 Nov 2020 19:17:49 -0800 (PST)
MIME-Version: 1.0
References: <CABVgOSkQ6+y7OGw2494cJa2b60EkSjncLNAgc9cJDbS=X9J3WA@mail.gmail.com>
 <CANpmjNNp2RUCE_ypp2R4MznikTYRYeCDuF7VMp+Hbh=55KWa3A@mail.gmail.com>
 <47a05c5a-485d-026b-c1c3-476ed1a97856@gmail.com>
 <CABVgOSkZ9k6bHPp=LVATWfokMSrEuD87jOfE5MiVYAEbZMmaQQ@mail.gmail.com>
 <BY5PR13MB29336C5BE374D69939DCADABFDE90@BY5PR13MB2933.namprd13.prod.outlook.com>
 <CABVgOSnJAgWvTTABaF082LuYjAoAWzrBsyu9sT7x4GGMVsOD6Q@mail.gmail.com>
 <BY5PR13MB293305FE7ED35EC2B2C81AF1FDE80@BY5PR13MB2933.namprd13.prod.outlook.com>
 <CABVgOSn0vUvHFTPPnFGCmg0pEotwr6TQXQieRV=EMqs1QmFYUw@mail.gmail.com>
 <20201112123706.GA2457520@elver.google.com>
 <CABVgOSkjExNtGny=CDT1WVaXUVgSEaf7hwx8=VY4atN5ot10KQ@mail.gmail.com>
 <20201113103056.GA1568882@elver.google.com>
 <CABVgOS=0Qm-Aa5qgh3PRxbcV0-2ZZaQCm-4HY0dx8597oY+yXw@mail.gmail.com>
 <CANpmjNNmzzuHpJOVV2JAKdgA48fxmqtXjDDOUg0e4+08kfQEXg@mail.gmail.com>
 <9c20815b-40df-d1c8-112f-e8d9732333eb@gmail.com>
In-Reply-To: <9c20815b-40df-d1c8-112f-e8d9732333eb@gmail.com>
Date: Sat, 14 Nov 2020 11:17:38 +0800
Message-ID: <CABVgOSnkZ2f8JaXEUnCBS=7d7bgnCbKtp8QM1AUdVAuwQ9t69A@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] kunit: Support for
	Parameterized Testing
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
From: David Gow via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Nov 14, 2020 at 9:38 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> On 14/11/20 5:44 am, Marco Elver wrote:
> >
> > Arpitha: Do you want to send v7, but with the following modifications
> > from what I proposed? Assuming nobody objects.
> >
> > 1. Remove the num_params counter and don't print the number of params
> > anymore, nor do validation that generators are deterministic.
> > 2. Remove the [].
> > [ I'm happy to send as well, just let me know what you prefer. ]
> >
> > Thanks,
> > -- Marco
> >
>
> If no objections I will send the v7 with the above changes.
> Thanks!

This sounds good to me!

Cheers,
-- David
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
