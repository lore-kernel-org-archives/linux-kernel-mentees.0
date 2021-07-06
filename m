Return-Path: <SRS0=ODY0=L6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C20C07E99
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 01:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19B3608FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 01:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19B3608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7967183503;
	Tue,  6 Jul 2021 01:01:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzoBAokQAKKY; Tue,  6 Jul 2021 01:01:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B8BCC83434;
	Tue,  6 Jul 2021 01:01:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 922C8C0010;
	Tue,  6 Jul 2021 01:01:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6091EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 01:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 336818349A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 01:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTjmYzn4ydrr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 01:01:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9691D83434
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 01:01:19 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id a2so19845726pgi.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Jul 2021 18:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W2+AYYofJ+i/1cuwRg61KlRr9Zka6oqIudL2SUcZpBE=;
 b=No6NE/548bzly3HYgmlVYu9tCB7/LM6hGfO04rBB75EJ15NDkWjcKzRbInlqQvei1D
 VteBFJEIPqCH7k5z+KEgf3JNATEuHqKJedwM3wtt6O7xUiqWHMqwEWdFgh6Xz75AWeNP
 9CsVoT/sP5Wy76VKaFOOYJclrJLX/mBJp77wVna/ar2W9ohxVO2GoUdHmwSkWRm2hCv6
 JVmSVhVx+z7+AG31it+rGbolw4tSE9bAK2UYtrIOHZtJ1vFYSVXrMLcyxJmuQe1E3otq
 37JlO6ggRL/+CilEFkSHD7lTGiR7sot2h2liHZ3/8j07gt1ML6J3Tayh1KXz1PZegGmI
 aw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W2+AYYofJ+i/1cuwRg61KlRr9Zka6oqIudL2SUcZpBE=;
 b=UDw48POffb8zF1zkuHh1MDIaIUB5YNA+ccvaUg1oCIw9kqTrzoBdm3Ch3o9r3o5J23
 fwu9uRcTF0SwbJRyM1vzypIBdGqa6QvUuFoA1qZzcM6OJkMCM7TIIn2z9Jx55lr2z7Ve
 hcyvm9FLOAdccjuepF/oQ7KhdVDaR49RtUhiyAmreQGD0+/RFrtE/I5mLjn7Yu+Mel+g
 b0fWOwnH3PSKPE1YLnTS2KNJsXflgRapgKC8Uwp8xlekxcNyv5O+EIUh28P9Mnt/7tEJ
 snxvB3elSOZCqeYCxRwvcUkukzfUkB1aVTCQssB+E0g5T371HGlY7/sKwiDL7hZS+R1+
 MEbw==
X-Gm-Message-State: AOAM532av6Lgmqw501bIwlNRoVtGuINjqTmQvutS6cCv8R4WBqpKK5li
 YZ9GEj3vugpA85o/6d2AGkbi2KhAf6qtv+kG
X-Google-Smtp-Source: ABdhPJyakDnYiSU123gmIaGGm2KFblaAwv8xMnHUd2dRdan+8hvomba5FWnMECWaEJ3UPdHxAZoZxA==
X-Received: by 2002:a62:34c7:0:b029:28e:addf:f17a with SMTP id
 b190-20020a6234c70000b029028eaddff17amr17864664pfa.62.1625533278750; 
 Mon, 05 Jul 2021 18:01:18 -0700 (PDT)
Received: from [192.168.1.18] ([122.163.155.135])
 by smtp.gmail.com with ESMTPSA id g12sm664919pjk.25.2021.07.05.18.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 18:01:18 -0700 (PDT)
Subject: Re: [PATCH] block: Avoid accessing an already freed kobject in
 delete_partition
To: Christoph Hellwig <hch@infradead.org>,
 Rajat Asthana <rajatasthana4@gmail.com>
References: <20210702231228.261460-1-rajatasthana4@gmail.com>
 <YN/1DOeSA5ODf1AV@infradead.org>
From: Rajat Asthana <thisisrast7@gmail.com>
Message-ID: <0c623d71-6d99-2e0d-4d8b-63a1ff814dc1@gmail.com>
Date: Tue, 6 Jul 2021 06:31:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YN/1DOeSA5ODf1AV@infradead.org>
Content-Language: en-US
Cc: axboe@kernel.dk, damien.lemoal@wdc.com, jack@suse.cz, rafael@kernel.org,
 syzbot+7d6c5587ec9cff5be65c@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, ming.lei@redhat.com, linux-block@vger.kernel.org,
 hare@suse.de, linux-kernel-mentees@lists.linuxfoundation.org
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



On 03/07/21 10:56 am, Christoph Hellwig wrote:
> This should be fixed properly by:
> 
> "block: check disk exist before trying to add partition"

Hi Christoph, thanks a lot for suggesting this fix. I have been
working on implementing this and have tried the following:
- I checked if the the kobject of device structure embedded in
   gendisk structure is not NULL, to add the partition.
   This didn't work.

- Then I checked the if kobject of the block_device struct (part0)
   embedded in the gendisk struct is not NULL, to add the partition.
   This also didn't work.

- Then I checked the i_state of the bd_inode field of block_device
   struct embedded in the gendisk struct. I checked if the I_FREEING or
   I_WILL_FREE fields are not set. The reason behind doing this was
   to confirm that we only create partition on the disks which are not
   being freed.

Am I going in the right direction? Can you point me to the correct
direction if I am not?

thanks
-- Rajat
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
