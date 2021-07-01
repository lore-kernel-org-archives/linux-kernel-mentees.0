Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A615C11F64
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 15:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBB561406
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 15:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBB561406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62BE3415B3;
	Thu,  1 Jul 2021 15:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFyGHVlH3zgH; Thu,  1 Jul 2021 15:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D6270405E1;
	Thu,  1 Jul 2021 15:40:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF26EC001A;
	Thu,  1 Jul 2021 15:40:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 995ABC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 15:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78DE3415CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 15:40:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SStxvCHw7PAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 15:40:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E1B8405E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 15:40:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso4479805wme.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Jul 2021 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3d1/y8CJLKCSBr4EsHmH8zFaiN252FdPYFFuHvdt5Fo=;
 b=FQxikW28LOSxCdBf1R+ZchUmn3KM+B4UEWA2qzea9w88sCbE7MBH9Ua1TlXXMXsads
 It/c2J09TJXMLUdRjfkVvsIDAIgnS4/AS9p/LVEe4GT1AlzYu/4fOJfyMSim7elf/Gu3
 uJXKVeCXM3vlKFySzzOE+IlYnzedp7xVK+MOCUA+FvtcZxeOcvCpOZp39sUQT8rt7wgP
 /EvqdKecQHNQy6VMTRHKwBOwvt4tJ6vrreYDkK/hDv3+NxIQ6jFsAH+J7VfXdo35sXff
 HJsy1/Kc/mecrayYcFlTHbkRLQaoZ4VWl4GfvXQTjKnqcOqG2HZeewjcKxazQEdnBKHd
 l8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3d1/y8CJLKCSBr4EsHmH8zFaiN252FdPYFFuHvdt5Fo=;
 b=lO+pM2wSRgYh0C4PA5pSWLrSs1ORLsvkjO4Nypy0cWVMzwQgQPa73GYHoulTj/jupM
 XyExBZI8aEvOQp3dq6g84kgU55jsc/zbOpxKI44txl1s3+rNibH3JXro5BJiPQNt++r1
 GdHtBEAvvY0MEUCZqpvNYp6pVYS83Us8iDxND0XcH1i0VgcvCXxMn4fCRUxJhqZensKr
 nksUvPeALcmYkaOjfkHrjxK0w5vM1EasLovrP6qq4KrZbmHnZoPmpYwkQqd3rYFSdSlY
 z+RcvIxbqDBHdQZzwK4k+gj2uASeB3JJFFnul0kUyuwwvgtFiRtiv+gwV9AevThfQjxQ
 Vohw==
X-Gm-Message-State: AOAM5338mxeIfvnQSxbzvSuJH4MurllcscFlSblKZDEaGWF6j8DEehft
 oLmmepOq/RFH497jTY9VQvM=
X-Google-Smtp-Source: ABdhPJze4y1nxUKbHZgfaeBsmoEpGymAtQlSNHz0caBy6Jh2JtyYsOKk+Q5n7yvWRiwswrNvhK/MyQ==
X-Received: by 2002:a7b:c0d6:: with SMTP id s22mr11409797wmh.52.1625154002407; 
 Thu, 01 Jul 2021 08:40:02 -0700 (PDT)
Received: from allarkin.tlv.csb ([176.230.197.111])
 by smtp.googlemail.com with ESMTPSA id x17sm414260wrn.62.2021.07.01.08.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:40:01 -0700 (PDT)
From: Alexander Larkin <avlarkin82@gmail.com>
To: yepeilin.cs@gmail.com
Subject: Re: maybe similar bug exists for HCI_EV_INQUIRY_RESULT* like
 [Linux-kernel-mentees] [PATCH v2] net/bluetooth: slab-out-of-bounds read in
 hci_extended_inquiry_result_evt()
Date: Thu,  1 Jul 2021 18:39:36 +0300
Message-Id: <20210701153936.2954886-1-avlarkin82@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200709130224.214204-1-yepeilin.cs@gmail.com>
References: <20200709130224.214204-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: johan.hedberg@gmail.com, netdev@vger.kernel.org, marcel@holtmann.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, linux-bluetooth@vger.kernel.org, avlarkin82@gmail.com,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
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

For the net/bluetooth/hci_event.c , maybe similar bug could be inside
hci_inquiry_result_with_rssi_evt() that is HCI_EV_INQUIRY_RESULT_WITH_RSSI
and inside hci_inquiry_result_evt() that is HCI_EV_INQUIRY_RESULT. 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
