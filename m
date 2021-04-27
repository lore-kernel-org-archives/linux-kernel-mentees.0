Return-Path: <SRS0=0WDs=JY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39163C433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 20:50:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E2261006
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Apr 2021 20:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E2261006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8285D405DF;
	Tue, 27 Apr 2021 20:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZD1cQ7M4GKQ; Tue, 27 Apr 2021 20:50:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2CB4039F;
	Tue, 27 Apr 2021 20:50:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66854C001C;
	Tue, 27 Apr 2021 20:50:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48B4AC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A57783CE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGZ-A7UsqHtM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:50:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 190B583CA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 20:50:22 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c19so6326486pfv.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Apr 2021 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=MqJ2Fsu2qxzU2KA4WKTMaAjQSbNm6eWwnwOWW+FZ2U4=;
 b=JZ3Ip3EOQmRMQsyKwGv21Q2gbo1VkBX+VKVto/0bcZvEcqvfWmuX+zePKo9FVwBDdu
 QCaJrZsvWZ6p+FIlY71gWgmJx7N9spCkwpRIh6Sr/cRyN1Fx/a+5NcRRYMIRnrMXYBK5
 dFZjzMC3Qe1+qp6b/AckDS1hRAHCu9nirpi21j2gIw75XtZYOQvlveeOQtj0tdoCKnff
 p+2UeXZc3eOuYNlDC4D641Ork3pLfvunZ4VEwdjDT5bJJRbQFmpAREdC5/mal1022j26
 sBZ//w+JgpnNvzN7uIu66YgYOCjfJxk9ZkBwVP1KY1HFGfm6rp+AHLjrTsGUg5k27Hun
 5lTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=MqJ2Fsu2qxzU2KA4WKTMaAjQSbNm6eWwnwOWW+FZ2U4=;
 b=brHKjTvhzGLrctpR9xTbijY3exkCf1iATA57UXRWc8evr3YsfPvLMcotDlpvQUHJKt
 d+glHEr8+19ZiuLR4NpR1UYzW8XMXl7TO2m/YzDvUWOmcDBx5n6ixX9rDMhJsSZA3ox8
 myedNfgwFUEl+Rg3yQuUUTZmAh+9hN4K/pnXOfCP/fUGCnXvWxzjVkPzqWEv1sgw6JXM
 bDxLCprpmlrqQ4iutYh7RsLZNYwlG7phmZc3wMwQ5MlF87bF6g0dQNojkztJGWdJ8Ils
 1aSR0Pn1NSmjBlPRqBiKkEo9iPp8tTkvhW3HNT+9vFnK/tY62bVAMPGht6oXk7do6QQS
 8jTQ==
X-Gm-Message-State: AOAM533NBDpDZwUU6wkd6Mri1mFrrZwmyHRYCCQ80KaYQFdkan+dX94K
 OYxwZFOhe/UImm6PnH+3NLU=
X-Google-Smtp-Source: ABdhPJwksyI7MlJKwNTLJMmb9PXstjt0ZsXoznGh06Mq3l4VzDzv9kviJH2paBY2Rranm7Xz0tncdQ==
X-Received: by 2002:a62:7ace:0:b029:25e:fcfc:4873 with SMTP id
 v197-20020a627ace0000b029025efcfc4873mr24810625pfc.4.1619556622541; 
 Tue, 27 Apr 2021 13:50:22 -0700 (PDT)
Received: from [192.168.0.12] ([101.127.227.182])
 by smtp.gmail.com with ESMTPSA id b1sm560754pgf.84.2021.04.27.13.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 13:50:21 -0700 (PDT)
