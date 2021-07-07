Return-Path: <SRS0=i5R+=L7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1296EC07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 17:06:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C6C61C7F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jul 2021 17:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C6C61C7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BDF82F19;
	Wed,  7 Jul 2021 17:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7M0KR7X44__i; Wed,  7 Jul 2021 17:06:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5F62483051;
	Wed,  7 Jul 2021 17:06:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35E70C0010;
	Wed,  7 Jul 2021 17:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 540B3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 341CA4043C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbuAzsbyPDRL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:06:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 721E1403DE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jul 2021 17:06:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A06A61C7F;
 Wed,  7 Jul 2021 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625677569;
 bh=Q3PwKU2MWriiez/7uEGY76FwByXF51elK2MPyqH+BDw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aJxD8e5bZAU/ArkUH8mQlC6pi/cl6Ipfk4qd3l960Fvc9I+ZdcvoFvwuOCeyMZZO5
 0P2YAlLy5+acaD1nXZWuFQpZaBhWkISZq5DILzu3pClnr1OzG78QZxvARoWltS23A6
 PV5m/dgpvj5cndgNGYFPIJVcYgJjuvoKn2zj3m0wtVV+oxkxwCteNRDTOK6KH8GejO
 kgO/OweukSzwSFYYyA6AUrfR6Pub0zht27FcD5NVnxoUkUsXE/OS9zw5ne4eTAZBxm
 P7ZJOa6oz6WJHk4i63O+pM0jeQGz94g9CvbHUFpLqDcTENi6b1B/WnHMLSJ96r3KrV
 FvK5oT8v5eg2g==
Message-ID: <15fbc55a3b983c4962e9ad2d96eeebd77aad3be6.camel@kernel.org>
Subject: Re: [PATCH v3 0/2] fcntl: fix potential deadlocks
From: Jeff Layton <jlayton@kernel.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, bfields@fieldses.org,
 viro@zeniv.linux.org.uk
Date: Wed, 07 Jul 2021 13:06:07 -0400
In-Reply-To: <20210707074401.447952-1-desmondcheongzx@gmail.com>
References: <20210707074401.447952-1-desmondcheongzx@gmail.com>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

On Wed, 2021-07-07 at 15:43 +0800, Desmond Cheong Zhi Xi wrote:
> Hi,
> 
> Sorry for the delay between v1 and v2, there was an unrelated issue with Syzbot testing.
> 
> Syzbot reports a possible irq lock inversion dependency:
> https://syzkaller.appspot.com/bug?id=923cfc6c6348963f99886a0176ef11dcc429547b
> 
> While investigating this error, I discovered that multiple similar lock inversion scenarios can occur. Hence, this series addresses potential deadlocks for two classes of locks, one in each patch:
> 
> 1. Fix potential deadlocks for &fown_struct.lock
> 
> 2. Fix potential deadlock for &fasync_struct.fa_lock
> 
> v2 -> v3:
> - Removed WARN_ON_ONCE, keeping elaboration for why read_lock_irq is safe to use in the commit message. As suggested by Greg KH.
> 
> v1 -> v2:
> - Added WARN_ON_ONCE(irqs_disabled()) before calls to read_lock_irq, and added elaboration in the commit message. As suggested by Jeff Layton.
> 
> Best wishes,
> Desmond
> 
> Desmond Cheong Zhi Xi (2):
>   fcntl: fix potential deadlocks for &fown_struct.lock
>   fcntl: fix potential deadlock for &fasync_struct.fa_lock
> 
>  fs/fcntl.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 

Looks like these patches are identical to the v1 set, so I'm just going
to leave those in place since linux-next already has them. Let me know
if I've missed something though.

Thanks!
-- 
Jeff Layton <jlayton@kernel.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
