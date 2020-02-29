Return-Path: <SRS0=WAM0=4R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB46C3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 21:06:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743B421556
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 21:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743B421556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 445B186156;
	Sat, 29 Feb 2020 21:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXSi1rdHiQIh; Sat, 29 Feb 2020 21:06:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95E998614D;
	Sat, 29 Feb 2020 21:06:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D5EBC07FE;
	Sat, 29 Feb 2020 21:06:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79FEAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 21:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 648348484C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 21:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtH2W4LNiVBW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 21:06:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EDDC881A14
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 21:06:17 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id E7728750;
 Sat, 29 Feb 2020 21:06:16 +0000 (UTC)
Date: Sat, 29 Feb 2020 14:06:15 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Pawan Kumar Meena <pawank1804@gmail.com>
Message-ID: <20200229140615.0b36c471@lwn.net>
In-Reply-To: <20200229194636.11494-1-pawank1804@gmail.com>
References: <20200229194636.11494-1-pawank1804@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: RCU: lockdep.txt:
	Convert to lockdep.rst
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

On Sun,  1 Mar 2020 01:16:36 +0530
Pawan Kumar Meena <pawank1804@gmail.com> wrote:

> diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
> similarity index 99%
> rename from Documentation/RCU/lockdep.txt
> rename to Documentation/RCU/lockdep.rst
> index 89db949eeca0..4e71f77bdd28 100644
> --- a/Documentation/RCU/lockdep.txt
> +++ b/Documentation/RCU/lockdep.rst
> @@ -1,3 +1,5 @@
> +.. _lockdep_doc:
> +
>  RCU and lockdep checking
>  
>  All flavors of RCU have lockdep checking available, so that lockdep is

So what about the rest of the file?  You've renamed it, but there's no
formatting changes to the document itself.

Also...  we don't add labels to code just because we might want to jump to
them someday.  Similarly, I don't think we should add labels to the docs
unless we actually need them.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
