Return-Path: <SRS0=hd2V=KR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADF4C2B9FB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 09:35:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B36F61244
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 May 2021 09:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B36F61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=remlab.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7CBE83D10;
	Sat, 22 May 2021 09:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T2VPIktCSljC; Sat, 22 May 2021 09:35:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D11983CC8;
	Sat, 22 May 2021 09:35:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E737DC000E;
	Sat, 22 May 2021 09:35:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24303C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 09:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE58605DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 09:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FfTU2Gu2YFuv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 09:35:16 +0000 (UTC)
X-Greylist: delayed 00:07:45 by SQLgrey-1.8.0
Received: from ursule.remlab.net (vps-a2bccee9.vps.ovh.net [51.75.19.47])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BCF9605AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 May 2021 09:35:15 +0000 (UTC)
Received: from ursule.remlab.net (localhost [IPv6:::1])
 by ursule.remlab.net (Postfix) with ESMTP id A2531C2C62;
 Sat, 22 May 2021 12:27:28 +0300 (EEST)
Received: from philogene.remlab.net ([2a01:e34:ec42:5c70:23f3:1053:78e5:7f3c])
 by ursule.remlab.net with ESMTPSA id wOWrJoDOqGBiAQAAwZXkwQ
 (envelope-from <remi@remlab.net>); Sat, 22 May 2021 12:27:28 +0300
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] Phonet: fix kernel-doc syntax in file headers
Date: Sat, 22 May 2021 12:27:28 +0300
Message-ID: <52313028.m8L9TnScQ9@philogene>
Organization: Remlab Tmi
In-Reply-To: <20210520182159.31462-1-yashsri421@gmail.com>
References: <20210520182159.31462-1-yashsri421@gmail.com>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, courmisch@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Le jeudi 20 mai 2021, 21:21:59 EEST Aditya Srivastava a =E9crit :
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for include/*/linux/phonet.h files follows this syntax, but
> the content inside does not comply with kernel-doc.
> =

> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none include/linux/phonet.h emits:
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst * file phonet.h
> =

> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> =

> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

You could just as well remove the stray "file XX" lines but OK.

Acked-by: R=E9mi Denis-Courmont <courmisch@gmail.com.>

-- =

R=E9mi Denis-Courmont


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
