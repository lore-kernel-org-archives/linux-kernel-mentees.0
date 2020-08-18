Return-Path: <SRS0=9k96=B4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1422BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 10:00:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FE720786
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 10:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3C8yFsQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FE720786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8D431203A6;
	Tue, 18 Aug 2020 10:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V39Fs9fq6Hkt; Tue, 18 Aug 2020 10:00:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 374F02039D;
	Tue, 18 Aug 2020 10:00:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17F0FC07FF;
	Tue, 18 Aug 2020 10:00:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8E0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 10:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4F1602039D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 10:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2n9SG9WpFjn4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 10:00:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 64D522012D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 10:00:18 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g33so9527750pgb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OOenSclepS0MABruprKXkVZk2CmkqltRlMtrV3FqKk0=;
 b=c3C8yFsQurPTAqZp5ro2DQU9RyvdO3D6JEMGO6BND1O8fmHvaNLwU0BXpPovPyleiI
 +vXOUOIV5DPz3DG4vLwFMIsz6T+xgq2IwLiRgPhPy4d8v9wY4s62RXr9TvMn8LmGjuTS
 f+SrIXoOW/F3EGG9vAeSK0TtVfVl2PQJIy/QrFu2HVHmqlOjlGQJXUOskcapulDRaI5O
 a6gAL2n/0Avbc9kKN1Zn/lYdzgZufygWn6HNwT4RXxKrxX39/OepzkCw8LKuyhlTdtGm
 XHC5by/+f1aRJKJaqbbQrRwpDZi5tLFx1hcZsiLUBqiS3xHFUykRSDW0dj7Axmyx3f+k
 JXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OOenSclepS0MABruprKXkVZk2CmkqltRlMtrV3FqKk0=;
 b=FM7XxT9qE1ptnHNowMejYCBZkWuJlqr8PaJjwJY1vHIOFQwtNnlgebfpQH7Yz//pRv
 hdlx3TEVBryuCqiIXzEOo82X9Hyqqvuu4OFjB75bhwt82Ido52v3FPcBPUjEVq9HFUO2
 BZpWssUVeGQOmBNnIFex2EgEhuS2dIUBU3m/2pCvuM5Q7arF+ZFizgY1Vhx/zFiTPt84
 DHVZ6m/asb9C5riMPoca5iyr6mo7QANFgGTjVfDZMwq+c9kMNHpYSV/U8TrCodP21ob/
 eUCznKTdSuBdysQP94LCj314neqgyzG/HInU6qteFszuhpL3UM31AZxckCSrfXG9z1G0
 6MUg==
X-Gm-Message-State: AOAM532Arc+SfzmFYj59SEjNT5RM8f/1SqTJYvRoDuTg6xD5Rmc+DbWD
 Kqeox8ouBlDABFu7mq3STg==
X-Google-Smtp-Source: ABdhPJw8bM1oYpBq691mtUzOLfn8tTF4UwM50ybp3c0lFYLllJw5jJLjkMd01hKUBOnsJZw5Rm1Xig==
X-Received: by 2002:a62:1ad0:: with SMTP id a199mr15047482pfa.56.1597744818002; 
 Tue, 18 Aug 2020 03:00:18 -0700 (PDT)
Received: from PWN ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id j5sm24157839pfg.80.2020.08.18.03.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 03:00:17 -0700 (PDT)
Date: Tue, 18 Aug 2020 06:00:08 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Message-ID: <20200818100008.GA2135@PWN>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200729113712.8097-1-yepeilin.cs@gmail.com>
 <nycvar.YFH.7.76.2008171221290.27422@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2008171221290.27422@cbobk.fhfr.pm>
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 RESEND] usbhid: Fix
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

On Mon, Aug 17, 2020 at 12:21:41PM +0200, Jiri Kosina wrote:
> On Wed, 29 Jul 2020, Peilin Ye wrote:
> 
> > `uref->usage_index` is not always being properly checked, causing
> > hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> > 
> > Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >     - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
> >       Dan Carpenter <dan.carpenter@oracle.com>)
> 
> Applied, thanks.

Thank you for reviewing the patch!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
