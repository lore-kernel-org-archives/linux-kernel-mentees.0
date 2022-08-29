Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0ABECAAD5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Aug 2022 10:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3FCD40BE8;
	Mon, 29 Aug 2022 10:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3FCD40BE8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HTMjuFBy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id noArhQLas7ee; Mon, 29 Aug 2022 10:32:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 893E940A35;
	Mon, 29 Aug 2022 10:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893E940A35
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63AFDC0032;
	Mon, 29 Aug 2022 10:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63363C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FED340B05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 10:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FED340B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxcUbExif3Og
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 10:32:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EEF940A35
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EEF940A35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 10:32:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94D70B80E69;
 Mon, 29 Aug 2022 10:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60AAC433D6;
 Mon, 29 Aug 2022 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661769132;
 bh=TR5k2Yh8gwGWFbzhitEfL7Rh1/zEpiSLk+TrzVaWXOI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HTMjuFBy6+vGraHsxJBXt61FOrZE16rCSuDIX7J9zsNP2dAfbVPhBN2fCuk+cUc6p
 XzIGM35vwf3hugYZM/x+xlkdAOEEgAQQymtIi+eiuEszD0cssDnMZ6EBKOJpy64nyw
 VZocptAW0fki4n5/eIVIPYhc+LchLbDuMu7IXvxjqfi2PHHHbFreCrgxkZesagAzqD
 02vg4VIaL/JIfX8D+TgaSN/MQmVD1CpDflxZSBDbXeGX5/S7Tvi39cnVClOUyeiAvH
 RCfc3377H6dALCZXOiswrcwKSUxQZffetMqzbCnn4umcysouB99Bq7hc5i6FfBwqt4
 bQ5uw3PFBmo8w==
From: Kalle Valo <kvalo@kernel.org>
To: Mazin Al Haddad <mazinalhaddad05@gmail.com>
Subject: Re: [PATCH v3] ar5523: check endpoints type and direction in probe()
References: <20220827110148.203104-1-mazinalhaddad05@gmail.com>
Date: Mon, 29 Aug 2022 13:32:06 +0300
In-Reply-To: <20220827110148.203104-1-mazinalhaddad05@gmail.com> (Mazin Al
 Haddad's message of "Sat, 27 Aug 2022 14:01:49 +0300")
Message-ID: <871qszibmh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, edumazet@google.com, pontus.fuchs@gmail.com,
 syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

Mazin Al Haddad <mazinalhaddad05@gmail.com> writes:

> Fixes a bug reported by syzbot, where a warning occurs in usb_submit_urb()
> due to the wrong endpoint type. There is no check for both the number
> of endpoints and the type.
>
> Fix it by adding a check for the number of endpoints and the
> direction/type of the endpoints. If the endpoints do not match -ENODEV is
> returned.
>
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 1 PID: 71 at drivers/usb/core/urb.c:502 usb_submit_urb+0xed2/0x18a0 drivers/usb/core/urb.c:502
> Modules linked in:
> CPU: 1 PID: 71 Comm: kworker/1:2 Not tainted 5.19.0-rc7-syzkaller-00150-g32f02a211b0a #0
> Hardware name: Google Compute Engine/Google Compute Engine, BIOS Google 06/29/2022
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  ar5523_cmd+0x420/0x790 drivers/net/wireless/ath/ar5523/ar5523.c:275
>  ar5523_cmd_read drivers/net/wireless/ath/ar5523/ar5523.c:302 [inline]
>  ar5523_host_available drivers/net/wireless/ath/ar5523/ar5523.c:1376 [inline]
>  ar5523_probe+0xc66/0x1da0 drivers/net/wireless/ath/ar5523/ar5523.c:1655
>
> Link: https://syzkaller.appspot.com/bug?extid=1bc2c2afd44f820a669f
> Reported-and-tested-by: syzbot+1bc2c2afd44f820a669f@syzkaller.appspotmail.com
> Signed-off-by: Mazin Al Haddad <mazinalhaddad05@gmail.com>

Has this been tested on a real ar5523 hardware?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
