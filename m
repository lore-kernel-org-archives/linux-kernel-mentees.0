Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00ECC25B06
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Aug 2022 07:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1008541748;
	Sat,  6 Aug 2022 07:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1008541748
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=QgufDlEt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4q7L79Qqsm1; Sat,  6 Aug 2022 07:23:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DCD4F40289;
	Sat,  6 Aug 2022 07:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD4F40289
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3DFEC0032;
	Sat,  6 Aug 2022 07:23:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD536C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 858F640201
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 858F640201
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=QgufDlEt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wukc4i-SrgXB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:23:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A4E440192
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A4E440192
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:23:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659770601; cv=none; d=zohomail.in; s=zohoarc; 
 b=CWDQqmcWpGcDP6YaEQwZ0h+sHqHCU2+P+vFhFIddlN6J+D1MoXIholkA6SAOB79wyDLiV3Mj1Qt8Y/mAGR12U+JpQJG55PB0RWxodnwnJiWMftdm/kDf19bU7Vs6Cu+9wyjFoaBmIbAGujFaOIFFWv4PbrGrNIQymW0/i5yZWSo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659770601;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=0zU6HW/RiKrlHjgu1JneOctBa6Vp2gRdMfIiJanVlDU=; 
 b=OoPKM/6mAk/M24bJnsy5N5HgNR9PR2UQcVfWJhjDbp/ckQUjYWJIJa6kvJI7I1bLj+sRQBy0HWZI6cY2yzso/nAhEPMidhLLvOp1QJh7MHqDHmxMwnPRjPUkgc51kRE+MIaAmvItX60Na/XvR8rSfCDug1MO6zR91RPLnSlWkus=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659770601; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0zU6HW/RiKrlHjgu1JneOctBa6Vp2gRdMfIiJanVlDU=;
 b=QgufDlEt+Zvvv7bokdo6S0xc41lKFFG+lMeDAFIgDzdejYprRbDhiFKCl6o3dSEG
 WxJsIniqBfr7bwqrxkXfLwAnOLrl9L1ilyEn5G2Ijl8IxgI4Jwd9HzJF3C8VlMzcFhy
 NLiuIg5HF4E5w8MT0VUnzvR81/T3GdrFmlQMSjmo=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659770590975525.568493661557;
 Sat, 6 Aug 2022 12:53:10 +0530 (IST)
Date: Sat, 06 Aug 2022 12:53:10 +0530
To: "Eric Biggers" <ebiggers@kernel.org>
Message-ID: <182720956e8.796884ee174572.6157803946196818050@siddh.me>
In-Reply-To: <Yu1icG/o8VcfsQdy@gmail.com>
References: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
 <20220804144152.468916-1-code@siddh.me>
 <YuzFrzrTnTtUHMn/@sol.localdomain>
 <1826d5c4a90.282ac4bf118702.5300662644268737477@siddh.me>
 <Yu1icG/o8VcfsQdy@gmail.com>
Subject: Re: [PATCH v2 3/3] kernel/watch_queue: Remove wqueue->defunct and
 use pipe for clear check
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: corbet <corbet@lwn.net>, rdunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, dhowells <dhowells@redhat.com>,
 edumazet <edumazet@google.com>,
 "christophe.jaillet" <christophe.jaillet@wanadoo.fr>,
 mchehab <mchehab@kernel.org>,
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

On Sat, 06 Aug 2022 00:03:20 +0530  Eric Biggers  wrote:
> wqueue->pipe is only read or written while wqueue->lock is held, so that is not
> an issue at all.
> 
> - Eric

Thanks for explaining. I will send the v2 now.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
