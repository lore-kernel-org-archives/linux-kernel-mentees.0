Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4FBC00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 12:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A037C81CDC;
	Mon,  1 Aug 2022 12:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A037C81CDC
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=qzQZespJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeVF-QepXB4n; Mon,  1 Aug 2022 12:52:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9D73C80B0F;
	Mon,  1 Aug 2022 12:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D73C80B0F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7828DC0032;
	Mon,  1 Aug 2022 12:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C050C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F7C401D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F7C401D2
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=qzQZespJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vj6ZfSPRnrNe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D82740168
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D82740168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659358334; cv=none; d=zohomail.in; s=zohoarc; 
 b=dLCP1LRwIl1bWr8nAoLKsw1Rq7+h63BO/8yjOSVc6ZDf4CcNU138KdA9XBBeAiNcuTLphxxmkBuVD4VvOINKdQlY08JUgW9B71G++jML1beJJ0+8VeEFVnBWYr7rrXgdywf+ITQMynkrkEzaVGfNJgaD94zDC3OzfZ3vqf/LYYs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659358334;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ZucGc/xaWsMqpRuxte5cdZ6+7d5BRfDSRyYsk/WnebM=; 
 b=WTkJI9gGhmc2i7zlqK1rCijL1fEd63fgjmGv+CSCky/PpQOK2lDb7THdt51c0DH4DDkutb1V6PRfB3OIBZptJ5OksU7+NVkh/FuDNcijXc05nuj1LhP8JwMkkDkfrTuzONclPHwppoKmqsLtUr7kNGdprp/H3M7I2hdv4CsCsz4=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659358334; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ZucGc/xaWsMqpRuxte5cdZ6+7d5BRfDSRyYsk/WnebM=;
 b=qzQZespJ/Q8jGtl1GDqJIF5aC+wrNQOdlAjDIZ1rQ+rFaF0kP9Jgya4nD+YWbST/
 7uJSeO1mAuzwfoGYwA1crDvg+m2MbKcSf3kDCrSWnz/FpbQ/JfDQR0JVXVy3O7hcROW
 yYoU2p3xKikOAq0SK9+/hKqakcM6fvJffR9VzMXE=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659358322294738.2309151863757;
 Mon, 1 Aug 2022 18:22:02 +0530 (IST)
Date: Mon, 01 Aug 2022 18:22:02 +0530
To: "hdanton" <hdanton@sina.com>
Message-ID: <18259769e5e.52eb2082293078.3991591702430862151@siddh.me>
In-Reply-To: <20220801121513.28E4B5204D1@webmail.sinamail.sina.com.cn>
References: <20220801121513.28E4B5204D1@webmail.sinamail.sina.com.cn>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Marius Fleischer <fleischermarius@googlemail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 David Howells <dhowells@redhat.com>, linux-mm <linux-mm@kvack.org>,
 Dipanjan Das <mail.dipanjan.das@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Priyanka Bose <its.priyanka.bose@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
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

On Mon, 01 Aug 2022 17:45:13 +0530  Hillf Danton <hdanton@sina.com> wrote:
> What is not clear is what you are fixing, with CVE-2022-1882 put aside,
> given the mainline tree survived the syzbot test [1] irrespective of
> other fixing efforts [2, 3].
> 
> Hillf
> 
> [1] https://lore.kernel.org/lkml/000000000000c7a83905e52bd127@google.com/
> 
> //	syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> //	
> //	Reported-and-tested-by: syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com
> //	
> //	Tested on:
> //	
> //	commit:         3d7cb6b0 Linux 5.19
> //	git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> //	console output: https://syzkaller.appspot.com/x/log.txt?x=14066d7a080000
> //	kernel config:  https://syzkaller.appspot.com/x/.config?x=70dd99d568a89e0
> //	dashboard link: https://syzkaller.appspot.com/bug?extid=c70d87ac1d001f29a058
> //	compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> //	
> //	Note: no patches were applied.
> //	Note: testing is done by a robot and is best-effort only.
> 
> [2] https://lore.kernel.org/lkml/0000000000000dac0205e479ea39@google.com/
> 
> [3] https://lore.kernel.org/lkml/00000000000014c7ad05e4d535fc@google.com/
> 

(Fixed broken formatting)

This bug is about watch_queue still having a reference to a freed pipe,
which was being accessed by post_one_notification() at the time of when
I posted the v1 patch for fixing it on 23rd July, by removing the
reference to the freed pipe in the watch_queue.

Given ref. [3] by you leads to a bug about UAF in __post_watch_notification():
https://syzkaller.appspot.com/bug?extid=03d7b43290037d1f87ca

That bug is fixed by the following commit by David Howells on 28th July:
e64ab2dbd882 ("watch_queue: Fix missing locking in add_watch_to_object()")
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e64ab2dbd882933b65cd82ff6235d705ad65dbb6

Given ref. [2] by you is of a patch tested by you, which can be found below:
https://groups.google.com/g/syzkaller-bugs/c/RbmAFTAIuyY/m/-vMjf-BXAQAJ

This had overlooked the existing serialization of wqueue->defunct, which
you had yourself pointed out in the reply to v2, which can be found below:
https://lore.kernel.org/linux-kernel-mentees/20220724071958.2557-1-hdanton@sina.com/

Given ref. [1] by you is about a syzbot test which was ran today, which no
longer triggers the issue. This probably happens due to the commit by David
Howells referenced earlier by me. While it does cause the reproducer to fail,
it doesn't really fix the particular issue concerned by this patch, which is
that the watch_queue has a reference to a freed pipe, which had caused a UAF.

Hope everything is clear.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
