Return-Path: <SRS0=VpGr=6T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8885CC47254
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 May 2020 15:44:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65517206B9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 May 2020 15:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65517206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4674623B88;
	Tue,  5 May 2020 15:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cts4S5DK1dOG; Tue,  5 May 2020 15:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B884523B2B;
	Tue,  5 May 2020 15:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A54E1C088B;
	Tue,  5 May 2020 15:44:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CCA8C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 15:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1BE4F86D47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 15:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiGBc2b0LyKI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 15:44:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A518F86D31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 May 2020 15:44:47 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E518A31A;
 Tue,  5 May 2020 15:44:46 +0000 (UTC)
Date: Tue, 5 May 2020 09:44:45 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200505094445.77248c5c@lwn.net>
In-Reply-To: <20200430203612.90404-1-vitor@massaru.org>
References: <20200430203612.90404-1-vitor@massaru.org>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] docs: coresight: fix `make
	htmldocs` warning
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

On Thu, 30 Apr 2020 17:36:12 -0300
Vitor Massaru Iha <vitor@massaru.org> wrote:

> Fix `make htmldocs` warning:
> 
> Documentation/trace/coresight/coresight-ect.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  Documentation/trace/coresight/coresight-ect.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
> index ecc1e57012ef..a93e52abcf46 100644
> --- a/Documentation/trace/coresight/coresight-ect.rst
> +++ b/Documentation/trace/coresight/coresight-ect.rst
> @@ -1,4 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0
> +
>  =============================================
>  CoreSight Embedded Cross Trigger (CTI & CTM).
>  =============================================

Applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
