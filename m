Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CD0C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 11:34:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC73206DC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 11:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/P8MSVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC73206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1AC0E273D3;
	Fri,  2 Oct 2020 11:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wz7snjkACF6N; Fri,  2 Oct 2020 11:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D15D420394;
	Fri,  2 Oct 2020 11:34:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B702AC0889;
	Fri,  2 Oct 2020 11:34:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D602C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 11:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 794DC204F8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 11:34:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmPnpsT0xIlG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 11:34:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 95DDE20394
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 11:34:19 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id p21so645434pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=K/VaKn9dzizOyY0tltyu5tEET9jo6PeHo4lcG4paeq0=;
 b=N/P8MSVo1U7BtuFJNE+SodhonKVZR1CF9QluHq6s1h4xYwl0pq+ntYF26z+gMRnOXE
 6LgTRMiqijNo2Y8ssN8VEjntS9nRhWXTYwT6dDNpxSsbFvbewFF3QRgZzC1jTqcF7agX
 jiWOxq9ewa5mxXWI4qmX7PTTmptU+gNdS50sf4IywX8iEzX8NMPwOf/JNQ9jw4S3s7DQ
 gJFdOzqvBT0OA6fih/uObjx9sR9b4X7Fgq9jU/IZcmnyt5NyDSVuVvpQ1qQkrsGlDp1u
 wPqFVsk4SjzaaYe83DRml7OcBvcw75TrRcuL/X6CqctILk25k6ty9wW5wPVGyTLW88Jb
 BpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=K/VaKn9dzizOyY0tltyu5tEET9jo6PeHo4lcG4paeq0=;
 b=lKUAFFMQhMkE2GgIUPvnUaqJLbpx/LqmDato9EKJsPYYIgN7DrCAX1fBMwliJxkyyO
 Y9ZQXckR5p3IgutVNVnskJu0yf6HahFT+1SEPsx006sf/8XDJGzhot3xMDNISFeSkvEo
 6SbuqPVOkSGdCmW9l2GVdC+QvtlHHUwYR+Id5JfFTT7f+08FUqnL1v1BvWmYmY4ntqdv
 /uZaiOy5Z+f3vLM5ryQyU7tPsdtq5kO68by98UrXKtCMAO1c4CjTlpC5H8p6mt2y/dtj
 GqIs736utMzZWgZyBXsw5qZpAu/9YfChXyI47q+UpNfQsdS6EBufgs5966WNczvpF/U0
 EK6A==
X-Gm-Message-State: AOAM530m8JlVrs80bRvF4JDmB4ROAu1naQr7EZEgUs0hMdsfc0SHUo5f
 oO+9W1wlzQqFXfumgkm9K2o=
X-Google-Smtp-Source: ABdhPJxPrRC7D283hGCMowzaj1PXBI6zxmqIXpXGnLKzL8vrGcn+vdjdMI1G45WDEiowYR/4q7PJWg==
X-Received: by 2002:a17:90a:ea0a:: with SMTP id
 w10mr2245628pjy.165.1601638458700; 
 Fri, 02 Oct 2020 04:34:18 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id f5sm1468026pgg.68.2020.10.02.04.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 04:34:17 -0700 (PDT)
To: David Miller <davem@davemloft.net>
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
 <20201001.191522.1749084221364678705.davem@davemloft.net>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <83804e93-8f59-4d35-ec61-e9b5e6f00323@gmail.com>
Date: Fri, 2 Oct 2020 17:04:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001.191522.1749084221364678705.davem@davemloft.net>
Content-Language: en-US
Cc: petkan@nucleusys.com, syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
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


On 02/10/20 7:45 am, David Miller wrote:
> From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> Date: Thu,  1 Oct 2020 13:02:20 +0530
>
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
>> Acked-by: Petko Manolov <petkan@nucleusys.com>
> First, please remove "Linux-kernel-mentees" from the Subject line.
>
> All patch submitters should have their work judged equally, whoever
> they are.  So this Subject text gives no extra information, and it
> simply makes scanning Subject lines in one's mailer more difficult.
I will keep that in mind for all future submissions. Thank you.

> Second, when a MAC address fails to probe a random MAC address should
> be selected.  We have helpers for this.  This way an interface still
> comes up and is usable, even in the event of a failed MAC address
> probe.

Okay... I see.
But this patch is about ensuring that an uninitialized variable's
value (whatever that may be) is not set as the ethernet address
blindly (without any form of checking if get_registers() worked
as expected, or not). And I didn't think uninitialized values being
set as MAC address was considered a good outcome (after all, it
seemed to have triggered a bug), especially when it could have
been avoided by introducing a simple check that doesn't break
anything.
However, if I was mistaken, and if that is something that we can live
with after all, then I don't really see the understand the purpose of
similar checks being made (in all the many places that the return
value of get_registers() (or a similar function gets checked) in the first
place at all.

In all honesty, this confused me a little more than it provided clarity,
and I hope someone could help me shift that balance back to clarity
again.

Thank you for your time.

Thanks,
Anant
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
