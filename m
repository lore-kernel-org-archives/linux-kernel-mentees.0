Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C36C00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BC481D16;
	Mon,  1 Aug 2022 13:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BC481D16
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=NJZfe/IX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ugA9xP_H0it; Mon,  1 Aug 2022 13:01:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 61E9381CE1;
	Mon,  1 Aug 2022 13:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E9381CE1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D68C0032;
	Mon,  1 Aug 2022 13:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 842C4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 13:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EF1A81D16
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 13:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EF1A81D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XwNqYlTB-9wK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 13:01:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F8481CE1
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10F8481CE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 13:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659358869; cv=none; d=zohomail.in; s=zohoarc; 
 b=M2npo+8rvf2mQf9u6Grt4ErfFGR/2ZHMYR8rCOrdB8348R+FuXI2qwKOqsrH5wg81pChgmd/yUZIjgpggaEl21qJDPaDemkWPD6NQQBMbliqzlrZia9SUY66zNTmiWd/zJ09E7HFcZNQ8W5XxP/t0FeB85/MTngZViQetdsZJMs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659358869;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=SQ0v85mLbFdTasT7Xfcj7jIsYFQii/2HWb8VZtzXjyM=; 
 b=Eoc/U40ZXnlz6FMuqeRxVjZqLbkWIBczvDc/QkvA2ACTtXyKk2bQt/keZlOgcG48LisE9Llyry9OIBpmUGQqr7B0NRtkZ55x7BmM+XgOpKK2kJAo23ASSF6ZAL3p2VKgBYq/Ip6+HSP8GPtPmIdakiiApnvcN1o9l1YDgu+mvwc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659358869; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=SQ0v85mLbFdTasT7Xfcj7jIsYFQii/2HWb8VZtzXjyM=;
 b=NJZfe/IX8tF8KFHUNwwJfRldlrpua714VbMxQqn+B8og+4rGW33ux2jDIe0di8xB
 C7ORSZ/7CR5NjkF8SzC0O13KI1CxqZAMMjxofVBal/jSLxO0fBaFBspKwFBkOUNnS7v
 Mv2zm0Tn9mqyuDyd6t8eMK0QVHEnzN8DSY9iVMdE=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659358858473203.14224248901678;
 Mon, 1 Aug 2022 18:30:58 +0530 (IST)
Date: Mon, 01 Aug 2022 18:30:58 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
In-Reply-To: <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
 <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: Eric Dumazet <edumazet@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Dipanjan Das <mail.dipanjan.das@gmail.com>, syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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

On Mon, 01 Aug 2022 18:28:25 +0530  Siddh Raman Pant <code@siddh.me> wrote:
> I now tried the 5.10.y branch of stable (which has v5.10.134), but the
> reproducer isn't triggering the bug for me. 

By this, I mean without the patches. I should have been clear.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
