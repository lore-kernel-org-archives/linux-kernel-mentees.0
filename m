Return-Path: <SRS0=ILBb=BO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A44C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 10:41:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9587120656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Aug 2020 10:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOMIs+Ul"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9587120656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31CAC86108;
	Tue,  4 Aug 2020 10:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOWC9f2be8jf; Tue,  4 Aug 2020 10:41:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 48125860FF;
	Tue,  4 Aug 2020 10:41:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D0D7C0051;
	Tue,  4 Aug 2020 10:41:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2B76C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 10:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9897F857A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 10:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vj1JJOGwrYSb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 10:41:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ED6AB86CDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Aug 2020 10:41:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id m8so13104509pfh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Aug 2020 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dS+3+hYqZ66uBhMhwpE9mDgfqdGREXxXTLcJTBg38DQ=;
 b=gOMIs+Ulxkf/Kb2dkPeZGEn2TCWU8Lgw9SjOnGHaKWjSB8ENZ356Iq+3vmqhD/sbdQ
 OFQEoTVcWkrtOfczN3+xZOKCe+ic3JN0BHmTzaB/L7V38v7JFRy9/AJJ3uAPymKpGSP5
 h3Ok5CKfbYEWt4mN46WHUaN6g0HyTzjs65bjQPPAN3OpYKvrKKKxBcjIN1xtfDD8+DMe
 ETEwyXFWsSV3J/4pa5bGRR3mcl4N93gr5bNoAa0TZQHmvDp1IevU1FY87ujtQp4vtNlW
 ZYYGWlhl5el9PAqgdXCvpmfP5CPt7ITxnzsY4hB36NW5H121wgn+tZIpkoOwJNosbMs4
 iepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dS+3+hYqZ66uBhMhwpE9mDgfqdGREXxXTLcJTBg38DQ=;
 b=LOWfjDljP1CazTe9jSrvBEiSyhdfYKRsTIH11+/Mq9v/6LXkn52g5qRBdzeXLNyCSr
 UUl/oP9QC3tgN8vbBLkSiX7B88PM+LFNTuXURtCMXX9bR6XZWcrNvKPASm4IJg93qzxZ
 1nk5WcE3lKOdL1oiZTvKapc8S8k5QM1xT90bX9oNH4S05M404sftzNioi+5Xa+dHpUFa
 TOx7dcvE39n2mILGwLdH/TkW0ILp8uHNn4OQ5jtsuDMp1LNDZy3oDTdCfewH0bbFGAQn
 jDqo5uIDbBY4ny/gu0597RfsSYVvzskQVrH28iaXhll2B3UWSYaXahLVuLT/ofGDtRzt
 qpEg==
X-Gm-Message-State: AOAM531OKb/u/UrjEwllbTEcUDbn371N3CHeYREqLHp9PI2ODN6A6x7A
 aIccT9Qlmoy3dBBplgThnlM=
X-Google-Smtp-Source: ABdhPJwVkry725oBjqKvwKBp+5Fi90O4GOYmW5vJcWNN4EmW2jkEGBAC9qAjuPvRaCJloMFFEN8n8A==
X-Received: by 2002:a63:1208:: with SMTP id h8mr18942187pgl.128.1596537713384; 
 Tue, 04 Aug 2020 03:41:53 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id t63sm15210765pgt.50.2020.08.04.03.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 03:41:52 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Tue, 4 Aug 2020 18:41:48 +0800
To: Greg KH <greg@kroah.com>
Message-ID: <20200804104148.nqxcy4f44uga7wjs@Rk>
References: <20200804093937.772961-1-coiby.xu@gmail.com>
 <20200804094253.GA2667430@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804094253.GA2667430@kroah.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 open list <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 syzbot+fadfba6a911f6bf71842@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] Bluetooth: Initialize the TX
 queue lock when creating struct l2cap_chan in 6LOWPAN
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Aug 04, 2020 at 11:42:53AM +0200, Greg KH wrote:
>On Tue, Aug 04, 2020 at 05:39:37PM +0800, Coiby Xu wrote:
>> When L2CAP channel is destroyed by hci_unregister_dev, it will
>> acquire the spin lock of the (struct l2cap_chan *)->tx_q list to
>> delete all the buffers. But sometimes when hci_unregister_dev is
>> being called, this lock may have not bee initialized. Initialize
>> the TX queue lock when creating struct l2cap_chan in 6LOWPAN to fix
>> this problem.
>>
>> Reported-by: syzbot+fadfba6a911f6bf71842@syzkaller.appspotmail.com
>> Link: https://syzkaller.appspot.com/bug?extid=fadfba6a911f6bf71842
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  net/bluetooth/6lowpan.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
>> index bb55d92691b0..713c618a73df 100644
>> --- a/net/bluetooth/6lowpan.c
>> +++ b/net/bluetooth/6lowpan.c
>> @@ -651,6 +651,7 @@ static struct l2cap_chan *chan_create(void)
>>
>>  	l2cap_chan_set_defaults(chan);
>>
>> +	skb_queue_head_init(&chan->tx_q);
>>  	chan->chan_type = L2CAP_CHAN_CONN_ORIENTED;
>>  	chan->mode = L2CAP_MODE_LE_FLOWCTL;
>>  	chan->imtu = 1280;
>
>Nice, did syzbot verify that this resolves the issue?
>
>thanks,
>
>greg k-h

Yes. Thank you for reminding me. I'll also add an Tested-by: tag next time.

--
Best regards,
Coiby
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
