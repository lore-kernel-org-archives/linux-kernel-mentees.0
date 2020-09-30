Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C9FC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 04:02:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713712087D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 04:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOUG2k8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713712087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBA188680F;
	Wed, 30 Sep 2020 04:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxQHB5Pkk0mr; Wed, 30 Sep 2020 04:02:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D80F867F8;
	Wed, 30 Sep 2020 04:02:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83D96C0890;
	Wed, 30 Sep 2020 04:02:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C34CC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 04:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 019CA86078
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 04:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dk03sJiS6lmB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 04:02:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7127586049
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 04:02:21 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id e18so274027pgd.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 21:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=A6Iu8CK+fvMEAi5WAmBNnIyxewSXT0brLKenSVEGXL4=;
 b=FOUG2k8+MaztgIzts4HwDlrGsCudjd56IKZWBLbgBRGW/+cSpuwEsCSWMlu5X5nBBu
 8v6RNE3ofy5cTam6TcIjkuItXIvPyc7BnaDjbojyP6bpWtePhAM6lThFjdqzXAhLVzGv
 rJbQKjncIrbIlyRWHDJ29BFUMMRVe0Y5VsBPbLsl3Bst+P8Ktaa043qBw5dyOe+/kXhe
 UYwVUTDrG5ZOP70fROR05CZtKDJ9zhOZyHz1hblG2GGXhyuRq1b96FSREuL9ukVIUWXe
 18YjjTXSkaJR3uRKRYnMtw/wPv5ezudgB2hkwL7x8DllO4HhtpI+cExOxnfKNgTAw4d1
 a28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=A6Iu8CK+fvMEAi5WAmBNnIyxewSXT0brLKenSVEGXL4=;
 b=SUqa5zZfxzkO0w4SplFEzWVAzKqfQCSNV29KkKz5X+Zu+ZzwID68jbFx+vJEz734PX
 NUzT268S/feQA+BQ2bLrsssKV1KW9TaNTO5PCeM0uxAo+ZiRi5svrhEhbuxkR7ojLjZE
 craK/9LL4fq8xVBYPZXTt/E/1mUmX7KOSVNoXuWCIYwg7sIA2hIvVPD7Cz/aLnhd6sCB
 LBy8+4VcZdhOu6paaZcU1gjmW28bC2AIUGmAXTuszPPsqKC88DB8w2o4Rky4GfBhEqjk
 X/hgsfWMkgZARYinhxvn+Ht+neKifheXQwKuBVMBLWbbAYWDRx9bhZFfgVqUTUupc6uW
 a14w==
X-Gm-Message-State: AOAM533531YK7FE/acS/3iNIv562TgQAG+UAm37BkpIN/W7z9jCd22S/
 EN9F1bQZUkadE4GB7jxPdoc=
X-Google-Smtp-Source: ABdhPJyA5nA4I3XO3XKaf/fb/M89xL8cx8S1ztqnn2lD6/kSbg6onBEyGX/DZDqqLsywchH+AQJnXQ==
X-Received: by 2002:a63:a51a:: with SMTP id n26mr624314pgf.1.1601438540777;
 Tue, 29 Sep 2020 21:02:20 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id f19sm354554pfd.45.2020.09.29.21.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 21:02:19 -0700 (PDT)
To: linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 Petko Manolov <petkan@nucleusys.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200929082028.50540-1-anant.thazhemadam@gmail.com>
 <20200929084752.GA8101@carbon>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <b5542434-7d12-0bba-8e54-8c5edfcb33b3@gmail.com>
Date: Wed, 30 Sep 2020 09:32:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929084752.GA8101@carbon>
Content-Language: en-US
Subject: Re: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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


On 29/09/20 2:17 pm, Petko Manolov wrote:
> On 20-09-29 13:50:28, Anant Thazhemadam wrote:
>> When get_registers() fails (which happens when usb_control_msg() fails)
>> in set_ethernet_addr(), the uninitialized value of node_id gets copied
>> as the address.
>>
>> Checking for the return values appropriately, and handling the case
>> wherein set_ethernet_addr() fails like this, helps in avoiding the
>> mac address being incorrectly set in this manner.
>>
>> Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
>> Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>>  drivers/net/usb/rtl8150.c | 24 ++++++++++++++++--------
>>  1 file changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
>> index 733f120c852b..e542a9ab2ff8 100644
>> --- a/drivers/net/usb/rtl8150.c
>> +++ b/drivers/net/usb/rtl8150.c
>> @@ -150,7 +150,7 @@ static const char driver_name [] = "rtl8150";
>>  **	device related part of the code
>>  **
>>  */
>> -static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
>> +static int get_registers(rtl8150_t *dev, u16 indx, u16 size, void *data)
>>  {
>>  	void *buf;
>>  	int ret;
>> @@ -274,12 +274,17 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
>>  		return 1;
>>  }
>>  
>> -static inline void set_ethernet_addr(rtl8150_t * dev)
>> +static bool set_ethernet_addr(rtl8150_t *dev)
>>  {
>>  	u8 node_id[6];
>> +	int ret;
>>  
>> -	get_registers(dev, IDR, sizeof(node_id), node_id);
>> -	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
>> +	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
>> +	if (ret > 0 && ret <= sizeof(node_id)) {
> get_registers() was recently modified to use usb_control_msg_recv() which does
> not return partial reads.  IOW you'll either get negative value or
> sizeof(node_id).  Since it is good to be paranoid i'd convert the above check
> to:
>
> 	if (ret == sizeof(node_id)) {
>
> and fail in any other case.  Apart from this minor detail the rest of the patch 
> looks good to me.
>
> Acked-by: Petko Manolov
Got it. I'll be sure to include this in a v2, and send that in soon enough.
Thanks for pointing that out. :)

Thanks,
Anant



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
