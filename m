Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594BEC32796
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 16:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88D2829BB;
	Wed, 24 Aug 2022 16:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D88D2829BB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c9jHP3iw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhpdKg4Qi2Ef; Wed, 24 Aug 2022 16:56:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0A28882965;
	Wed, 24 Aug 2022 16:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A28882965
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3E4DC0033;
	Wed, 24 Aug 2022 16:56:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C914C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 16:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11D82416CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 16:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D82416CD
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c9jHP3iw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwbQxf45bAJD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 16:56:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0449441558
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0449441558
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 16:56:05 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id y17so5310349ilp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=oLveuyfvOYuaw06GYMOw+ZeCVcoEAdv4UZbUS0ysFDA=;
 b=c9jHP3iw+q84+psn4+imRWQPyMMtCA6zdmTsSCISMsQqnhcjJ/3BpC1yliL+PlRJ61
 pLwTpVpFl8yPGrIzRomDZRgQMQCit8yGOxkrCQdF+ykfniNv3aLbvMVk2JyyqeYlVkzN
 oj8MxEoIW0P4t7YKHR9DSjyDRr7t9/uyB1cGQIiLO4UH5RilwJlbuu9JoPEYHi2GIGcD
 4IywnpJWzOF9IVfMKtmhW+6z+tzuGGTjOq4l5pyBnWrXVxej6fxD7kRfzp5MpMfFbhiS
 KV2kBWSHdyGk0/NS9NkM/BjfYm8ENDr7Smb57yDSHZjo7EvKLzznajJuokCBAdbmGQHf
 wHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oLveuyfvOYuaw06GYMOw+ZeCVcoEAdv4UZbUS0ysFDA=;
 b=Rm48SjD3d27ltfETeCFSNlHqIWwaI+OCVA0VA4KgRET6HS5UlnRFSV5T973yI6FPI7
 KUYtWtWH8tPtbIOVUuA3VqrUaP0DgBxBkqLi0iSfiKmgh2QG1svlh4R1qLbXD6S4u/Q6
 IbsmnOF9PZONMx0oARZ0JsHcAAcil8uTmHIYUFGaCGUKMnW9GRri7DEXgc6X1N+SvOWr
 8xhBBNAk5p0fGU1sL8Q/wyIxyw6WOZUzGfLMDPs2b1pdzoExsynwHRerXXiPhFEsN3KM
 L6DfKhk4OD3hOJDkyo5iDHqyZ1zGKIxdK1YW+DU42t2SAYOpg+W0DKiBYWeznCYD2H0a
 gIUA==
X-Gm-Message-State: ACgBeo3Nl7rHQo4feyPpkl4gSS8Lhr/0kah40IYm3dLHHJBIm8u/gn4f
 D0Lbqb9w4zvZizWr6fxcvlVWwETU5Xa3jbk3E/Q=
X-Google-Smtp-Source: AA6agR7LGjMyFyYuYrqaRzu4thdoenEA2+VIzc7P/z85FxocSwqE5bDd1jdDVHDQvzDQSnH3zoFCHADJGOI7kiSypjI=
X-Received: by 2002:a05:6e02:20c1:b0:2e9:f747:ad54 with SMTP id
 1-20020a056e0220c100b002e9f747ad54mr2777742ilq.144.1661360165111; Wed, 24 Aug
 2022 09:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130702.10912-1-khalid.masum.92@gmail.com>
 <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
In-Reply-To: <YwY4cVdB3tVVMIqJ@rowland.harvard.edu>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Wed, 24 Aug 2022 22:55:54 +0600
Message-ID: <CAABMjtFjt-j2AUiqWZf-vK9LL0067VCHY=oLha6e0k-Dt6Sbgg@mail.gmail.com>
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
> On Wed, Aug 24, 2022 at 07:07:02PM +0600, Khalid Masum wrote:
>
>         ep = &udev->ep0;
>
> with no need to check for NULL.

Thanks, I shall send a v2 with this change.
> Alan Stern

-- Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
