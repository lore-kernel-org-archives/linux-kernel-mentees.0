Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FE9C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 18:08:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040D02065C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 18:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7TMauH/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 040D02065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D22A2878A6;
	Sun, 26 Jul 2020 18:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iTdHNTS7ZJ8Q; Sun, 26 Jul 2020 18:07:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 625CB87677;
	Sun, 26 Jul 2020 18:07:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46B37C004F;
	Sun, 26 Jul 2020 18:07:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5C0FC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD4E2878A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9whaFGpyLLz1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:07:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B71DD87677
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:07:56 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id s23so10581961qtq.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7QCobyC2ItfhaGKp9vOhyilsu/vFD41abiIi+idKUH4=;
 b=V7TMauH/w1Ana1kFtHdtvCoOzYrzEicGu1Y7VQh+OX3RqgbbGWUHjJE7KhUY4Jb5Iw
 a+65Vhwltu8vpzbWEN+I1yK0lPn056HV170KEzcbegvE9RjLoU5sXY3fndO2Wq8woeiZ
 +JuaBGuqq2/3Pz1ecRT4b3Kt3CbVKzYTXJFMlqCo2kDilOfdc1p0Hw32zWJp1ejySpyx
 fghCDWp2SwfsXbHL90T0OIVSErQLREljP415kl50bQoX8vrP6Zw5PC1Hhljc4O+X5ljY
 RrRyICT32tUlTSPRMLM4JnP/vJjSFg4o+naE6YvGC1A1YRiIvdMV/6TjgVSl41hPQI9h
 2fkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7QCobyC2ItfhaGKp9vOhyilsu/vFD41abiIi+idKUH4=;
 b=UqRTWk/mS9ETxE9N+eH+fVKYiBwICQybAJ5klP+ofOL1+mzjAUfkwKjurEnjKzX4ws
 IxKdIemMxLStJJ2LauhPXmLLJjkzndPr7hA94NxUzpp+jQcw6qiJ3qV+f75oCfIIN6Bk
 NC9MavEOQRImen5CjKlNrDBv0ymWEDQIFgeimiSAUsfhJU88COmYnBgH6HfvTF3P8srC
 qr1NT0DG2S8ByLMMgeuU22dACJSmkf2ZQNacjisJZhrwyZW8jQmvnhAGOL+bon/yHG1x
 a+UpBfPsUTbZODC6D+M3VLy0j6L7y5SiAjEFi5wUz4Zww+15CoG/BMEdTnRa8USDkoOO
 iG7A==
X-Gm-Message-State: AOAM533f+QY/MNXb8ALi9MtKvUBRDd6OWMKW2/1HUmaTgU0SHU49/Gm7
 JYTSu8DeMDoJnRI68+n1qg==
X-Google-Smtp-Source: ABdhPJzlzTapl0f9uK6uWdZz8aGCLIpRNKb6qZDpaJ4z35xH941T2u8rGNiKrd05M+B8qqVCtQAnhw==
X-Received: by 2002:ac8:47c8:: with SMTP id d8mr17743991qtr.32.1595786875627; 
 Sun, 26 Jul 2020 11:07:55 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id s5sm15852823qke.120.2020.07.26.11.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 11:07:55 -0700 (PDT)
Date: Sun, 26 Jul 2020 14:07:52 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <20200726180752.GA49356@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726173044.GA14755@pendragon.ideasonboard.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs@googlegroups.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vandana BN <bnvandana@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Sun, Jul 26, 2020 at 08:30:44PM +0300, Laurent Pinchart wrote:
> Hi Peilin,
> 
> Thank you for the patch.
> 
> On Sun, Jul 26, 2020 at 12:44:39PM -0400, Peilin Ye wrote:
> > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > it by initializing `vb32` using memset().
> 
> What makes you think this will fix the issue ? When initializing a
> structure at declaration time, the fields that are not explicitly
> specified should be initialized to 0 by the compiler. See
> https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.cbclx01/strin.htm:

Hi Mr. Pinchart!

First of all, syzbot tested this patch, and it says it's "OK":

	https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59

> If a structure variable is partially initialized, all the uninitialized
> structure members are implicitly initialized to zero no matter what the
> storage class of the structure variable is. See the following example:
> 
> struct one {
>     int a;
>     int b;
>     int c;
> };
> 
> void main() {
>     struct one z1;         // Members in z1 do not have default initial values.
>     static struct one z2;  // z2.a=0, z2.b=0, and z2.c=0.
>     struct one z3 = {1};   // z3.a=1, z3.b=0, and z3.c=0.
> }

Yes, I understand that. I can safely printk() all members of that struct
without triggering a KMSAN warning, which means they have been properly
initialized.

However, if I do something like:

	char *p = (char *)&vb32;
	int i;

	for (i = 0; i < sizeof(struct vb32); i++, p++)
		printk("*(p + i): %d", *(p + i));

This tries to print out `vb32` as "raw memory" one byte at a time, and
triggers a KMSAN warning somewhere in the middle (when `i` equals to 25
or 26).

According to a previous discussion with Mr. Kroah-Hartman, as well as
this LWN article:

	"Structure holes and information leaks"
	https://lwn.net/Articles/417989/

Initializing a struct by assigning (both partially or fully) leaves the
"padding" part of it uninitialized, thus potentially leads to kernel
information leak if the structure in question is going to be copied to
userspace.

memset() sets these "uninitialized paddings" to zero, therefore (I
think) should solve the problem.

Thank you!
Peilin Ye

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
