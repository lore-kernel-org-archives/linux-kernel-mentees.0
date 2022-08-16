Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E4DECAAD5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Sep 2022 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37015403B3;
	Fri,  2 Sep 2022 16:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37015403B3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NIr8QPxi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dATqF61AyVoT; Fri,  2 Sep 2022 16:37:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 46DF5405CA;
	Fri,  2 Sep 2022 16:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46DF5405CA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6F37C0083;
	Fri,  2 Sep 2022 16:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7DA84C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 00:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BF0360B92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 00:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF0360B92
Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NIr8QPxi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YyQzKgpAZXqj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 00:51:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B635B60B28
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B635B60B28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 00:51:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83E8C61228;
 Tue, 16 Aug 2022 00:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C61C433C1;
 Tue, 16 Aug 2022 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660611075;
 bh=LYo1IRlPhErKfWV08+1SlHGAFh5uoxJ3TtbNfU8vnFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NIr8QPxiiSCGT6wCML6n2FVmfg7ZX7VHBb7PUCmnq2On86jaxZpxL9ycehII6BJWF
 iauQaVn4kdRuTzEA+V1gypD54ySCjLF5PAVO+Z83ern12QwmXrnbiH21GilnrJ55e/
 dHDY7jo6BFU2p/uOQd7JjrkzNOnF90jn2R3K43QN0F98XtaHQQeXAC4HVQhoO3xqsh
 e2+Y7aUMrP3O2MX4uydOX700foyEZqYa5VSSDMzKWJP05BBbN6dAjHHJzveCzXzGTc
 fyiero81M/psZtYnzYYZ/CZwRd2HtANdjgxrwNgsDnQK8uoDl+KQpRCKGU1rMUhSIc
 VVLPAZICHONCA==
Date: Mon, 15 Aug 2022 17:51:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
Message-ID: <20220815175114.5152bac5@kernel.org>
In-Reply-To: <18fd9b89d45aedc1504d0cbd299ffb289ae96438.camel@sipsolutions.net>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
 <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
 <20220812122509.281f0536@kernel.org>
 <182980137c6.5665bf61226802.3084448395277966678@siddh.me>
 <20220815094722.3c275087@kernel.org>
 <18fd9b89d45aedc1504d0cbd299ffb289ae96438.camel@sipsolutions.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 02 Sep 2022 16:37:11 +0000
Cc: "david s. miller\"  <davem@davemloft.net>,
 eric dumazet  <edumazet@google.com>, paolo abeni  <pabeni@redhat.com>,
 netdev  <netdev@vger.kernel.org>, linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>"@osuosl.org
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

On Mon, 15 Aug 2022 21:58:24 +0200 Johannes Berg wrote:
> Yeah, that's slower, but scanning is still a relatively infrequent (and
> slow anyway) operation, and this way we can stick to "this is not used
> once you call cfg80211_scan_done()" which just makes much more sense?

SGTM, FWIW.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
