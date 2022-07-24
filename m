Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23475C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF8E40B64;
	Sun, 24 Jul 2022 07:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF8E40B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEJL4Bw8WOtw; Sun, 24 Jul 2022 07:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A8CEE40156;
	Sun, 24 Jul 2022 07:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8CEE40156
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 804D0C0035;
	Sun, 24 Jul 2022 07:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1E46C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8664884B52
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8664884B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oatfuwm7lwYR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:25:37 +0000 (UTC)
X-Greylist: delayed 00:05:25 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C117E84B3B
Received: from mail3-167.sinamail.sina.com.cn (mail3-167.sinamail.sina.com.cn
 [202.108.3.167])
 by smtp1.osuosl.org (Postfix) with SMTP id C117E84B3B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 07:25:35 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.249.59.48])
 by sina.com (172.16.97.32) with ESMTP
 id 62DCF28F000167F1; Sun, 24 Jul 2022 15:19:45 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 630150628944
From: Hillf Danton <hdanton@sina.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Date: Sun, 24 Jul 2022 15:19:58 +0800
Message-Id: <20220724071958.2557-1-hdanton@sina.com>
In-Reply-To: <1822ee2c605.4a717678627753.351372059135065111@siddh.me>
References: <20220724052426.2504-1-hdanton@sina.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sun, 24 Jul 2022 11:56:30 +0530 Siddh Raman Pant wrote:
> 
> Before post_one_notification(), in __post_watch_notification(), on line 228
> wqueue->lock is acquired (using lock_wqueue()).

Yes, you are right. I missed 353f7988dd84 ("watchqueue: make sure to serialize
'wqueue->defunct' properly"). Sorry for my noise.

Given defunct serialized, still need to clear wqueue->pipe in the clear
path as proposed?

Hillf
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
