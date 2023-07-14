Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3072CEB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Jul 2023 19:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7905403BF;
	Fri, 14 Jul 2023 19:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7905403BF
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gEcaBayN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qx2xX1rBwKV; Fri, 14 Jul 2023 19:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 93927400EA;
	Fri, 14 Jul 2023 19:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93927400EA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CC94C0071;
	Fri, 14 Jul 2023 19:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 597D4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 349E88233E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 349E88233E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=gEcaBayN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcPVYBagpRHb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:52:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E500E82340
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E500E82340
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:52:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C890B61DAE;
 Fri, 14 Jul 2023 19:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5A2C433C7;
 Fri, 14 Jul 2023 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689364321;
 bh=AAO4oRkyffrQ0JEzDM3yvA5fFinRxw6xRn3UaAELxnY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gEcaBayN8xW02HVWZnRzLm/30SrXdIIv3ttOvsCW6SoctK2ybFEo6mpBFhBUUaOPv
 QuoFX1NZ3MZHHuvz+eac7v8mM0B0u3sjgW6OqEeBhclk7YxxqB/CsZs/CS+2MVrcsY
 kbxXZkLUuU0czw9NxdKVgjmICzuER7cw93hG9DU7YKChxCkH4/d9oivqvFq3T5NTqL
 A5BDf/HLE77ANOZZwLERQGngzy4aemxUAt99Ynk51tAsfC+OpqPGE6ys5nBYQsdRYO
 bPxJCLsqXulG2TOCaS4jfMGP83Jyp++FulXu4vtAfqR4jQnuiXiHceJfiTbuDA4dEP
 JI3EvFlnk1DOg==
Date: Fri, 14 Jul 2023 12:52:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Subject: Re: [PATCH v1] selftests/net: replace manual array size calc with
 ARRAYSIZE macro.
Message-ID: <20230714125200.716d2c14@kernel.org>
In-Reply-To: <20230714194635.1779496-1-mahmoudmatook.mm@gmail.com>
References: <20230714194635.1779496-1-mahmoudmatook.mm@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
 davem@davemloft.net, linux-kselftest@vger.kernel.org
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

On Fri, 14 Jul 2023 23:46:35 +0400 Mahmoud Maatuq wrote:
> diff --git a/tools/testing/selftests/net/hwtstamp_config.c b/tools/testing/selftests/net/hwtstamp_config.c

Please resend and CC netdev@
There's ongoing work on hwtstamp configuration, there may be a conflict
if this goes via the general selftest tree.

> index 263cc1c34165..873f4937f37f 100644
> --- a/tools/testing/selftests/net/hwtstamp_config.c
> +++ b/tools/testing/selftests/net/hwtstamp_config.c
> @@ -16,9 +16,8 @@
>  #include <linux/net_tstamp.h>
>  #include <linux/sockios.h>
>  
> -#ifndef ARRAY_SIZE
> -#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
> -#endif
> +#include "kselftest.h"
> +
> 

unnecessary extra new line
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
