Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92516C4727F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 08:46:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA807206A2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 08:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuZh5q8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA807206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F66E20005;
	Tue, 29 Sep 2020 08:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rr2iT4j6TeIM; Tue, 29 Sep 2020 08:46:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AEBCA203B0;
	Tue, 29 Sep 2020 08:46:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C9DFC0889;
	Tue, 29 Sep 2020 08:46:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EA1CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4D58B85E85
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rzs-37pFOLSP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:46:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C575485E5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 08:46:44 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id md22so3454201pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:cc:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=09r7sX9nPa/Tp8/QlC5iZVhoyrOvmOR+znTXY5U9Huk=;
 b=KuZh5q8LhRBsplk2Z5+5mo6NpY1YzTpyJliDMz/+XAGvQNDdpOYW01hURX4sYrwanQ
 cBEZjrNbSPOU3KSHoeb+lpnyN7aW2rMNnx3dzLvXW0v8aft3LETr1V+vsazsJ8AXVnxU
 tSCmjYvRoU1UCCpPqpVys1SrHeJoGMFaqdEj2UfbrNKkuewOQGKgu+hX0Y9FfF8QtXwJ
 bXG7tTqcUuA4vOod125kD4TnPdfBxPRicQi4aDJ0Ejz4H1eOjyszS2P9fxXRYKvuhMPq
 D3t+tXqJ/VHXYcIaJL+wVQNtUL6umnl3crAbkKCt7ycKz2g9W14zqmyYEwEa43AekD3d
 UiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=09r7sX9nPa/Tp8/QlC5iZVhoyrOvmOR+znTXY5U9Huk=;
 b=oekYMFqTIOgCiEJ6/kizX3jhGUKqFn7ipXoCR2rtEPie6AjwF9i9+4ZtLdc1O2jVmK
 8JVuurczjZ/2bOkbhdT8iKtCNZelA6NzXaI5+4r7rrPsAsyONFFCMiROTbf7IB2W0MGS
 s5asjH/gcfnOtABDnFqwKKTs0qFTwp1JjV41U7McVcPa175xxgjzbmfeDDNLKXW32cdl
 /OHNccoUNc5lrCgpybldQWi/U3i7q0PDaHKheFJvfZxH8E+wwfCCEOnlOFKol/AlIXcY
 Ms1TLIt+Al3vTeiPpHTl6QQdr+vtTq3bAJrOUQ2P/k+3lp6aFJcnXqe8bUvTB3cXGSqm
 0Wtw==
X-Gm-Message-State: AOAM533NnAk/f5nZNI4sT4LqisF7M0sredLnWE63OX2f2T2fvrWtKdXW
 lN9y8J2tN3Fwca00LKYQ7bY=
X-Google-Smtp-Source: ABdhPJzMivhRR0m11JQPMdLJs05kQ+Eu9B5e7Yku9mhzmu6VKvDrS4mAZLNHV9x4GjIZmjiRXP2xZg==
X-Received: by 2002:a17:90a:104f:: with SMTP id
 y15mr2758898pjd.45.1601369204267; 
 Tue, 29 Sep 2020 01:46:44 -0700 (PDT)
Received: from [192.168.0.104] ([49.207.218.220])
 by smtp.gmail.com with ESMTPSA id q4sm4433733pjl.28.2020.09.29.01.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 01:46:43 -0700 (PDT)
References: <20200929082028.50540-1-anant.thazhemadam@gmail.com>
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <d7304f13-1dd8-0760-2c89-6d61c0f6ab7f@gmail.com>
Date: Tue, 29 Sep 2020 14:16:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929082028.50540-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
Cc: Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

A sample crash report can be found here.
=A0=A0=A0 https://syzkaller.appspot.com/text?tag=3DCrashReport&x=3D17486911=
900000

The line where the bug seems to get triggered is,

if (!batadv_compare_eth(hard_iface->net_dev->dev_addr,
=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 net_dev->dev_addr))
Looks like it goes through the list of ethernet interfaces, and
compares it with the address of the new device; which can
end up going uninitialized too.

The address should have been set by set_ethernet_addr:

=A0=A0=A0 static inline void set_ethernet_addr(rtl8150_t * dev)
=A0=A0=A0 {
=A0=A0=A0 =A0=A0=A0 u8 node_id[6];

=A0=A0=A0 =A0=A0=A0 get_registers(dev, IDR, sizeof(node_id), node_id);
=A0=A0=A0 =A0=A0=A0 memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
=A0=A0=A0 }

However, when get_registers() fails (when ret <=3D 0 or ret > size),
no memory is copied back into node_id, which remains uninitialized.
The address is then set to be this uninitialized node_id value.

Checking for the return value of get_registers() in set_ethernet_addr()
and further checking the value of set_ethernet_addr() where ever it has
been invoked, and handling the condition wherein get_registers() fails
appropriately helps solve this issue.
Thank you for your time.

Thanks,
Anant

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
