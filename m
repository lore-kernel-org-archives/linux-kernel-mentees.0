Return-Path: <SRS0=c8zi=BA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361DEC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 08:39:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC7A20709
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jul 2020 08:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="japsxIaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AC7A20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C32CF813F6;
	Tue, 21 Jul 2020 08:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QbU8e1kVozH8; Tue, 21 Jul 2020 08:39:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65B24886FB;
	Tue, 21 Jul 2020 08:39:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 428A8C089F;
	Tue, 21 Jul 2020 08:39:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43866C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 08:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 326DF88BAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 08:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0PFJGO2lWoQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 08:39:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1F4388B9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 08:39:41 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e12so15521674qtr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jul 2020 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pl7EZWmiDwJBT7lZl+dqeQwSQYq+gpMZJQPAX61Vc1k=;
 b=japsxIaYfxBdMqncvjy5ilGa0f46e0ryCrw3nPjtP8bIcI3e6Cda4GMoR2yvJ9of4X
 exN1AayGIZ2ZqEuJzgUO/h7w4c7FXIFPiZySVql8I3oVXAGTfXRaM70E4mQc0kT4m8l6
 q7ZHk3dbYAb+fHPAN8/6n+6OldMzj/s9ikyxFbhwhK3yR/hbC6nS1AWDULLElQPYQRfk
 LvakODx5M8I8gCRYdQ5xND272MzjvK7ALX4eSrg7tF1QkdPMVP7aqs77TkuxuMgBYqtt
 GRNs2xMKToJ1xd5KjNYlTf6LQHJwW6uU2hPvkRZfifSBVoLxKJiRS1KRoHF+vV5mwgLA
 ZkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pl7EZWmiDwJBT7lZl+dqeQwSQYq+gpMZJQPAX61Vc1k=;
 b=B0ul5wv0HuohJqCW+hWTsDWiOW5ogjxDLVh0o167QLqtOoGZCH8SGJqrtCkxLMZy2B
 VzSyb92+bihuQkeSzvmU8v0lmEmtvDWpSs5BTVK6QB0R1eGZGXyLDmFQ250F2tFJUQNq
 zsU7ZrzBvZups52mffKwDBbifvmAQGlDSyVl7o67hCeXv57xCVd9DACWUyLso9o6qmGX
 WBQOp/s45C5g82ZHh4UGB64Srt+/ETFihlk+pRBqXm21PEZANTNvGJdZq0Zd9t99823l
 F8TCDJRUEWeBn7mdTuNl5pcrJoIudRUrG6QkPqUaT6PdJSUNJ94fJtWgIt0/jVxXA6HG
 3H0w==
X-Gm-Message-State: AOAM5320J9N1uKJx/Vww8f5ta6EbMsnLQmQbkoOTMFoddb/eKm3JZZ5H
 bgbCExQor3dbo2BLBiqENw==
X-Google-Smtp-Source: ABdhPJxe1Z/jmzC0J6uu0OyPwe0gihfRluX1lhIi7H0/BdRm6UJYVkGpYiWbPdzC7W9ZSvEqERmqag==
X-Received: by 2002:ac8:191b:: with SMTP id t27mr28779822qtj.16.1595320780558; 
 Tue, 21 Jul 2020 01:39:40 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id z36sm22239254qtd.22.2020.07.21.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 01:39:40 -0700 (PDT)
Date: Tue, 21 Jul 2020 04:39:38 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200721083938.GA8005@PWN>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam> <20200720121257.GJ2571@kadam>
 <20200720191656.GA3366@PWN> <20200721071637.GK2571@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721071637.GK2571@kadam>
Cc: linux-usb@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix
 slab-out-of-bounds write in hiddev_ioctl_usage()
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

On Tue, Jul 21, 2020 at 10:16:37AM +0300, Dan Carpenter wrote:
> For some reason the reply-to header on your email is bogus:
> 
> Reply-To: 20200720121257.GJ2571@kadam
> 
> "kadam" is a system on my home network.

Ah...I thought `Reply-To` and `In-Reply-To` are the same thing...Sorry
for the beginner's mistake...

> Yeah.  And in the caller it does:
> 
> drivers/hid/hid-core.c
>    297          if (!parser->local.usage_index) /* Ignore padding fields */
>    298                  return 0;
>    299  
>    300          usages = max_t(unsigned, parser->local.usage_index,
>                 ^^^^^^^^^^^^^^
>    301                                   parser->global.report_count);
>    302  
>    303          field = hid_register_field(report, usages, parser->global.report_count);
>                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> So ->usages is always greater or equal to ->global.report_count.
> 
>    304          if (!field)
>    305                  return 0;
>    306  
>    307          field->physical = hid_lookup_collection(parser, HID_COLLECTION_PHYSICAL);
> 
> > 
> > Here, `values` equals to `global.report_count`. See how it is being
> > called:
> > 
> > drivers/hid/hid-core.c:303:
> > 
> >         field = hid_register_field(report, usages, parser->global.report_count);
> > 
> > In hid_open_report(), `global.report_count` can be set by calling
> > hid_parser_global().
> > 
> > However, the syzkaller reproducer made hid_open_report() to call
> > hid_parser_main() __before__ `global.report_count` is properly set. It's
> > zero. So hid_register_field() allocated `field` with `values` equals to
> > zero - No room for value[] at all. I believe this caused the bug.
> 
> I don't know if zero is valid or not.  I suspect it is valid.  We have
> no reason to think that it's invalid.

I see, I will stop guessing and wait for the maintainers' feedback.

Thank you,

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
