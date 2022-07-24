Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670E7C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 06:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D229D417E5;
	Sun, 24 Jul 2022 06:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D229D417E5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=UydNUJQJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hl5TYkDQ4wcu; Sun, 24 Jul 2022 06:27:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 63021417C4;
	Sun, 24 Jul 2022 06:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63021417C4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3726FC0033;
	Sun, 24 Jul 2022 06:27:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12375C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 06:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2B3D40164
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 06:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2B3D40164
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=UydNUJQJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id up3klD_k1OHg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 06:26:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A2640156
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A2640156
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 06:26:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658644001; cv=none; d=zohomail.in; s=zohoarc; 
 b=bE5xPB6jxL4xW1OSm5rFtjFt6tumzAuXa1kLh2lAxAAf4n1UIe9GchBqabSRR3dTlNncUNJu0T+Wat4OxdsgHSXggSdJ+y8LUr8VFNe+oIwROV27eGBYzspJjBNLbrabXscxJqjQvWHkUxW06U9FdpePB38JPsh0dvI/fzvqRjI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658644001;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=aGJ0CXyaWm70yTn7h1FhEs2yfwa2cfoyB+ojuLdl9m8=; 
 b=aO4Da+iR4l2Ki1Woq2Dwi+7lzsa0kj4hPoHhSVkHER4g9dOwxPVxmfUSqxD3YM4nBe2wBZkamGdEo4tfQVmVUTcz0oJuwS13U0qogru/hbMjDj0m9TKOSAIq7KcIGBIfmNCmsP194yeiMQqx8GDI7mQNt1A7QwXCn5A4JYNQwgs=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658644001; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aGJ0CXyaWm70yTn7h1FhEs2yfwa2cfoyB+ojuLdl9m8=;
 b=UydNUJQJEwmHbTaIz94cy7ff9g5G5p2OmON1a0Nkrs+2VC5Ajb95lqCR2v9qr69h
 sYJjGVivxcO+QNU6gw6X1ZlN6I0vRVR+k5fvF+XVOEWo9maMq2TrwhFVmX+vPVp/IQb
 SfG9yLrqX/L3rIN6yLxCQqrg1UOnt4apLapeuXpc=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658643990042354.56937268623744;
 Sun, 24 Jul 2022 11:56:30 +0530 (IST)
Date: Sun, 24 Jul 2022 11:56:30 +0530
To: "Hillf Danton" <hdanton@sina.com>
Message-ID: <1822ee2c605.4a717678627753.351372059135065111@siddh.me>
In-Reply-To: <20220724052426.2504-1-hdanton@sina.com>
References: <20220724052426.2504-1-hdanton@sina.com>
Subject: Re: [PATCH v2] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 24 Jul 2022 10:54:26 +0530  Hillf Danton <hdanton@sina.com> wrote:
> According to sysbot's report [1], what is proposed fails to fix the
> reported uaf in the scenario below because of no wqueue->lock acquired
> in the post path. Despite of defunct checked, it is checked after taking
> pipe's wait lock - a bit too late.
> 
> Hillf
> 
> 	post_one_notification	watch_queue_clear	
> 	===			===
> 	pipe = wqueue->pipe;
> 	if (!pipe)
> 		return false;
> 				spin_lock_bh(&wqueue->lock);
> 				wqueue->pipe = NULL;
> 				spin_lock_bh(&wqueue->lock);
> 
> 				pipe is freed
> 
> 	spin_lock_irq(&pipe->rd_wait.lock); // uaf reported
> 
> 	if (wqueue->defunct)
> 		goto out;
> 
> [1] https://lore.kernel.org/lkml/000000000000aa07b205daba6d49@google.com/
> 

Before post_one_notification(), in __post_watch_notification(), on line 228
wqueue->lock is acquired (using lock_wqueue()).

The comment on post_one_notification() also tells that it should be called
with wqueue->lock held. So we do acquire the lock in the post path.

The pipe is freed after the execution of watch_queue_clear() in
free_pipe_info().

A side note: Your emails don't seem to pop up on lore's LKML archive. Maybe
check if the email isn't being blocked?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
