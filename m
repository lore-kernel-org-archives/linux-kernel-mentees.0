Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21389C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 06:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01A560EB2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 06:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C01A560EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 716BE83A64;
	Wed, 28 Jul 2021 06:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPPybEjC9-2M; Wed, 28 Jul 2021 06:47:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A573183A05;
	Wed, 28 Jul 2021 06:47:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AAFAC001A;
	Wed, 28 Jul 2021 06:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1F7AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 06:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAB3C83A42
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 06:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ALeKXUpQRM9Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 06:47:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC20283A05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 06:47:23 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id c16so1498148plh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 23:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f66ZMHZX+lCkPsWnoYKEl7miIfZefe6vta28xUC0ams=;
 b=QSlXzl3nG4d05ac1KocLQg/TAFy0ByJexdBYysGlKPUTyB8otk2LExPHVLIdaSf3Rs
 LhPmBqxhvmdrVZ1/QD/FQa6cSNbuNLxVOmgS4bAeZyLa8aVSQjqNMQe2eJZH5hHhZVVn
 BaEwGDZ30PhsvIsdxsmrxaRgSIMTzVLFQsytP+r75t1Pp2+ltVp+BQ0v55XJ1QTetIwR
 SxvnDYVQWV0RIMuwJrH7WP2b8/Py+YB6VHToOSroB6oKZe8I7Qy4J1FefrQy0JMQBqS0
 XbIGVeAlEkJpq7BmyHP5IyRVmMLfLLKkshzd1w8kIudmRZDlEZ5ISzoPZL5bUPjhfJ+b
 GC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f66ZMHZX+lCkPsWnoYKEl7miIfZefe6vta28xUC0ams=;
 b=rq6DJlDUq01Qkm/IVokoTNuGDoBaykQ4FxOsoYrZNIzYNz52QHQ2H1Uvuvc4htU3Qr
 A3REgqewzctJ8M4L68uK3tsGAznfaeFSbHwjvPyK5DAd2ejflS51aH1moMhccHQIDazy
 KEHVwYMQIfoU0CsezYk/NbVKM34REQVmg/4Ej2tfFWsKqIj+/xMq9yLnKUNdpGPlm5aP
 rkgW4EyPffDQqZZrS1UaK6FFB+vw5+rLDSR8Dea2ocNYd/D0sWzyxUMewjdqhVyCoS0M
 7t9K2PTOdgIj55a3TRzq3BTsnppMSI6cjuqnlucF1qoKJH3C+EJb3VsLAB/qzA7D61Zb
 pR0w==
X-Gm-Message-State: AOAM531a0Ulyn/Sl6DHTEAWGHz/YtvKnryYaokuNeAuA6kVDUblT2e38
 jdtVvVlCnSKlYFfmBSSD1Pc=
X-Google-Smtp-Source: ABdhPJzUGfTWenR5pyv+kD2gjeeNASQWqjw4ZqfE9VZ3L+19W85P9CVHWKdC7pxqjuohZ7r6EXDOvw==
X-Received: by 2002:a63:cd4d:: with SMTP id a13mr27428425pgj.364.1627454843309; 
 Tue, 27 Jul 2021 23:47:23 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id c16sm5973776pfb.196.2021.07.27.23.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 23:47:22 -0700 (PDT)
Subject: Re: [PATCH] Bluetooth: skip invalid hci_sync_conn_complete_evt
To: Marcel Holtmann <marcel@holtmann.org>
References: <20210721101710.82974-1-desmondcheongzx@gmail.com>
 <A47B24AE-C807-4ADA-B0F7-8283ACC83BF7@holtmann.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <30d1e002-4739-4ce4-2857-77404e4dfb68@gmail.com>
Date: Wed, 28 Jul 2021 14:47:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <A47B24AE-C807-4ADA-B0F7-8283ACC83BF7@holtmann.org>
Content-Language: en-US
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 "open list:NETWORKING \[GENERAL\]" <netdev@vger.kernel.org>,
 syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com,
 open list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On 22/7/21 10:39 pm, Marcel Holtmann wrote:
> Hi Desmond,
> 
>> Syzbot reported a corrupted list in kobject_add_internal [1]. This
>> happens when multiple HCI_EV_SYNC_CONN_COMPLETE event packets with
>> status 0 are sent for the same HCI connection. This causes us to
>> register the device more than once which corrupts the kset list.
> 
> and that is actually forbidden by the spec. So we need to complain loudly that such a device is misbehaving.
> 
>> To fix this, in hci_sync_conn_complete_evt, we check whether we're
>> trying to process the same HCI_EV_SYNC_CONN_COMPLETE event multiple
>> times for one connection. If that's the case, the event is invalid, so
>> we skip further processing and exit.
>>
>> Link: https://syzkaller.appspot.com/bug?extid=66264bf2fd0476be7e6c [1]
>> Reported-by: syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
>> Tested-by: syzbot+66264bf2fd0476be7e6c@syzkaller.appspotmail.com
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>> net/bluetooth/hci_event.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>> index 016b2999f219..091a92338492 100644
>> --- a/net/bluetooth/hci_event.c
>> +++ b/net/bluetooth/hci_event.c
>> @@ -4373,6 +4373,8 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
>>
>> 	switch (ev->status) {
>> 	case 0x00:
>> +		if (conn->state == BT_CONNECTED)
>> +			goto unlock;  /* Already connected, event not valid */
> 
> The comment has go above and be a lot more details since this is not expected behavior from valid hardware and we should add a bt_dev_err as well.
> 

Hi Marcel,

Apologies for the delayed response.

Thanks for the feedback, I'll add more elaboration for the new check and 
add a bt_dev_err in a v2 patch.

>> 		conn->handle = __le16_to_cpu(ev->handle);
>> 		conn->state  = BT_CONNECTED;
>> 		conn->type   = ev->link_type;
> 
> Regards
> 
> Marcel
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
