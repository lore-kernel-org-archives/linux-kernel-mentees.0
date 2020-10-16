Return-Path: <SRS0=ah7H=DX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E70DC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 11:56:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B77B2084C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 16 Oct 2020 11:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOYlgsf9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B77B2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 741828835E;
	Fri, 16 Oct 2020 11:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id evVPS+gBDUtS; Fri, 16 Oct 2020 11:56:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C4AAF8823F;
	Fri, 16 Oct 2020 11:56:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7B0BC0052;
	Fri, 16 Oct 2020 11:56:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5651BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 32F982E341
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPPCGrspDHHT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id D1A6020506
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 11:55:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w21so1366215pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b/okKq+QrnT7fTlMYrGGcVP8+PKscOM7yh3Mi27y/zs=;
 b=IOYlgsf9KNrUyOJwzGtbKcoMsIMsV2eVHXbig9OgAsMKW3EmPyHZyoudqDa2PWillZ
 yFjVJYEJBPzlVKpHjjxi8J529CDT5U4Fka/wt76moYKDs9wjRr9xIWQYuXeBSjL1ERDZ
 rOBmOj4RCyIkeMt4uitjWo0+o7i/sDezz7KCsa2yZkDpcj7RpsVIOuE+JzL2pDLbnh0P
 e4x0TtOtHu8mct+A96e2rPmIh7V3hG7dog8WyaZjDY8MaXw/I6B+v9I0YbPAXUBf9nL5
 10iEfziJoaeKmj9CNvRrgL7oNqVixPKVtsqpcJOjUFY1A5B8u7YlNgwLAJr1V61GPI0f
 7b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b/okKq+QrnT7fTlMYrGGcVP8+PKscOM7yh3Mi27y/zs=;
 b=jKcPD+xJvJoOZ+IqP9qXkPww4pUSVtCzWaw+vQ3SMM/fopWsIGlGoMwTrrFU7GYMy4
 6hCv/BymR5LLSNYJCeR1j9GhogJV8LQ3fx2xXc4Xb0/tkgwBypFI8qnSGTjdogkarKWp
 LU4bSk4pGY4wkr++mpIH9jnBXmPAfmVCo3A9LC/G9X5o+su2Gn8CZABVuS7EI1+EnZAy
 z55hRaB7QnpFpDgz2m2eVPuqylwq1s/MICJC0NcJX/sDLCh39P3EW+GBYYyUnCOB89hM
 dCoREcXFDjx3FQDLWzrdmiMcgvdz260G7e+izUyrVOqSb9NMCJzXLq7W0v3UWqzID7D6
 +LiQ==
X-Gm-Message-State: AOAM532aUqRSzz5YUWuuycVaJjHtJBoRtuBpAkyo1nCSmWevxWowmu8V
 nOU+OqFr9CHDxNyPV/6bfhQ=
X-Google-Smtp-Source: ABdhPJx9XTId8G4jOroUkouJ1myNjMhceLg9sCH2ghhRtKnKFo8XiAaa8HSAm7Db8LHqeAFC1SW0Nw==
X-Received: by 2002:a62:16ce:0:b029:155:2e1d:9c06 with SMTP id
 197-20020a6216ce0000b02901552e1d9c06mr3334587pfw.6.1602849358955; 
 Fri, 16 Oct 2020 04:55:58 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.207.75])
 by smtp.gmail.com with ESMTPSA id p12sm2616528pgm.29.2020.10.16.04.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 04:55:58 -0700 (PDT)
To: Hans de Goede <hdegoede@redhat.com>
References: <20201007034803.7554-1-anant.thazhemadam@gmail.com>
 <2a79ece2-c63b-a881-bc19-65b59952344f@redhat.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <dfa15c3a-6081-1072-8c73-ecebc983643d@gmail.com>
Date: Fri, 16 Oct 2020 17:25:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a79ece2-c63b-a881-bc19-65b59952344f@redhat.com>
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

On 16/10/20 4:58 pm, Hans de Goede wrote:
> Hi,
>
> On 10/7/20 5:48 AM, Anant Thazhemadam wrote:
>> If h5_close is called when !hu->serdev, h5 is directly freed.
>> However, h5->rx_skb is not freed, which causes a memory leak.
>>
>> Freeing h5->rx_skb fixes this memory leak.
>>
>> In case hu->serdev exists, h5->rx_skb is then set to NULL,
>> since we do not want to risk a potential NULL pointer 
>> dereference.
>>
>> Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
>> Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
>> Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>h5_close v4
>> ---
>> Changes in v4:
>> 	* Free h5->rx_skb even when hu->serdev
>> 	(Suggested by Hans de Goede <hdegoede@redhat.com>)
>> 	* If hu->serdev, then assign h5->rx_skb = NULL
>>
>> Changes in v3:
>> 	* Free h5->rx_skb when !hu->serdev, and fix the memory leak
>> 	* Do not incorrectly and unnecessarily call serdev_device_close()
>>
>> Changes in v2:
>> 	* Fixed the Fixes tag
>>
>>  drivers/bluetooth/hci_h5.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
>> index e41854e0d79a..39f9553caa5c 100644
>> --- a/drivers/bluetooth/hci_h5.c
>> +++ b/drivers/bluetooth/hci_h5.c
>> @@ -245,11 +245,15 @@ static int h5_close(struct hci_uart *hu)
>>  	skb_queue_purge(&h5->rel);
>>  	skb_queue_purge(&h5->unrel);
>>  
>> +	kfree_skb(h5->rx_skb);
>> +
>>  	if (h5->vnd && h5->vnd->close)
>>  		h5->vnd->close(h5);
>>  
>>  	if (!hu->serdev)
>>  		kfree(h5);
>> +	else
>> +		h5->rx_skb = NULL;
> Please just do this unconditionally directly after
> the kfree_skb()

Could you also please tell me why this might be necessary?
The pointer value stored at h5->rx_skb would be freed anyways when we free h5 (since rx_skb is
essentially a member of the structure that h5 points to).
Also since we're performing the *if* check, the *else* condition wouldn't exactly be taxing either,
right?
Is there some performance metric that I'm missing where unconditionally setting it to NULL
in this manner would be better? (I couldn't find any resources that had any similar analysis
performed :/ )
Or is this in interest of code readability?

Also, how about we introduce a h5 = NULL, after freeing h5 when !hu->serdev?

Thank you for your time.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
