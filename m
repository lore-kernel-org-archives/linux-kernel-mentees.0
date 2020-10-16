Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7843AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 13:46:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A233C20848
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 13:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvB1Qw9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A233C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1875F8892E;
	Fri, 16 Oct 2020 13:46:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRvbztTNkPML; Fri, 16 Oct 2020 13:46:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D70F88931;
	Fri, 16 Oct 2020 13:46:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42564C0052;
	Fri, 16 Oct 2020 13:46:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B2A7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1EC6020381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ee0cox2X8Xf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:46:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 69B70204B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602855969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBkmfVKFUnX5xElt1PEiALSx4k9GdQ5Cn3Wc4nFWM/A=;
 b=ZvB1Qw9iD6pM5SrY0oQuHQ4juuMvnlC6/TUdSiKyBenMyQ6PxJXC06qSbsj/FwPFWXUBEC
 GQvCbAZvXuQC/spwJgDH+Wwv+UtSOKM+Av0YHfp0fyz3ZEdRlg97c3597etHAlMZEEDnKl
 wPBfnri39wD3fAdQZit6mG0r5L8Ab5Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-izw68r-wOvy-mYtWitpHMw-1; Fri, 16 Oct 2020 09:46:07 -0400
X-MC-Unique: izw68r-wOvy-mYtWitpHMw-1
Received: by mail-ed1-f70.google.com with SMTP id a73so1130736edf.16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 06:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBkmfVKFUnX5xElt1PEiALSx4k9GdQ5Cn3Wc4nFWM/A=;
 b=fKWFofYCrX/uE7YoDmbsqltKfw0WIuP/MWpU1dto1sLHzDWI8bJOXTXfAKOYDrVNba
 iWbwfZNF7GjMRoOieLWRd9KYC7cp06R6I6QfRX5LYd+Yb7yxveDsFZf5HVJ/7WkP1P0+
 GWiAU2BXZIs6WuLu1Av1hMdlLcBIw8CYQw4vKSEQzMCUk6ZZZCVTD6GCw0Z/odZhUPsk
 09BG03HRcVh/zEeJbhAMyjbRYnuwUREIMKFg/Dl1YLFVY2mk+Qnh4scI7mtDT2G3lo6M
 ZBleRbNrKBjbGQ1bGpJGX/RtVnL3e0Z5g4gsh9TtE7YjtM+0WLDbosR+bG5OQROTqPfD
 Kj9A==
X-Gm-Message-State: AOAM5318I8QTCTUgbcgRn7HrkyEGGnMpfRU2tnbe9b1h7GybhiJpnpK2
 zCuzgRchm6nNooQ9TWlefvQPqwGlEbpy4X3U/94mLFMIyCbo9Q0jaq1C+ktRyrYjXD5wuow0toQ
 dFIzYafz4gEgfkZBsc/xDrfxl8B2MpVIv1/NCthMFYwJOoEUX
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr4082415eds.4.1602855965772;
 Fri, 16 Oct 2020 06:46:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoTKG3QkQnEG+dV1fqpaabEFbYfbCMpVfWd6lV/nX6eaobQnpr0Pvxj+wUvOMcqXuRRZkm+A==
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr4082398eds.4.1602855965625;
 Fri, 16 Oct 2020 06:46:05 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id ck19sm1639662ejb.99.2020.10.16.06.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 06:46:04 -0700 (PDT)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
References: <20201016131447.32107-1-anant.thazhemadam@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <df841745-8537-c21e-2a2d-b9c5c2dae800@redhat.com>
Date: Fri, 16 Oct 2020 15:46:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016131447.32107-1-anant.thazhemadam@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-bluetooth@vger.kernel.org,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5] bluetooth: hci_h5: fix memory
	leak in h5_close
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

Hi,

On 10/16/20 3:14 PM, Anant Thazhemadam wrote:
> When h5_close() is called, h5 is directly freed when !hu->serdev.
> However, h5->rx_skb is not freed, which causes a memory leak.
> 
> Freeing h5->rx_skb and setting it to NULL, fixes this memory leak.
> 
> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>

Patch looks good to me now:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> Changes in v5:
> 	* Set h5->rx_skb = NULL unconditionally - to improve code
> 	  readability
> 	* Update commit message accordingly
> 
> Changes in v4:
> 	* Free h5->rx_skb even when hu->serdev
> 	(Suggested by Hans de Goede <hdegoede@redhat.com>)
> 	* If hu->serdev, then assign h5->rx_skb = NULL
> 
> Changes in v3:
> 	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
> 	* Do not incorrectly and unnecessarily call serdev_device_close()
> 
> Changes in v2:
> 	* Fixed the Fixes tag
> 
> 
>  drivers/bluetooth/hci_h5.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index e41854e0d79a..0ef253136b06 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -245,6 +245,9 @@ static int h5_close(struct hci_uart *hu)
>  	skb_queue_purge(&h5->rel);
>  	skb_queue_purge(&h5->unrel);
>  
> +	kfree_skb(h5->rx_skb);
> +	h5->rx_skb = NULL;
> +
>  	if (h5->vnd && h5->vnd->close)
>  		h5->vnd->close(h5);
>  
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
