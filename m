Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B41EC48BE4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 20:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA32F40AD9;
	Wed, 24 Aug 2022 20:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA32F40AD9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ACOE4tdb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1j5N1saiLmb4; Wed, 24 Aug 2022 20:37:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BF095401C2;
	Wed, 24 Aug 2022 20:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF095401C2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91C03C0033;
	Wed, 24 Aug 2022 20:37:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07636C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4F4341756
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F4341756
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ACOE4tdb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTsZcNiB5SgD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:36:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9595B41739
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9595B41739
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:36:58 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id 62so14363810iov.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=o/Asl1a05iqi7M0+s6lqc9+F54rnbn8OzEyUZOMsiEo=;
 b=ACOE4tdbDMngehxmTvG7PfhPyErgshLWF2bCW4RnDsuQ7be+urtFNkb26DfVKfZ3PT
 AgCY5atQiy/sHku6wYUM4pmUgguac4Vj8HEsGyYBoI6maLLs4fWCraooOpRze+S7+wFs
 c/LpcvOzINAL199TDGIyj3RkX/+ovAWsl3MLZ6ByLTZrI94wy28EoxKN1w86wiK27ZJz
 AzRB2/8Usba3V1eDyfy/jyVJXUHSBeyRRvPtjxZzQ12BfoNs1IvD/0EawRvNrOthyeqA
 y5HAMp6O6awJ3tgJcOsgGjUaCWcipQcsMrbLpgKBqQEndD32gtdBUP9M91U/8lb/BBjb
 2M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=o/Asl1a05iqi7M0+s6lqc9+F54rnbn8OzEyUZOMsiEo=;
 b=fds5h/VgN7fivf5TAIh2KeQXsHOx1Bz3JUtp/nTJicWUWpQiNY0rKZOe0e4Ela4De4
 IE19DY6M+dZrnicZi6tAROtgaOQ0OGUGwh4F6vfuzzdS3AFnb7k87BIsvYl/yecQeoj4
 iOelNxAeXQ/xx3m2v2IZ3LE4RirNlNKlZx/jMhFrJnTR7jcNOOO6qyqF8rjaFYJJZdDR
 sr/xheTcnWt5MRT/y+4134JR2Bb2kW+o6/xIYdXBVtBKKZPXJsqFCYz30za+7gR41/2Z
 caIF2dTOGNB2ABdfmCpYETtmzvI6+4GmvaCGNc0OSh5rrRKynNoHoOlHfo0uD25dAJQq
 4cyw==
X-Gm-Message-State: ACgBeo3tC+8iAOUJ3hS9GE/vEJObbBzTmpM/06UNw62DxuTc4Ngo0NwL
 YbKDH+knCQ4zhcnigezgO4OMjTiDhDppqBjxJGc=
X-Google-Smtp-Source: AA6agR5DpOdPAD6gzya2ULpmA8X/Zi+Fwz8OwSAK60RpbZt56iF4Bnkf57ojFhAkTDkU1BJ5xvQ+AagsIyTeZ9xAKVY=
X-Received: by 2002:a6b:5f08:0:b0:688:9846:2f61 with SMTP id
 t8-20020a6b5f08000000b0068898462f61mr290298iob.65.1661373417623; Wed, 24 Aug
 2022 13:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130702.10912-1-khalid.masum.92@gmail.com>
 <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
 <CAABMjtFEfgQtcGKLkd=whFN=WHUywTg=fDAxRQ+zKLiqOFhvQg@mail.gmail.com>
 <YwZ6/qkEAk8867qh@rowland.harvard.edu>
In-Reply-To: <YwZ6/qkEAk8867qh@rowland.harvard.edu>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Thu, 25 Aug 2022 02:36:46 +0600
Message-ID: <CAABMjtH8WqoraFLQ=-TTwah=A+PRjRjJ2hS-ySK_5h9qYyy8Sg@mail.gmail.com>
Subject: Re: [PATCH] usb: host: Use helper function to get endpoint
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Matthias Kaehlcke <mka@chromium.org>, Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Thu, Aug 25, 2022 at 1:24 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> udev is not a usb_device structure; it is a _pointer_ to a usb_device
> structure.  The pointer is created when ehset_single_step_set_feature()
> calls usb_hub_find_child(), but the structure itself gets created long
> before that, when the USB device is first detected and initialized.
>
> You can see this happening where hub_port_connect() calls
> usb_alloc_dev().  The ep0 field is filled in by hub_port_init() and the
> routines it calls.
>
Thanks for clarifying this. That helps a lot.

-- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
