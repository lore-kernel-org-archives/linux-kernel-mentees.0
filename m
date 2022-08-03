Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EB0C19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 03:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C8660C1E;
	Wed,  3 Aug 2022 03:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C8660C1E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=JHDi2gpA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBdDxfq9eslF; Wed,  3 Aug 2022 03:59:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7DD5D60C02;
	Wed,  3 Aug 2022 03:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD5D60C02
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 586D2C0032;
	Wed,  3 Aug 2022 03:59:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0AA33C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEA6040359
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEA6040359
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=JHDi2gpA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wWaLkMN9fLe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:59:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81BB6401DD
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81BB6401DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 03:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659499130; cv=none; d=zohomail.in; s=zohoarc; 
 b=SxluoMGqshcewBNXgbTBE+Wj78bg7jVL4wk9wYS/+08/F6J/6txR07qNAGNIAkJUmP0B+xpBOcbYO/dvN00G32dd4TJac3RI79ql+ox7lP6Vw4jPvKTjrHQ90wjOIavjLf1DKSNv+OxH6VULKL4ySPilhEUZYYm9qI3b+Nvul6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659499130;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=EOCqi05TVQ1bxrfwzBcSMdn9OtCKKp7BF1VgC9KoHcQ=; 
 b=BUBYkVsY2M1EuLEY0lBl3Ma2TxCkL8iC+J4wVims7qhcPkgGGk7S9aZ7FpttsP/ztv2GHDIQDC2vz3rbMkIX3Pb5676XxQ1Sv1KQAwDN3Mdi483qXMka6xwfi7v8O4bvU/NjZin6OCqgfgztbR5CK55MQgCgWM7O85zd5/I5TJY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659499130; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=EOCqi05TVQ1bxrfwzBcSMdn9OtCKKp7BF1VgC9KoHcQ=;
 b=JHDi2gpAYfI2FcQtzPlchMdta80W2hcoLI3WAPhl+fTo7ZGiYWmQqkwJmsf7s49B
 NPZzITdqwH53t+h7I9+8oejJCNQyGfHdbonem+ud2KCXEQEtkUmZDIswJVGPQaxUTnG
 omdzGVvy8+5GQLajrybLuisF3f3g6qN29O+z8ero=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659499118244159.0457474938786;
 Wed, 3 Aug 2022 09:28:38 +0530 (IST)
Date: Wed, 03 Aug 2022 09:28:38 +0530
To: "Eric Biggers" <ebiggers@kernel.org>
Message-ID: <18261dafe82.76905409402903.8534116548428194689@siddh.me>
In-Reply-To: <YunMXRhAM5g3tNnJ@sol.localdomain>
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
 <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
 <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
 <20220801161642.GA1932489@berlinger>
 <1825abd83c7.2fc2819e194605.6286442523651645797@siddh.me>
 <YunMXRhAM5g3tNnJ@sol.localdomain>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Dipanjan Das <mail.dipanjan.das@gmail.com>,
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

On Wed, 03 Aug 2022 06:46:13 +0530  Eric Biggers <ebiggers@kernel.org> wrote:
> There were several watch_queue fixes that got merged in v5.10.134, so there's no
> point in testing v5.10.131.  If you're still seeing a bug in the *latest*
> 5.10.y, then please check whether it's also present upstream.  If yes, then send
> out a fix for it.  If no, then tell stable@vger.kernel.org what commit(s) need
> to be backported.  Please provide *full* details in each case, including any
> KASAN reports or other information that would help people understand the bug.
> 
> - Eric
> 

Okay, noted.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
