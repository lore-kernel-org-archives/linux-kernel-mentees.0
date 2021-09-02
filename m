Return-Path: <SRS0=Ip/S=NY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F676C43217
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 21:41:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E35D610A1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  2 Sep 2021 21:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E35D610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE8D1834C6;
	Thu,  2 Sep 2021 21:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3lPn0GV0CFo; Thu,  2 Sep 2021 21:41:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 258168346C;
	Thu,  2 Sep 2021 21:41:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EEA4C0010;
	Thu,  2 Sep 2021 21:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE805C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 21:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFB7B401F7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 21:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahkIruTOHXXh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 21:41:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6A8940156
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  2 Sep 2021 21:41:24 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id fz10so2335331pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 02 Sep 2021 14:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gKhofwX8eKC2JSzzcueboqtoVn6s6titp85hWLz+MiE=;
 b=G773dK+zb9KFXL4NJcyHC2QEe0pQ9cj7+RuS5DYcXBZz3tmormwCFE1FYY98IMLQwe
 HEO6OL4EzaTU0QhhMqjqcVPwnWc92CRJV4Sq9kecqycHsc+g+RI4T8jc71NXHQ7gd+A/
 Ztp3aPFnZFBGTaPlwAounXVsZdaZs40Kp+3yGC1frnipHYZ0QBO41Ffd72BqCAuP1453
 nlfPLy9vHTjXq/PuKQQRuTTXEzzfBN+2GPV75vHXU2k6cssxMM5ejUdGcoj41AM/ZbLd
 qQ1K8AlNXmA5xWwNFvSsCd+fMl82ByXxurKhQTNHm6q0XyLNY0Ol9+eanw1EEnUDapSk
 Uhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gKhofwX8eKC2JSzzcueboqtoVn6s6titp85hWLz+MiE=;
 b=f4G1hkT0QDz6Qp25OnqNG7E9nlnhzbcFrG2JVIt9aqmupN0fcUokSWw74LICh+AAKX
 Vocunh9mzc+pqKorkq8C8sZv9r2nbB6LVD73y0bfZceoXgJQXPWxRnLyK0i6S5OwaLRA
 Df8lV6kb8aHs0uzabQ1nWil3t6TgXzyfnnJv2b69kjVcRA/qVkMT6lLujl6JpOo1QBGH
 wuw7t6ayvvdXi6UZQL8bIXVcXWXT+ypxHW+XZ2YniqcU+mLIu0dPTPiWLO84hcOfVBxv
 oop2E7v5YnUuX37xNaJQvws5SfMnoYDvsHGtZs1AObqmNXPMzoG5WrPS2S8kmW+JH8rb
 c3mw==
X-Gm-Message-State: AOAM531SMSH477PeSrqSGHEudpS6+h2AE4FW8xmfhm3cKM4ALyMrPJoE
 0lFkc9K+3pfSfmDWX1LIId29FidUPCc=
X-Google-Smtp-Source: ABdhPJzzmNZElA2KFyxko6m3d3UVnrhycp3ie/k0k26k+VXUUDE4Hd35nD0F+eyazlnCiqG9F4Yd6Q==
X-Received: by 2002:a17:90a:5511:: with SMTP id
 b17mr222194pji.222.1630618884160; 
 Thu, 02 Sep 2021 14:41:24 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id n185sm3497124pfn.171.2021.09.02.14.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 14:41:23 -0700 (PDT)
Subject: Re: [PATCH v6 1/6] Bluetooth: schedule SCO timeouts with delayed_work
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, marcel@holtmann.org,
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, davem@davemloft.net,
 kuba@kernel.org, sudipm.mukherjee@gmail.com
References: <20210810041410.142035-1-desmondcheongzx@gmail.com>
 <20210810041410.142035-2-desmondcheongzx@gmail.com>
 <0b33a7fe-4da0-058c-cff3-16bb5cfe8f45@gmail.com>
 <bad67d05-366b-bebe-cbdb-6555386497de@gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <94942257-927c-efbc-b3fd-44cc097ad71f@gmail.com>
Date: Thu, 2 Sep 2021 14:41:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <bad67d05-366b-bebe-cbdb-6555386497de@gmail.com>
Content-Language: en-US
Cc: syzbot+2f6d7c28bb4bf7e82060@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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



On 9/2/21 12:32 PM, Desmond Cheong Zhi Xi wrote:
> 
> Hi Eric,
> 
> This actually seems to be a pre-existing error in sco_sock_connect that we now hit in sco_sock_timeout.
> 
> Any thoughts on the following patch to address the problem?
> 
> Link: https://lore.kernel.org/lkml/20210831065601.101185-1-desmondcheongzx@gmail.com/


syzbot is still working on finding a repro, this is obviously not trivial,
because this is a race window.

I think this can happen even with a single SCO connection.

This might be triggered more easily forcing a delay in sco_sock_timeout()

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 98a88158651281c9f75c4e0371044251e976e7ef..71ebe0243fab106c676c308724fe3a3f92a62cbd 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -84,8 +84,14 @@ static void sco_sock_timeout(struct work_struct *work)
 
        sco_conn_lock(conn);
        sk = conn->sk;
-       if (sk)
+       if (sk) {
+               // lets pretend cpu has been busy (in interrupts) for 100ms
+               int i;
+               for (i=0;i<100000;i++)
+                       udelay(1);
+
                sock_hold(sk);
+       }
        sco_conn_unlock(conn);
 
        if (!sk)


Stack trace tells us that sco_sock_timeout() is running after last reference
on socket has been released.

__refcount_add include/linux/refcount.h:199 [inline]
 __refcount_inc include/linux/refcount.h:250 [inline]
 refcount_inc include/linux/refcount.h:267 [inline]
 sock_hold include/net/sock.h:702 [inline]
 sco_sock_timeout+0x216/0x290 net/bluetooth/sco.c:88
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

This is why I suggested to delay sock_put() to make sure this can not happen.

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index 98a88158651281c9f75c4e0371044251e976e7ef..bd0222e3f05a6bcb40cffe8405c9dfff98d7afde 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -195,10 +195,11 @@ static void sco_conn_del(struct hci_conn *hcon, int err)
                sco_sock_clear_timer(sk);
                sco_chan_del(sk, err);
                release_sock(sk);
-               sock_put(sk);
 
                /* Ensure no more work items will run before freeing conn. */
                cancel_delayed_work_sync(&conn->timeout_work);
+
+               sock_put(sk);
        }
 
        hcon->sco_data = NULL;
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
