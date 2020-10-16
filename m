Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CCDC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 11:28:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC23F207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 11:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SDLmcbYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC23F207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F1E6388BB5;
	Fri, 16 Oct 2020 11:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iT4ij1id1Q8a; Fri, 16 Oct 2020 11:28:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4036C88BEF;
	Fri, 16 Oct 2020 11:28:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BACDC0052;
	Fri, 16 Oct 2020 11:28:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA719C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9E1F02E70A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPKW8mROISIV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:28:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id DD17E20349
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602847707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uncw1p8wEaEZ4da7CrqyMdu3Pcg9RwYIjaA2lxjM3PI=;
 b=SDLmcbYpoLpj9rL2a/v2ATeG/yrbjsYpg8waXYjNLbUuQ6PxRAysm3GBGJnl/jsF7CYJoE
 Po2dkmi47upUtvnXcVsLuM1GDdWeTZsDwJYV7o5mkM+SlwwXq1OQf+AYVAW0uYAFg8I6Jr
 Ak6b2AQbfMnPXAUxAcKT+EcfsH2pXXE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-WqXn8OT4MwyhgaT4pJIWGA-1; Fri, 16 Oct 2020 07:28:25 -0400
X-MC-Unique: WqXn8OT4MwyhgaT4pJIWGA-1
Received: by mail-ej1-f70.google.com with SMTP id j2so797667ejm.18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 04:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uncw1p8wEaEZ4da7CrqyMdu3Pcg9RwYIjaA2lxjM3PI=;
 b=WZwZH0N1ekJA8XHY8wvkkSi8qkAmiQADDkcFgFkMUG8MifZuxPCJ9333vnWob46WnH
 T2ONSX1LT+IeJ9EMYRq3aBOqQd6HxbHufRdboir+Lttl1Nvjtwa6DcY1TR9cvkRx0Rza
 50Wd0g+LL8JpVJIgxYWZsCna4YWmS3fjvP14rghXhrbsp0tBZelS7mUg/toQNv5m4vPQ
 pgG1ATeDblMW9YWgo0GOPBxd+HHjicsUajAc2Nvyv82Bv08rs3gWKQOYXGnq8JAYGVBf
 fliye5YzJJrEyZVuWDWhxbUYpQajvSaJQfakg18rSEpM9yNoECxscVrDnjEoXfAfTKNT
 p76w==
X-Gm-Message-State: AOAM532Kdqw8/zk0HbmluYfyi4RHZ5bPai0jscYQTE36ZbxKEZmbtjQt
 YGDi0sQoAk3pav/2et0fuh5zhQj24YqW59CGY2qqRfImgxlp09esfM2NvMuQ9FZdVv+DV9sjNIe
 TxO81LCB6IrlyhGHRfIdRF+eCnkRD+gZMomCnsE00ivFZKqmF
X-Received: by 2002:a17:907:43c6:: with SMTP id
 i6mr3108675ejs.207.1602847704563; 
 Fri, 16 Oct 2020 04:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxafcuee0i5hxOgusCBNcMWWy78Vr/YlDZ8KxL6yLiWe2S8E6BQLTMsRHYg7w1v3h++iMg/pQ==
X-Received: by 2002:a17:907:43c6:: with SMTP id
 i6mr3108655ejs.207.1602847704363; 
 Fri, 16 Oct 2020 04:28:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id i5sm1335818ejs.121.2020.10.16.04.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 04:28:23 -0700 (PDT)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <20201007034803.7554-1-anant.thazhemadam@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2a79ece2-c63b-a881-bc19-65b59952344f@redhat.com>
Date: Fri, 16 Oct 2020 13:28:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201007034803.7554-1-anant.thazhemadam@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4] bluetooth: hci_h5: fix memory
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

On 10/7/20 5:48 AM, Anant Thazhemadam wrote:
> If h5_close is called when !hu->serdev, h5 is directly freed.
> However, h5->rx_skb is not freed, which causes a memory leak.
> 
> Freeing h5->rx_skb fixes this memory leak.
> 
> In case hu->serdev exists, h5->rx_skb is then set to NULL,
> since we do not want to risk a potential NULL pointer 
> dereference.
> 
> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>h5_close v4
> ---
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
>  drivers/bluetooth/hci_h5.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index e41854e0d79a..39f9553caa5c 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -245,11 +245,15 @@ static int h5_close(struct hci_uart *hu)
>  	skb_queue_purge(&h5->rel);
>  	skb_queue_purge(&h5->unrel);
>  
> +	kfree_skb(h5->rx_skb);
> +
>  	if (h5->vnd && h5->vnd->close)
>  		h5->vnd->close(h5);
>  
>  	if (!hu->serdev)
>  		kfree(h5);
> +	else
> +		h5->rx_skb = NULL;

Please just do this unconditionally directly after
the kfree_skb()

So after this comment has been addressed the end result should
look like this:

	skb_queue_purge(&h5->rel);
	skb_queue_purge(&h5->unrel);
	kfree_skb(h5->rx_skb);
	h5->rx_skb = NULL;

	if (h5->vnd && h5->vnd->close)
		h5->vnd->close(h5);

	if (!hu->serdev)
		kfree(h5);
 
 	return 0;

Regards,

Hans

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
