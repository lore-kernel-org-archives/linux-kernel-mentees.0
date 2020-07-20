Return-Path: <SRS0=pTPf=A7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A7EC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 19:05:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FFBF208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 19:05:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGH3EGZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFBF208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 51FC0881B7;
	Mon, 20 Jul 2020 19:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXypjt6uW+Au; Mon, 20 Jul 2020 19:05:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DADAD881C8;
	Mon, 20 Jul 2020 19:05:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEC17C0894;
	Mon, 20 Jul 2020 19:05:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27705C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1399287951
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gsNB+2OigLp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:05:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 29F8083B4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:05:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b79so2847176qkg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=6xNou+cHACWFvHGNXzPofMh+CBZIQ8xW+dhFT3jGEbo=;
 b=qGH3EGZrbBYJFFXLpy9788889L91tGMGugiOZhBG5mkmuOaHr8qDM4J+IGuyanGPhu
 Vxw9qvA8wjLil9OOQMqcA36LhPMFBJkuR0e9m5fhddTmTp9pHfA5IGt9YTi+3ndcaQuR
 L4iHvaYG3FlYLQNaKPSDnM/F4BFGwLPeEeqHRxhnjrRM0rM5cBpm0jx1vXcUuQGFT8e3
 gDjYTnWK7GtT4p+w6abgKeVqvOO0ncOtFM2MFragZvc27GLYAM0zDQ9xVdCtz4YlFta7
 IhjYfdyVkfF3bEeAeEZ5QtiyT0AN2J4NIEHs561V0bBVGf9tE1zwOcx6W6cHIDxqNI8F
 TQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=6xNou+cHACWFvHGNXzPofMh+CBZIQ8xW+dhFT3jGEbo=;
 b=IRGQwYOr1VP7+Mqe8KwHqGleWE4IW5OmBggIVlNhVzMF6x445Z6TOcuhrSp7RU7l6E
 LmyeSANG8LVSfhZe96w5jL885+25mn5NIJcA3UncTM7cZpbDplVSzRfGbq3B0S+ChXVG
 klh3b47lMmUEJIggVj094nVjZztY7jduWp/r+c6QATryDw00KmlS8WADqRT7jd6HrgvK
 cPk8elJIHG60EGLnVcSr48m+Hxwrp4Ux3qE8fpzO9k9E3WrPTOk35Y1gDxzK+7VbFcux
 UjLQmOTqht1MA1V3pTQ9GRDfTbzX+Ct1mzzjE9pGr2NAmF7xkSoeK1TY9iGPhXdz5fey
 z2NQ==
X-Gm-Message-State: AOAM530O72F/G3E6mePP0Qdj5e5DGRUXEbWasiYq4FQ3D3ZYTKcMM5X3
 OoEYl5uJdiLBMO7jUY2gGw==
X-Google-Smtp-Source: ABdhPJzrXQwdWF+qa2wzWCIT1nZ5JLyIGIeu284ZR14tqRjIjGzf7/7OV2hINf0xqBRSi/yBapdmYQ==
X-Received: by 2002:a37:80c:: with SMTP id 12mr7349989qki.149.1595271911228;
 Mon, 20 Jul 2020 12:05:11 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id r2sm19318751qtn.27.2020.07.20.12.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:05:10 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:05:08 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200720190508.GA1946@PWN>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam> <20200720121257.GJ2571@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720121257.GJ2571@kadam>
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
Reply-To: 20200720121257.GJ2571@kadam.osuosl.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, Jul 20, 2020 at 03:12:57PM +0300, Dan Carpenter wrote:
> So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
> the earlier check.  That risks breaking userspace.  Another option is to
> just add a check like you did earlier to the HIDIOCGUSAGE case.
> Probably just do option #2 and resend.

Sure, I will just add the same check to the HIDIOCGUSAGE case for the
time being. Thank you for the detailed explanation.

Here's what I found after digging a bit further though:

hid_parser_main() calls different functions in order to process
different type of items:

drivers/hid/hid-core.c:1193:

	static int (*dispatch_type[])(struct hid_parser *parser,
				      struct hid_item *item) = {
		hid_parser_main,
		hid_parser_global,
		hid_parser_local,
		hid_parser_reserved
	};

In this case, hid_parser_main() calls hid_add_field(), which in turn
calls hid_register_field(), which allocates the `field` object as you
mentioned:

drivers/hid/hid-core.c:102:

	field = kzalloc((sizeof(struct hid_field) +
			 usages * sizeof(struct hid_usage) +
			 values * sizeof(unsigned)), GFP_KERNEL);

Here, `values` equals to `global.report_count`. See how it is being
called:

drivers/hid/hid-core.c:303:

	field = hid_register_field(report, usages, parser->global.report_count);

In hid_parser_main(), `global.report_count` can be set by calling
hid_parser_global().

However, the syzkaller reproducer made hid_parser_main() to call
hid_parser_global() __before__ `global.report_count` is properly set. It's
zero. So hid_register_field() allocated `field` with `values` equals to
zero - No room for value[] at all. I believe this caused the bug.

Apparently hid_parser_main() doesn't care about which item (main, local,
global and reserved) gets processed first. I am new to this code and I
don't know whether this is by design, but this arbitrarity is
apparently causing some issues.

As another example, in hid_add_field():

drivers/hid/hid-core.c:289:

	report->size += parser->global.report_size * parser->global.report_count;

If `global.report_count` is zero, `report->size` gets increased by zero.
Is this working as intended? It seems weird to me.

Thank you,

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
