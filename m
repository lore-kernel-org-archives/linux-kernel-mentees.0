Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79295EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Jul 2023 15:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D36E181CD0;
	Sun,  9 Jul 2023 15:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36E181CD0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=sanganaka@siddh.me header.a=rsa-sha256 header.s=zmail header.b=eXfoG3E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtrB0vE3-F8s; Sun,  9 Jul 2023 15:52:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4AC3581CC3;
	Sun,  9 Jul 2023 15:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC3581CC3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20F2FC0072;
	Sun,  9 Jul 2023 15:52:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72F80C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3972960B78
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3972960B78
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=sanganaka@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=eXfoG3E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIqkvv1YawZq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:52:18 +0000 (UTC)
X-Greylist: delayed 00:15:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0A560760
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B0A560760
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 15:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1688917012; cv=none; d=zohomail.in; s=zohoarc; 
 b=fQcL45A+VOmjbvvXN812kez4xoComZ1FNJTZMGk0DBbXI2I0fG31vUg5X6H6xfhz+lW8Lrf2Xxd3TeWrC7m2PhFbdoUOVJzjyNmZ0ePdp+xkNIbJZvaBqlzEdM+DIn3TrDyra1HMqNPkp+lcieRzihM/NcASU848lPPi5DaqZ+E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1688917012;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=3KiyNrREGpilhuXknlJzzQDPoX9feR3u2Ube6/79vVw=; 
 b=L3Eo5aJ9cqPYE6GazrNQt4zv2OdTwkMNF1rwQ6gdEUuAcHpQCsbTpenJNsNWMu6INWS37BPLyuRv/UxCbIpW3HPwPsVxFAQrRhlGHQfSAQ9I6Gk8xj2DqT4JC/RXtFTE7VgSzc7CwTn4vgQaFx650abiwTWZwBsrmv1mhZ8AB+E=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=sanganaka@siddh.me;
 dmarc=pass header.from=<sanganaka@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1688917012; 
 s=zmail; d=siddh.me; i=sanganaka@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3KiyNrREGpilhuXknlJzzQDPoX9feR3u2Ube6/79vVw=;
 b=eXfoG3E7m3rvHP7ZV5dPdKUD/ZCw0Pri1LcIY16MrAagYZR8tcFdtROw0L/X6nqc
 cX2GcG3dtixBfmMxyWV4SZCUwvzH8ggNZ+8z7SH8G1kDXKVLHxdDRjjcmboiWRP3N3e
 OxcFQP9/3k1PM9oZ9U+NAuB9jOn0seNxQZbjO/20=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1688916981528744.8055241048502;
 Sun, 9 Jul 2023 21:06:21 +0530 (IST)
Date: Sun, 09 Jul 2023 21:06:21 +0530
From: Siddh Raman Pant <sanganaka@siddh.me>
To: "Khalid Masum" <khalid.masum.92@gmail.com>
Message-ID: <1893b4bf70a.2c44c261262941.883099013045252156@siddh.me>
In-Reply-To: <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com> <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com> <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
 <CAABMjtHc4Vu=_L4rOhy1a-m0nQ-ptHe68qXJd__mSQAgO+t_iw@mail.gmail.com>
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: daniel <daniel@iogearbox.net>, "martin.lau" <martin.lau@linux.dev>,
 ast <ast@kernel.org>, andrii <andrii@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, bpf <bpf@vger.kernel.org>,
 Anh Tuan Phan <tuananhlfc@gmail.com>,
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

On Sun, 09 Jul 2023 20:51:15 +0530, Khalid Masum wrote:
> However, something to think about is: If future versions of clang, llvm etc
> do not support compiling our code as it is now, it may become misleading.

When that happens, the max version can be added in.

Though, it would be an indicator to problems in the code IMO,
which would need some updates and fixes.

So nothing to worry about now.

Anh should send v3 instead of replying though. I would also suggest
to shorten the commit title if possible.

Thanks,
Siddh

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
