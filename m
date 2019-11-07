Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9C8C5DF61
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 23:21:22 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E877021882
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 23:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E877021882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C23D4B7D;
	Thu,  7 Nov 2019 23:21:21 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DFC2BAF3
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 23:21:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 90B7C196
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 23:21:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 579D415370B6A;
	Thu,  7 Nov 2019 15:21:19 -0800 (PST)
Date: Thu, 07 Nov 2019 15:21:18 -0800 (PST)
Message-Id: <20191107.152118.922830217121663373.davem@davemloft.net>
To: tranmanphong@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191107004404.23707-1-tranmanphong@gmail.com>
References: <0000000000009763320594f993ee@google.com>
	<20191107004404.23707-1-tranmanphong@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Thu, 07 Nov 2019 15:21:19 -0800 (PST)
Cc: kstewart@linuxfoundation.org, linux-usb@vger.kernel.org,
	hslester96@gmail.com, linux-kernel@vger.kernel.org,
	syzbot+7dc7c28d4577bbe55b10@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, glider@google.com,
	netdev@vger.kernel.org, tglx@linutronix.de,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] usb: asix: Fix uninit-value in
	asix_mdio_write
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: Phong Tran <tranmanphong@gmail.com>
Date: Thu,  7 Nov 2019 07:44:04 +0700

> The local variables use without initilization value.
> This fixes the syzbot report.
> 
> Reported-by: syzbot+7dc7c28d4577bbe55b10@syzkaller.appspotmail.com
> 
> Test result:
> 
> https://groups.google.com/d/msg/syzkaller-bugs/3H_n05x_sPU/sUoHhxgAAgAJ
> 
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>

There are several more situations in this file where the data blob passed
to asix_read_cmd() is read without pre-initialization not checking the
return value from asix_read_cmd().

So, syzbot can see some of them but not all of them, yet all of them
are buggy and should be fixed.

These kinds of patches drive me absolutely crazy :-)

Really, one of two things needs to happen, either asix_read_cmd() clears
the incoming buffer unconditionally, or these call sites strictly must
check the return value always before accessing the buffer after the call.

I'm not applying this, sorry.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
