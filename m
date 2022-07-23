Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE23C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 14:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72CDF41924;
	Sat, 23 Jul 2022 14:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72CDF41924
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=HAwK2u2f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLZ3e_3CAm8d; Sat, 23 Jul 2022 14:29:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 40E3A41706;
	Sat, 23 Jul 2022 14:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40E3A41706
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13707C0035;
	Sat, 23 Jul 2022 14:29:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B501C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3361B61130
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3361B61130
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=HAwK2u2f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SnfnpAODrhDZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:29:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D21760A83
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D21760A83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:29:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658586576; cv=none; d=zohomail.in; s=zohoarc; 
 b=Cdk5zB8spFUck32lES6ymvWOW49Nk2dX62Ga5BzHiEMuUVqsF+VOY0B6Xd8XbFfH5G56ExBvuWYOSsk5g+HWOyjIaF7xqmwNNTz6f/r3tUYOJlmBaxKm0LEEAbEAanSYrU8oskEZqNdQIv+UWUBlbPnq4V4G5ds0OGP7xcLRPgY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658586576;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=nrLqE1VQZTfewo+huIJiOECXb8Z/AkxV3GsY/VPoroA=; 
 b=TGXEGLyCPRw7jo2oPjtSaayeHmx0mwu5QPW9yhNoVwvYF6agE0ruM2srciLqk0aR+OB+ZFhst6wJutv1gI5Sg53KTnryGX+XS4/rPstaBIPgejnD4vPPbBdb484yXGuvgVctvF96UIyRpDFVacRDFbxnY+ePUhN89MD8h/32ck8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658586576; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nrLqE1VQZTfewo+huIJiOECXb8Z/AkxV3GsY/VPoroA=;
 b=HAwK2u2fVT4U+qrBKk2SJpEACflR3vDhV78T1rrMbXVDqo/6SCTTmQFzR1+X6ppZ
 MUq22UDFeKpknOEywseYLkVEs53BkHwqtlfFE76BK8v0IWOkCjp4pqBO5H8TK8J8aZy
 ootDBrMvSQQuZ+LPAGFVwpYPC4KAhKwC/cwPXLx4=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658586563873727.0268161715809;
 Sat, 23 Jul 2022 19:59:23 +0530 (IST)
Date: Sat, 23 Jul 2022 19:59:23 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
In-Reply-To: <Ytv/4Tljvlt0PJ2r@kroah.com>
References: <20220723135447.199557-1-code@siddh.me>
 <Ytv/4Tljvlt0PJ2r@kroah.com>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
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

On Sat, 23 Jul 2022 19:34:17 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> Also you now have a spinlock held when calling rcu_read_unlock(), are
> you sure that's ok?
> 
> 

We logically should not do write operations in a read critical section, so the
nulling of `wqueue->pipe->watch_queue` should happen after rcu_read_unlock().
Also, since we already have a spinlock, we can use it to ensure the nulling.
So I think it is okay.

Though, it is my first time encountering a spinlock and an rcu lock together,
so if I am wrong, please do correct me.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
