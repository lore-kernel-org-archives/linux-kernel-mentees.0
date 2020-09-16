Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF937C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 13:41:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCC522247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 13:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+qQ5j9m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCC522247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 01177273D3;
	Wed, 16 Sep 2020 13:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykXBHPkWHLgc; Wed, 16 Sep 2020 13:41:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C0352000E;
	Wed, 16 Sep 2020 13:41:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8345DC0859;
	Wed, 16 Sep 2020 13:41:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA542C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8B269204FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNrGHokCkd7n
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:41:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 79E012000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 13:41:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bg9so3212225plb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=a7VpgUXD3etb/W2u95CFqiHYYBXyXu79NXiK4t98Blw=;
 b=I+qQ5j9mEE3iA0H4ZUBphMax7ReOC8kLIFC4DG0UZcKdQnYem3m8Y+7sCVJiRZJ/B/
 pw8tMLhpfRFVWel7rSka1hqv7O+41MZIaPaAoRO64Re5IL8TAkR1wJJOSWwT10WJMY1S
 MmLmpoRxLod/Oqy9GDd2FhG94gZ7/74YYZ25q0zp1FMPB/mZFfmEX8B2sotKLoWCAR9m
 ScqhB8raR4jlvngSTMKThpKS98ZX+BfZbhZnmqcHUcIZJeWdC/MkkwOEN+mlx2nDXPJ+
 rGBjZ0Qawi4ak9DsvFSaQWQtOz12PLCl68CPxiYgA+fLS6yRBLooKDQ4+D0XFi4PMMz6
 4PZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=a7VpgUXD3etb/W2u95CFqiHYYBXyXu79NXiK4t98Blw=;
 b=VvQdzVL+aKbzad6eKBCG78+qtXVmVJVKfRjSoHcGcM9/1XJkDqNaGTHFeTRyK55/Hu
 dywimD7ktVSwyYfwxrbAZUv8HpExijhYd0nMqE0gE8Y2pLwOI8r5MdFlLXl5Lkah/uGu
 VLSf1K8PoDsTW69rmeqiqNExEUglHust5XcAq2tmyRNNGB1RAD4COgR5b+3gjBW/Yg5a
 fB0ZCZAJEhla2u7EgcYhXc/l3nBDUgLzSxWh1P5my1ZWZK8GfRWpNYSnHQSnSaTp+hzg
 W0j/uAsN9ACgQ8Da8nyKH2pQaOGqhbCZiCy+MIPPTFEpQ0Z9MGYGHtwIo/OS3PnmwKBa
 FcWA==
X-Gm-Message-State: AOAM530ez8PMZJdbmwOgzQRGUHhDQY0DPtYZQK3wmRqXDMyvvXBWcRGM
 dEMVi1nEfoyYHh4Jwp6MSo8=
X-Google-Smtp-Source: ABdhPJwsdlcogMP86H7W0+GT+TmcgrKpclDe9FF5ms19t0nLyBthmXVXaKb8aLBdzPeosDJc3+hC3w==
X-Received: by 2002:a17:90a:7ac1:: with SMTP id
 b1mr3975237pjl.121.1600263660892; 
 Wed, 16 Sep 2020 06:41:00 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.198.18])
 by smtp.gmail.com with ESMTPSA id gm17sm2784507pjb.46.2020.09.16.06.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 06:41:00 -0700 (PDT)
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
 <20200916062227.GD142621@kroah.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <dfdb48b8-5cd9-2b19-11cc-b17f45904e0f@gmail.com>
Date: Wed, 16 Sep 2020 19:10:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916062227.GD142621@kroah.com>
Content-Language: en-US
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] rtl8150: set memory to all 0xFFs
 on failed register reads
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


On 16/09/20 11:52 am, Greg KH wrote:
> On Wed, Sep 16, 2020 at 10:35:40AM +0530, Anant Thazhemadam wrote:
>> get_registers() copies whatever memory is written by the
>> usb_control_msg() call even if the underlying urb call ends up failing.
>>
>> If get_registers() fails, or ends up reading 0 bytes, meaningless and 
>> junk register values would end up being copied over (and eventually read 
>> by the driver), and since most of the callers of get_registers() don't 
>> check the return values of get_registers() either, this would go unnoticed.
>>
>> It might be a better idea to try and mirror the PCI master abort
>> termination and set memory to 0xFFs instead in such cases.
> It would be better to use this new api call instead of
> usb_control_msg():
> 	https://lore.kernel.org/r/20200914153756.3412156-1-gregkh@linuxfoundation.org
>
> How about porting this patch to run on top of that series instead?  That
> should make this logic much simpler.
This looks viable to me. I'll be sure to try this out.
>> Fixes: https://syzkaller.appspot.com/bug?extid=abbc768b560c84d92fd3
>> Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
>> Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>>  drivers/net/usb/rtl8150.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
>> index 733f120c852b..04fca7bfcbcb 100644
>> --- a/drivers/net/usb/rtl8150.c
>> +++ b/drivers/net/usb/rtl8150.c
>> @@ -162,8 +162,13 @@ static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
>>  	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
>>  			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
>>  			      indx, 0, buf, size, 500);
>> -	if (ret > 0 && ret <= size)
>> +
>> +	if (ret < 0)
>> +		memset(data, 0xff, size);
>> +
>> +	else
>>  		memcpy(data, buf, ret);
>> +
>>  	kfree(buf);
>>  	return ret;
>>  }
>> @@ -276,7 +281,7 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
>>  
>>  static inline void set_ethernet_addr(rtl8150_t * dev)
>>  {
>> -	u8 node_id[6];
>> +	u8 node_id[6] = {0};
> This should not be needed to be done.

Noted.

Thank you for your time.

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
