Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF51C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 10:57:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF68D2064B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 10:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsr75AZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF68D2064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E6712313D;
	Tue, 28 Jul 2020 10:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xEnk2hCkkIda; Tue, 28 Jul 2020 10:57:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E590226B0;
	Tue, 28 Jul 2020 10:57:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95744C0050;
	Tue, 28 Jul 2020 10:57:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C825C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B53285E03
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjzzIpQh_iyR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:57:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 244C085308
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 10:57:08 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x69so18186498qkb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 03:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PKpPhJ/w2GiNhEhskYD8enl5OSzPCcoSE92NGXtE9Co=;
 b=Gsr75AZeO2mW9mP9ZFCQZ5QsL36RLPgDfMjW1uX1P77lexXYNMe4Z8zLnqIN2lDZhe
 ldrfK+8GVqwp/pjVGMAovAU/tFwpKqNmWZuAdYmlRc9gmfXs+sdAf80Oui+iOeNv3aV2
 w+udDAII3pXeTGEHlcrnd4BwZ6jlR87XI1ls19VDDG0MTIKPNiue58rkusY3gPJOAgA4
 ppWY5szqIXHYTP42ed/f/g+nmfijcDSntIuxyCzyNrOGum8/Brbri6XIHqDQkxlg5pRz
 4c8SCSLj+2jT/yQvbODkaj/caP4bRVHQURHokDzSO8JhOiSwEnsto9J/33bLVbyr/Z0J
 RVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PKpPhJ/w2GiNhEhskYD8enl5OSzPCcoSE92NGXtE9Co=;
 b=cLnKA8+PCkwy5H9jBa96NVzdX5vWpV4QjDn+huNis0YOLGfo29rDBd0AElzdEPOSNJ
 uBdvzJadcy77qYByjNv4czhQjpZ6ulOgRaqQQ3nVJvY9Is4K33gaVaX7UdWjoqeNcGW5
 u6aldfiEBgRVLQnoKnLpbPTICYgthD1B2T3Cdr3IWmbzgCL1bJLXfB4SIJbI2pxUmChf
 L8HmjnY7iE8Nkr0jcXkUTdxiZE7ocpYlWmeiEHWfRyjdf3ejLmqeGFIb73bbengbBM0Q
 xH24zcXeeEwy4S8pq+TboDGuIhmjL96GnDy5sowR5LNwSzUcNzt0YS7HEW32VZoGPto5
 CylA==
X-Gm-Message-State: AOAM530tlMnwHR2RhMwqNXENvfXoNdMHslu7DaMM28IglCiAColujwGZ
 mHR7O8KOeN7d1nfTD67KSQ==
X-Google-Smtp-Source: ABdhPJzxukcAkN7Hiz1CswGMnF8kg+I/3ierdX9iaW+x9qyCpsgkMZvkdNZSFgSwbH52ZIyJVlZjdw==
X-Received: by 2002:a05:620a:65d:: with SMTP id
 a29mr14815054qka.167.1595933827048; 
 Tue, 28 Jul 2020 03:57:07 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id u37sm4606954qtj.47.2020.07.28.03.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 03:57:06 -0700 (PDT)
Date: Tue, 28 Jul 2020 06:57:04 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200728105704.GA407553@PWN>
References: <20200727210235.327835-1-yepeilin.cs@gmail.com>
 <20200728084137.GC2571@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728084137.GC2571@kadam>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>, linux-scsi@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, megaraidlinux.pdl@broadcom.com
Subject: Re: [Linux-kernel-mentees] [PATCH] scsi/megaraid: Prevent
 kernel-infoleak in kioc_to_mimd()
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

On Tue, Jul 28, 2020 at 11:41:37AM +0300, Dan Carpenter wrote:
> On Mon, Jul 27, 2020 at 05:02:35PM -0400, Peilin Ye wrote:
> > hinfo_to_cinfo() does no operation on `cinfo` when `hinfo` is NULL,
> > causing kioc_to_mimd() to copy uninitialized stack memory to userspace.
> > Fix it by initializing `cinfo` with memset().
> 
> But "hinfo" can't be NULL so this patch isn't required.  It's a bit
> hard for Smatch to follow the code.
> 
> We know that "opcode" is 82 so the buffer is allocated by mimd_to_kioc()
> -> mraid_mm_attach_buf().

You are right. mraid_mm_ioctl() returns -ENOMEM and never reaches
kioc_to_mimd() if mraid_mm_attach_buf() failed to get a buffer, so
`hinfo` can never be NULL for kioc_to_mimd().

Next time I will trace the data flow more carefully. Thank you for
pointing this out!

Peilin Ye

> Generally, don't silence static checker warnings unless it makes the
> code more readable.  It's the checker writer's job to fix their own code.
> In this case, that's me, but parsing the code is quite complicated and I
> don't have a plan for how to fix it.
> 
> regards,
> dan carpenter
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
