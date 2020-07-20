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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B308C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 19:17:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047862176B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jul 2020 19:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F28QR+9Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 047862176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D644D879E9;
	Mon, 20 Jul 2020 19:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOk2Bn9Cwaxf; Mon, 20 Jul 2020 19:17:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58F4F879AB;
	Mon, 20 Jul 2020 19:17:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E7F9C089F;
	Mon, 20 Jul 2020 19:17:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2031C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C15BF87463
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBGkTOlZqSyc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:17:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8B317870AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 19:17:00 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id 6so14141014qtt.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jul 2020 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZY4P2StN02i9zxiuCmah02SFOxscsBn3x480+rE92BE=;
 b=F28QR+9Zzm0roouNa+pdVdhRBMtPLP8uaMFAVzvMQkm1Kv0EaR/K6lMQRh9Ri299bS
 ZtsdVBd3SvpaRAG0yMQzvFN32O0GsJ43Gpx7akMZ62K3ddLXXtdlP+NcxCCyU+nTgTKz
 Zjtx2z6EauSPnrEHx2VCb9p28vFxbZvHxu4Er4yWh/bWfdXnC5jgQH1LyxHGTRhuSY6W
 win8CwCqZKHYEPmjahxQh1DgBf/WWK+v5RBRnbB+YUZjyyWKJjgpilizDUf8aja3vQEy
 xrEyJqOOSunZL+CmpMS5H+o0Dnn1qpds9WN+sgBaoK2Goet9+KZdMoeio+nB88U8f7PI
 mP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=ZY4P2StN02i9zxiuCmah02SFOxscsBn3x480+rE92BE=;
 b=M2C68nJkC0Gqvtb+HjfiRn9ICb1MPfnZT2OxmNypklEkXxVxSRPJ9q5a7S+pjmhfLc
 7an+s4SH9A4JMUGprFPuQ2b1n8mYtiy+mqV6V+rPV+gM2ZNuBZ53h8cjs70bxsB058pK
 J4G+0vgfJIj/0bbcZPjN253QQzVKx/r2O694nZxkN4k8CwCc4adGdaFyQp+/jzRAvSvz
 LbtWLdrxbskYDt0OTNPK8h0wiUTcTiDuJAYI7e8N459XyzsrBBOJWh1DiMBT30OPzxwo
 5LIwSqTLue7PWcb/Mz6k61zcz3ZXZpLvKo3E5B2SrpY9RnRcBL59IAWJiKss/D/1/kRP
 ukDw==
X-Gm-Message-State: AOAM531gTgmLXnysVEdG5zFAc4fX5uP/gb0yhn/sycX5+b2/L/HWdl06
 DYCTzYPK8SvtWb2oMhPSwQ==
X-Google-Smtp-Source: ABdhPJy3nesTMpxh3lXG9vD395BscPdn44YrLAJo2RIXxBzNeiY4nr3RSj0p6V0uAyk27kBDJgoSjw==
X-Received: by 2002:ac8:4f13:: with SMTP id b19mr25858680qte.146.1595272619590; 
 Mon, 20 Jul 2020 12:16:59 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id f41sm21133029qtk.55.2020.07.20.12.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 12:16:59 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:16:56 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200720191656.GA3366@PWN>
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

I made some mistakes in the previous e-mail. Please ignore that. There
are a lot of things going on...Sorry for that.

On Mon, Jul 20, 2020 at 03:12:57PM +0300, Dan Carpenter wrote:
> So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
> the earlier check.  That risks breaking userspace.  Another option is to
> just add a check like you did earlier to the HIDIOCGUSAGE case.
> Probably just do option #2 and resend.

Sure, I will just add the same check to the HIDIOCGUSAGE case for the
time being. Thank you for the detailed explanation.

Here's what I found after digging a bit further though:

hid_open_report() calls different functions in order to process
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

In hid_open_report(), `global.report_count` can be set by calling
hid_parser_global().

However, the syzkaller reproducer made hid_open_report() to call
hid_parser_main() __before__ `global.report_count` is properly set. It's
zero. So hid_register_field() allocated `field` with `values` equals to
zero - No room for value[] at all. I believe this caused the bug.

Apparently hid_open_report() doesn't care about which item (main, local,
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
