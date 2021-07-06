Return-Path: <SRS0=ODY0=L6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDB5C07E9B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 06:28:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E5061185
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Jul 2021 06:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72E5061185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DF124029A;
	Tue,  6 Jul 2021 06:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEaGFRo8nHWt; Tue,  6 Jul 2021 06:28:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 63AE040025;
	Tue,  6 Jul 2021 06:28:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 309BAC001A;
	Tue,  6 Jul 2021 06:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7F7FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 06:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A94AD40183
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 06:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHI9b7xf5qh4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 06:28:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8394440025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Jul 2021 06:28:37 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id g22so20453985pgl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Jul 2021 23:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TR1u3sRWI99pfiHxerbHetS8AvWmZAq6Zxi2S+X7xBM=;
 b=BQSTFgo8lk6p20yznXf61GjDalo7+DJT77UfsbMMDIVKg+ZeuSARuEpiNW+FopzG0M
 fMHX0VUVQEKOkm1sMk4dYQgU92097mXX5LCZvJHsvqScg0+4CSLwbqeie33KmahF2Hqm
 mtQwpCrLhvlRBqZ1iQbtct0GVl/VR3SWOti2J4pIfNonVAGIHFNZd6/C8HmGaWhj+Qhu
 sAOkSXAGsmGw/ui3jghF5kRpM4B/e47EpSGmjQDDre4QiFcxNYBPjUXN+5QzcREuL7hY
 Z324CvpI76ydg1mPXq3k9vh9nxTZJaTsy8f8HpWfdhV6JhFeByVjkipSKlgqlU1vVgeS
 7pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TR1u3sRWI99pfiHxerbHetS8AvWmZAq6Zxi2S+X7xBM=;
 b=Wcruy91aKgZp5vcPK1h1aIV5aZkqO6MBJEnxftKHM4Olotva58npFIBTw72BcAdKaz
 haB8dzzjMyyOOxN2CO3EWD+bReRysTjI7YhG79Lf92HatuEYtn3r20p4EXe93jRb8kzt
 6D0oOXh6dnd6E/SU23LUD0/ICXskzp1F5askpPUZG7ShCaYaq4ugu+IDQNbiW1bBIpPm
 gLmKelMOpZhnZhRJwWnEEEgw+DrPEz+SmtF26Pilqm+5tJKpeiyW0Yb64Y/F08AZmarv
 pb54pruUKy/cg29yX1QG7GaMTmZInTBOOn1dupBg/0rY1hRW3M7RUAUpfKQsbPVXtrb8
 +ECw==
X-Gm-Message-State: AOAM530RzhSiVCbholId8H5cOQdcZstSg5jYw63SBbD7omWlqa69lYNf
 pwVCJc3P+itYPwYyIAiqLjKzxN9hqF78MpxH
X-Google-Smtp-Source: ABdhPJxCDmVS+t99ctOzw46/3vLLmdX3xjcfGpkIDs27q6CAVrMSuEbFcDMQjaEeDoAnGDHcX6V5uA==
X-Received: by 2002:a63:284:: with SMTP id 126mr19484412pgc.347.1625552916756; 
 Mon, 05 Jul 2021 23:28:36 -0700 (PDT)
Received: from [192.168.1.18] ([122.163.155.135])
 by smtp.gmail.com with ESMTPSA id v21sm1524566pju.47.2021.07.05.23.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 23:28:35 -0700 (PDT)
Subject: Re: [PATCH] block: Avoid accessing an already freed kobject in
 delete_partition
To: Christoph Hellwig <hch@infradead.org>
References: <20210702231228.261460-1-rajatasthana4@gmail.com>
 <YN/1DOeSA5ODf1AV@infradead.org>
 <0c623d71-6d99-2e0d-4d8b-63a1ff814dc1@gmail.com>
 <YOPmMZdMQgXAyEMO@infradead.org>
From: Rajat Asthana <thisisrast7@gmail.com>
Message-ID: <067affa2-827e-06b2-dbc4-c4ae897e1a1a@gmail.com>
Date: Tue, 6 Jul 2021 11:58:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOPmMZdMQgXAyEMO@infradead.org>
Content-Language: en-US
Cc: axboe@kernel.dk, damien.lemoal@wdc.com, jack@suse.cz,
 Rajat Asthana <rajatasthana4@gmail.com>, rafael@kernel.org,
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

> No.  There should be no need to check anything, but the code needs
> to ensure that the block device is alive.  I think the above mentioned
> patch (now in Jens' tree) does that, so please try it.

Ah! yes, found the patch. I should have checked earlier.

thanks
-- Rajat



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
