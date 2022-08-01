Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E6C00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 08:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA14960A7D;
	Mon,  1 Aug 2022 08:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA14960A7D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=HWPQpzix
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAZnTj4Rn0fc; Mon,  1 Aug 2022 08:53:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D3E59605AE;
	Mon,  1 Aug 2022 08:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E59605AE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6442C0032;
	Mon,  1 Aug 2022 08:53:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86805C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 552A4409BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552A4409BA
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=HWPQpzix
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BU3cN2vLjCVG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:53:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08A8D40913
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08A8D40913
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 08:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659344010; cv=none; d=zohomail.in; s=zohoarc; 
 b=M0r0JCXgGx9pjQ/ydIjoSm+85Ug+MekmokoXdbPUmjwzAaZCuhBHOvH/y1PbTP4y47VYZICgIihZU/TXeSGmhjiPQYCnOwvjqFCKMurktVsbeJ6bD1GVr2P1VeHY6xeFxLksz6hQ9/c5g1V2H5FolCJeFj90C+zV43LcOvMQfHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659344010;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=9KIdphyCYOH/4OA0LAvAgOPow7h5ET3rK7jn+N74c4E=; 
 b=B4XOwHd4TerCqbXXjmKDYUCdC0TYlzBLpxCrl9PRCDy2n++lxb7/7PUBi2B2te2AEsfMCEzdj+0XeGz5DguoriRMOIYLBa5ty56cHV0u4R0oydM40nezBliRnaYeQt8hUkI1i4YheG9FTgz860fL1EhzuXpsPNNw/BoAtOVQLUs=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659344010; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9KIdphyCYOH/4OA0LAvAgOPow7h5ET3rK7jn+N74c4E=;
 b=HWPQpzixnc+vQQ4haylmY3BafaioQvZvIoH1nf2bIU7rkyKLDyGlAFSNZdVGTBjU
 oJAVJQvrBPHE62jnYyVfyw5qb95aKnrePHhtXFhMYlCIYiSJU9KmVX3MWMsGRKka/OA
 yLoLOK9m6+3Lik5jScYafBn5XPeafkVqgzBTbNwE=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659343997151238.53429778420264;
 Mon, 1 Aug 2022 14:23:17 +0530 (IST)
Date: Mon, 01 Aug 2022 14:23:17 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <182589c08c8.3f58696e264303.1478535037206263797@siddh.me>
In-Reply-To: <YueTG6Nla1pMcW/1@kroah.com>
References: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
 <20220723135447.199557-1-code@siddh.me>
 <Ytv/4Tljvlt0PJ2r@kroah.com>
 <3558070.1658933200@warthog.procyon.org.uk>
 <182407602ce.190e58816827.7904364186178466266@siddh.me>
 <20220731181131.GB3569921@berlinger>
 <1825594fdb6.52eb2a02235647.5426665702277259900@siddh.me>
 <YueTG6Nla1pMcW/1@kroah.com>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 Eric Dumazet <edumazet@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Marius Fleischer <fleischermarius@googlemail.com>,
 Dipanjan Das <mail.dipanjan.das@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Priyanka Bose <its.priyanka.bose@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
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

On Mon, 01 Aug 2022 14:17:23 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> There are no active supported kernels other than the ones listed on
> kernel.org, so 5.8 doesn't make much sense here, only 5.10 and 5.15 and
> 5.18 at the moment.
> 
> thanks,
> 
> greg k-h

Okay, thanks for correcting me.

-- Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
