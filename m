Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DC0C19F2A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 05:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 896A260E35;
	Wed,  3 Aug 2022 05:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 896A260E35
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=seNAjkZM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvw4QXQ05Wh0; Wed,  3 Aug 2022 05:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 726D1605B7;
	Wed,  3 Aug 2022 05:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 726D1605B7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F55CC0032;
	Wed,  3 Aug 2022 05:13:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41E8CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 132EE404C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 132EE404C4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=seNAjkZM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Slmmca-AYMVc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:13:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50C6640139
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50C6640139
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 05:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659503622; cv=none; d=zohomail.in; s=zohoarc; 
 b=ereNJZG2TKcY8VEIiZ6G6l976YWYGMO3JS4bz9yBr7P7UPduBIxij0IjmWYS42QTVCg8SEbPcsnZYF9iXh/dQLx5RyoaXHoYk/drSvswFzGZ72r/TP032pTn/OxUHQ0YdmdWeDVIYCI5QxKqj3pFhK+jFk95TTqo3YH45wsNkHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659503622;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ankEwCNW2dYC4+n+miX8LYk427uSNCA75Yi5kRdEzXQ=; 
 b=S81e4BHRUI5TLzQMNay6MoN2XrtUEOVCkxXnJQhsn+L/y/7Wo5csOz8BYZ25cSFq2L67BNHtQPAB2CeSqGZRDuqPf6NMTVzyaA7FeYKs93eZKCZdSD/tiiG/K5WgqKAZYAmD/Qjlnk9zEdpCfb2T8m39MkimO5e0+ZYyExCIvGc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659503622; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ankEwCNW2dYC4+n+miX8LYk427uSNCA75Yi5kRdEzXQ=;
 b=seNAjkZMS25o+88HZF3N9XkiMwSuLx9JxVdk/iga/VX+CnOF2SdIwNDMFRJ8xSJj
 uqFqDHqxhMY2uh2TvuHDtU99CmH+uRHXr1Q0nrL0Nl3TuE/yAD85XDvqz4DLGMGFfGL
 KKv8QU94iLsS1Nk+Czwr0b2z6PQHA6p9VEnji614=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659503611368815.0380681354741;
 Wed, 3 Aug 2022 10:43:31 +0530 (IST)
Date: Wed, 03 Aug 2022 10:43:31 +0530
To: "Eric Biggers" <ebiggers@kernel.org>
Message-ID: <182621f8dca.1e0e6161130907.1470656861897824669@siddh.me>
In-Reply-To: <Yun1rC59USrgd0fu@sol.localdomain>
References: <20220728155121.12145-1-code@siddh.me>
 <YunKlJCDlmyn2hJ4@sol.localdomain>
 <18261d8a63a.33799d2a402802.7512018232560408914@siddh.me>
 <Yun1rC59USrgd0fu@sol.localdomain>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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

On Wed, 03 Aug 2022 09:42:28 +0530  Eric Biggers <ebiggers@kernel.org> wrote:
> Under what circumstances is the pipe pointer still being dereferenced after the
> pipe has been freed?  I don't see how it can be; see my explanation above.

It really didn't fix the crash. It caused the same crash reported here, which
I was already locally getting:
https://syzkaller.appspot.com/bug?extid=03d7b43290037d1f87ca

(It's same because __post_watch_notification calls post_one_notification, and
this patch seems to stop that crash too, as was verified by Dipanjan here).

While it has been fixed by e64ab2dbd882 ("watch_queue: Fix missing locking in
add_watch_to_object()"), it just shows there can be paths leading to it. (Also,
I posted this patch (v1, v2, v3) before that even landed, so I had no way of
knowing about it).

There is a null check in post_one_notification for the pipe, most probably
because it *expects* the pointer to be NULL'd. Also, there is no reason to have
a dangling pointer stay, it's just a recipe for further bugs.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
