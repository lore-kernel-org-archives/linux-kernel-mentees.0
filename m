Return-Path: <SRS0=Fecm=EI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A81C00A89
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:44:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D54B2223C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Nov 2020 07:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJCrEWg8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D54B2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F126586AA3;
	Mon,  2 Nov 2020 07:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0Oc9wkb1fIg; Mon,  2 Nov 2020 07:44:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64BF586ABD;
	Mon,  2 Nov 2020 07:44:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53CE3C0889;
	Mon,  2 Nov 2020 07:44:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88BF8C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 770ED870A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsL5CpmhXvAI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:44:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D7FE08700B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Nov 2020 07:44:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o3so10042262pgr.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Nov 2020 23:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5UJiyEj0RQblTrXTDdoPSJMcQ8VLJhQ7hN0tGhIHA2Q=;
 b=UJCrEWg8deF3Ip1k67cosY86XQ0hGH+1DT1fDExcgdx2ooGq2pATmQonhUYeEOBR+c
 0c9GTpiw7y3CpefJIztawRxRfBGdc43jC8IBR7y+RAWQhs954QqV+YJagfRhWQE64VpE
 0PZdk35Mi2pd9Oo90QN2P9219MNvfml3F9A+5oHs7nE0RTw9eN3N97CdPnFNwHG0n3r3
 /PsDIm2/+wKMdxDz8YT5yl+4veL25xTS9Mm+rrAndQVkhFaXCn4AkW625ER2pxbHgYBP
 hcm2NkDn8U51sjxtkXcxNeDyrn36mGLt/Q01/Q7vfE9FFn5+LK6t10Q8gpijZSEW/+s+
 nydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5UJiyEj0RQblTrXTDdoPSJMcQ8VLJhQ7hN0tGhIHA2Q=;
 b=SoCrIJD00WdpjMyl704CRY0FlYiirgYpXMqQipO1wQOYEfwP/cfNw+13VAi3j09NRf
 gqmuAm9GeV5xpIR8m7DDzfJAjnoIA8jLcbHkQzDbWFRFvK3+ZJhinE1oURR2Gt/e74KY
 nz/18I00xKACw9djpkzII540ZYSSu8sRNLhzLXkc6GpnEbECjT1mJVjSR4vW6ob8IDGF
 ObC7TXdCm7ZiNu5MayITv8l7sWL8R/AuFUmQ9Ap7ZbQLYjrSndS/SGWyyLhYqRSdOWjx
 t8SKo3wJxp13LuiZylfEecRe5yQaAas2RWCe5aQQzC2fnu5BPiopeVnGkwwHnqdGPUJw
 j+Jg==
X-Gm-Message-State: AOAM530GkGOyfHd13sOJM6o09MFxxdRlqGpBvMlzmKMze1gkPqDs1T4M
 W/UqZ5+GXl8ZaGT4sLR2XlQ=
X-Google-Smtp-Source: ABdhPJwe9gamoPaXUo8fQFD4rDwBbHeFdkRzJLFhVI4etvw6IO1hkdtnAsXYjEg9duoz3oT8dhtbNg==
X-Received: by 2002:a65:6204:: with SMTP id d4mr12665142pgv.206.1604303070204; 
 Sun, 01 Nov 2020 23:44:30 -0800 (PST)
Received: from [192.168.0.104] ([49.207.221.93])
 by smtp.gmail.com with ESMTPSA id 199sm5215712pgg.18.2020.11.01.23.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 23:44:29 -0800 (PST)
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
References: <20201102031326.430048-1-anant.thazhemadam@gmail.com>
 <1817819d-3aeb-8034-a4ec-7c70040b0cf0@pengutronix.de>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <8c65ee4b-3cb8-907f-fa98-9bf4bd4293d3@gmail.com>
Date: Mon, 2 Nov 2020 13:14:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1817819d-3aeb-8034-a4ec-7c70040b0cf0@pengutronix.de>
Content-Language: en-US
Cc: syzbot+9bcb0c9409066696d3aa@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] net: can: prevent potential
 access of uninitialized value in canfd_rcv()
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


On 02-11-2020 12:40, Marc Kleine-Budde wrote:
> On 11/2/20 4:13 AM, Anant Thazhemadam wrote:
>> In canfd_rcv(), cfd->len is uninitialized when skb->len = 0, and this
>> uninitialized cfd->len is accessed nonetheless by pr_warn_once().
>>
>> Fix this uninitialized variable access by checking cfd->len's validity
>> condition (cfd->len > CANFD_MAX_DLEN) separately after the skb->len's
>> condition is checked, and appropriately modify the log messages that
>> are generated as well.
>> In case either of the required conditions fail, the skb is freed and
>> NET_RX_DROP is returned, same as before.
>>
>> Reported-by: syzbot+9bcb0c9409066696d3aa@syzkaller.appspotmail.com
>> Tested-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
>> ---
>> This patch was locally tested using the reproducer and .config file 
>> generated by syzbot.
>>
>>  net/can/af_can.c | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/net/can/af_can.c b/net/can/af_can.c
>> index ea29a6d97ef5..1b9f2e50f065 100644
>> --- a/net/can/af_can.c
>> +++ b/net/can/af_can.c
>> @@ -694,16 +694,25 @@ static int canfd_rcv(struct sk_buff *skb, struct net_device *dev,
> Can you create a similar patch for "can_rcv()"?

Yes, I can. Would it be alright if that was part of the v2 itself (since it's similar changes)?
Or would I have to split them up into 2 different patches and send it as a 2-patch series
(since the changes made are in different functions)?

>
>>  {
>>  	struct canfd_frame *cfd = (struct canfd_frame *)skb->data;
>>  
>> -	if (unlikely(dev->type != ARPHRD_CAN || skb->len != CANFD_MTU ||
>> -		     cfd->len > CANFD_MAX_DLEN)) {
>> -		pr_warn_once("PF_CAN: dropped non conform CAN FD skbuf: dev type %d, len %d, datalen %d\n",
>> +	if (unlikely(dev->type != ARPHRD_CAN || skb->len != CANFD_MTU)) {
>> +		pr_warn_once("PF_CAN: dropped non conform CAN FD skbuff: dev type %d, len %d\n",
>> +			     dev->type, skb->len);
>> +		goto free_skb;
>> +	}
>> +
>> +	// This check is made separately since cfd->len would be uninitialized if skb->len = 0.
> Please don't use C++ comment style in the kernel.

Noted. I'll have this fixed in the v2.

>
>> +	else if (unlikely(cfd->len > CANFD_MAX_DLEN)) {
> Please move the "else" right after the closing curly bracket: "} else if () {"
> or convert it into an "if () {"

Noted.

>
>> +		pr_warn_once("PF_CAN: dropped non conform CAN FD skbuff: dev type %d, len %d, datalen %d\n",
>>  			     dev->type, skb->len, cfd->len);
>> -		kfree_skb(skb);
>> -		return NET_RX_DROP;
>> +		goto free_skb;
>>  	}
>>  
>>  	can_receive(skb, dev);
>>  	return NET_RX_SUCCESS;
>> +
>> +free_skb:
>> +	kfree_skb(skb);
>> +	return NET_RX_DROP;
>>  }
>>  
>>  /* af_can protocol functions */
>>
> regards,
> Marc

Thank you for your time.

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
