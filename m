Return-Path: <SRS0=GqCC=2J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8D7C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 16:37:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FB40227BF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Dec 2019 16:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FB40227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 13EB186FEC;
	Thu, 19 Dec 2019 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35kjjDYS66qn; Thu, 19 Dec 2019 16:37:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A27786FE7;
	Thu, 19 Dec 2019 16:37:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 705E5C077D;
	Thu, 19 Dec 2019 16:37:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 163F2C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 020FC886F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgUrDgbSGz+v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:36:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 57E33886FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 16:36:57 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C26C52E5;
 Thu, 19 Dec 2019 16:36:56 +0000 (UTC)
Date: Thu, 19 Dec 2019 09:36:55 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191219093655.357cfc65@lwn.net>
In-Reply-To: <20191204101939.6939-1-madhuparnabhowmik04@gmail.com>
References: <20191204101939.6939-1-madhuparnabhowmik04@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: filesystems:
 automount-support: Change reference to document autofs.txt to autofs.rst
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

On Wed,  4 Dec 2019 15:49:39 +0530
madhuparnabhowmik04@gmail.com wrote:

> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patch fixes following documentation build warning:
> Warning: Documentation/filesystems/automount-support.txt references
> a file that doesn't exist: Documentation/filesystems/autofs.txt
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

Both patches (finally) applied, thanks.

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
