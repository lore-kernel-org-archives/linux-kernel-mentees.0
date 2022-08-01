Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29448C00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 12:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A69B2410D5;
	Mon,  1 Aug 2022 12:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A69B2410D5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=pncPOQ1d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7LfJReazafs; Mon,  1 Aug 2022 12:58:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BBB48410B1;
	Mon,  1 Aug 2022 12:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBB48410B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A024EC0032;
	Mon,  1 Aug 2022 12:58:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2EC6C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDD4C818A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDD4C818A2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=pncPOQ1d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Oni80vtPXyN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:58:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8339E818A1
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8339E818A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 12:58:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659358717; cv=none; d=zohomail.in; s=zohoarc; 
 b=SpgIT+u0ciSNpFpvsl8bfy86f8eiatGHZ0VCBxSC9rz7xqBjwJpE5mdRoEokHhASezWRr5WjRbdsDm/6K5hMAdlA43RWO5ZCBsMXQyI+KaFgsXZzbjwyvOu9ZsCXrnw95Mq5mtWY4H6a+iUvSqDd4douveZ3KUddV9JA4Eg3czc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659358717;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=7d8/VXWIL9kZoRLYBc/HuPEUPqfjdq8sxW9WzxOKpTo=; 
 b=UoSmkfVRWDIqbz1U2gpMYT7YCT8Vx+xcs/vlnikEoo5ox1LIB4WuMID2zM+NOtSSFXUuhob65oTIHPl37qxJfPSXEIx+k/pCKJ9wLSVDr4b6Xh2oAWZB9JniJz+/8fiYB2bnlT5yX45vA0/eM5m3pO5T8gNcDaHzIWQF8uXmMPI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659358717; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=7d8/VXWIL9kZoRLYBc/HuPEUPqfjdq8sxW9WzxOKpTo=;
 b=pncPOQ1dxoDMKbA+s7DlqsRvGXY2P6tXdGWN32RFuyVud/cs6qQQORpJGLoTf8/a
 HMQJ/US1pYBf5lr0X8AbsM5qG0BqxcM8YX7cSsJeq0QPN/YEgm7xtQ4oUhp7PaXnGm0
 2BmbSxBS1KBvOYnuUeRUjf8Xud1JcH9f2PBWnha8=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 165935870593423.691156058112256;
 Mon, 1 Aug 2022 18:28:25 +0530 (IST)
Date: Mon, 01 Aug 2022 18:28:25 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
In-Reply-To: <Yuepw21SyLbWt9F+@kroah.com>
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
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

On Mon, 01 Aug 2022 15:54:03 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_top
> 

Oops, sorry.

> Trying anything on tag v5.10 is not a good test as that kernel is very
> old and obsolete and over 15000 changes behind what the latest 5.10.y
> kernel release has in it.
> 
> So trying it on v5.10.134 would be best.
> 
> thanks,
> 
> greg k-h
> 

Noted.

I now tried the 5.10.y branch of stable (which has v5.10.134), but the
reproducer isn't triggering the bug for me. 

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
