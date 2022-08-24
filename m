Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FD0C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 17:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C5340585;
	Wed, 24 Aug 2022 17:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C5340585
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FqtlcR6P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CyT7ZvcfUm31; Wed, 24 Aug 2022 17:57:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B794400EC;
	Wed, 24 Aug 2022 17:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B794400EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4EAA4C0032;
	Wed, 24 Aug 2022 17:57:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14A62C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 17:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E838A40585
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 17:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E838A40585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvv1NXubUKUS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 17:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 587D0400EC
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 587D0400EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 17:57:37 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id d6so7832019ilg.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+VXhj0+Ay3TZpIZhOIKirdlUbEchMg+eeIoWbSwLaMQ=;
 b=FqtlcR6PHeQ8FbGlZamnZDydsLfqdO3pLGS+vY127CjFh6hz/qgMoQMaQ8HBZy6ipD
 Q59V6mtCFsldEsyndmhrSkNtCRhzSLGpQCWcnQhRMlzITXNnBdeDKq9GtPjqHVm0w6Ec
 1nwsRXlq49OgoxJIAWfpeUqG6t0NX1f8uRkKPwFHUNYsgQhQfZgnBFzalBgtXwrH2fUU
 pPY0pYK5Ydml35/Yuunds+vQua/f8U+jGONJ9fCQmpcJ96UNTBKbbWNzkzaHIPNlaLd7
 90JHi+AAih6FCyRY7qjULGx/1o68eov03pnTZRYo0qThVwMtyKcPWXe7yYwKp7+M1Vi2
 hnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+VXhj0+Ay3TZpIZhOIKirdlUbEchMg+eeIoWbSwLaMQ=;
 b=IQdSQk5o+bD7Jvh+PrIG87Y+LlgQZmEzOs/MUy2OXXRUDkc9cRDl7hiL7qMiMIs1XR
 wrGHjZZIJupsalATTLX988VOsQkLNqLg8vSnSF3cmhb/zKbHhyDBm7CajAotuGaWEZQB
 OEKUXmgvo4HYoE0K+hQof8obWXA9wa76U1bhDO04ThhLRWDfW0aeVjDmPTfujSRiNWKj
 6Y7vDG8nxbukerrDABC+czf6IqnolY57tka6tKbgY1U1831g2mAQDAJ0bYhsKltMqyo5
 dm3fD9hfKi8ilaHAWC83IFtfr150et0KfmvEl6UBw1avndLwGHawrR59lx/v90b4p3hU
 MTlQ==
X-Gm-Message-State: ACgBeo3Umq5Iy6xnlloRvRZnVjItRWiMzPebBXbgzOQ+q28Y8dJgi1d2
 XxYsu56e2hwFkJOa7V7QPqIQq8GzeHa+3Dm6Z4k=
X-Google-Smtp-Source: AA6agR5sKcUgOKHc8NyRxfYOHRnWRzz6vHXZxz1MTlpe6CuP8vult6tat6rs88BXsF3sGnLkPhYCTnVAukbOwWMzw7I=
X-Received: by 2002:a05:6e02:20c1:b0:2e9:f747:ad54 with SMTP id
 1-20020a056e0220c100b002e9f747ad54mr118567ilq.144.1661363856349; Wed, 24 Aug
 2022 10:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130702.10912-1-khalid.masum.92@gmail.com>
 <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
In-Reply-To: <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Wed, 24 Aug 2022 23:57:25 +0600
Message-ID: <CAABMjtFEfgQtcGKLkd=whFN=WHUywTg=fDAxRQ+zKLiqOFhvQg@mail.gmail.com>
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

On Wed, Aug 24, 2022 at 8:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
>
> Even this is awkward.  It's silly to look up the endpoint in a table
> when you already know that it is endpoint 0.  Just do:
>
>         ep = &udev->ep0;
>
> with no need to check for NULL.

After further checking, I realized that  usb_device udev is created by
ehset_single_step_set_feature and depends on usb_hcd and port. So I do
not get why the endpoint is at udev->ep0. Can you help me with this?

-- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