To: linux-kernel-mentees@lists.linuxfoundation.org, syzkaller@googlegroups.com
From: Esme Xuan Lim <esmethedev@gmail.com>
Subject: Starting a Wiki for Syzkaller Bug Fixing Resources
Autocrypt: addr=esmethedev@gmail.com; keydata=
 mQENBF80GGEBCACx2XC87vwwQ50OMDHkUyTq7GBG6hcDMfqplONHcUowFicsI8H02WFmJWJh
 nwT+lCimt2s4+zGsAOnJInQsHJwqU0rnYgt/MLuTbv3N3bmMHwx/lGrhP97DukVwKLItaIFI
 PO6kN0/amfT/O1nmTlcg+OvTU4duiBJCdDQHkxUkxU9WJaWjLhIcPAUhpKMoT1CGoxWyzOQC
 cwA8dCaHtNGDi5ko9HvF5A4X4t6gEc7qthW4nW5+pZTmqU2C11lh3CRAxLPTZb4unlSQUeLO
 ZgVo4qcU+hKYeRF9rchgt3qc8ZdN3VDwzwS7nnzj7Jfnw9Zi2L0idw626Vi5YJKpxKyJABEB
 AAG0N0VzbWUgWHVhbiBMaW0gKFVidW50dSBMYXVuY2hwYWQpIDxlc21ldGhlZGV2QGdtYWls
 LmNvbT6JAU4EEwEKADgWIQSSVkpJyy7emC6Yxf1P5w0EpsndNwUCXzQYYQIbAwULCQgHAgYV
 CgkICwIEFgIDAQIeAQIXgAAKCRBP5w0EpsndN70PB/47m+NJ6XFOkCb4zFo/8+C3T7ZbbNX8
 /W/h8Z3Zm/zyPra9kYm3JaWCKrJfFDbp6iuw80C+dX2n665L22xgvxLQlZ0i+APa/LXuNzoh
 OJ9VWiXquCUCdkX6KzeTM/aDIHlgUH71/8c6nTSkbfn5xRdEdD7tcj+WNCBIIfWvg4BGrt5L
 HVeZ6wg0SydhQIhHrTxQjYeJrU0SVH2c9ic4lKx/KnPVDUYsxDpue9a+nLz6UUNZIYkR84LQ
 9KlxvLBWZM5Nst5MW4ti2LeUjilTgZSuv1ybAW30FGCds+/pctQhNW7Ns/wV53OR6LI8gyyI
 SMePqKIPdeG5bAk0YitlMpTBuQENBF80GGEBCADF7iD1ito1ssFWaljnA33ODkTjYbMxPblS
 zH4s3qxj40GpK+DVs2p+deYkl2sMGFypHVCA2OyiBbB3y7d3PJBGbqaAYERUGBam66DXiyLm
 Mf96LdsxGA1YuBYAWni1ZSC4OjKu2KMUu3GYN/Ad8WSgUx9CVspgh0WAn8FJR3xm0HIBn178
 VQTC3fbCzpHT+yGx8wwG8SZ1apWq4EG6Gh1pdXJSOEuYf+wROjQ01/2f0JFaD2WcArfvOrUO
 ejnoYDlnHkjdPdFp6RX5PHM10Sv7qBw7riSBugSAhlna4wTvTbNrYtnD4dki7gMz3OmrLVsN
 yNqD7nZsUN32biOEzh3VABEBAAGJATYEGAEKACAWIQSSVkpJyy7emC6Yxf1P5w0EpsndNwUC
 XzQYYQIbDAAKCRBP5w0EpsndNwCxCACTMYmmIhy195/BNIDuUtNuPN7EQaSFaZcHaatfNTVR
 VsnyW7rHtzKde8/HPrsFaiaZEz6BbUxa3Nb45QJtwX7ZhZHhdlY7YLYTd7Ztbl5pdItaBg3U
 E5d1/eoQaC4mtWV4t2Pg3tqYT5ZT4MKTL7j9hAqQ1RjwutKEYKBqMaINdYfVOuSygX81GwK5
 cUsYQFKHSFufwwxEjim39AMAaZLdGDRY0SL6QSnMhHfjMe0FvT0XDdr+tY6g1VVhqsHpXKpC
 cstEFgKQBahJlSCWRJDGZ31U6iVPy4lFARt8gfLFxo9iV2VU0XZ8uVnMPJBekTmCuskdpBG7
 C3sYFlv6BVYL
Message-ID: <e486aee7-993c-e50f-f14f-aac7f701b752@gmail.com>
Date: Wed, 28 Apr 2021 04:50:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
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

Hi there,

Having been on the bug fixing mentorship, I've been collating a bunch of
resources that helped me as I was going. I've been thinking that there
might be a big gap in resources in where interns might be looking and
was keen on trying to put one together. Given the current conversation
Greg has brought up about syzkaller bugs needing more attention, I
figured this could help fix it if interns are the only ones available
for this task.

I think it'd help the kernel mentees current and future sink their teeth
quicker into fixing bugs, and less into helping themselves learn what is
needed. This appears to be a big gap that would really help if it were
filled. Resources are heavily abundant for the Linux kernel, but a good
level of curation and maintained resources could help with bug fixing.
Resources look old, but are incredibly insightful. I would have skipped
looking at these resources given my experience with more modern
frameworks and toolkits (which is that it would be best to avoid
outdated ones as APIs change very quickly - but this is not the case
with the kernel)

I've got links and things but I've been wondering if it made sense to
build on the Kernel Mentees or to build a wiki (and host it) on
something more modern like github.

I'd love to hear suggestions for how best to go about this, and if
anyone would like to contribute to it too.

Thanks,
Esme


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
