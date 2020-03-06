Return-Path: <SRS0=axgb=4X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB52C10F26
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 19:37:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F89B20674
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 19:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F89B20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9D3287D69;
	Fri,  6 Mar 2020 19:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6df5a9Tg2cDx; Fri,  6 Mar 2020 19:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 90F5C87D5F;
	Fri,  6 Mar 2020 19:37:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D8C3C18D3;
	Fri,  6 Mar 2020 19:37:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35262C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 19:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 315F088642
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 19:37:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j2XQNiW06G7k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 19:37:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5FED988651
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 19:37:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0820AEEF;
 Fri,  6 Mar 2020 19:37:37 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 860CDDA728; Fri,  6 Mar 2020 20:37:13 +0100 (CET)
Date: Fri, 6 Mar 2020 20:37:13 +0100
From: David Sterba <dsterba@suse.cz>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200306193713.GI2902@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, madhuparnabhowmik10@gmail.com,
 clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, paulmck@kernel.org,
 frextrite@gmail.com, linux@roeck-us.net
References: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: paulmck@kernel.org, josef@toxicpanda.com, joel@joelfernandes.org,
 linux-kernel@vger.kernel.org, clm@fb.com, linux@roeck-us.net, dsterba@suse.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: btrfs: block-group.c: Fix
 suspicious RCU usage warning
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Mar 06, 2020 at 12:22:43PM +0530, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> 
> The space_info list is rcu protected.
> Hence, it should be traversed with rcu_read_lock held.
> 
> Warning:
> [   29.104591] =============================
> [   29.104756] WARNING: suspicious RCU usage
> [   29.105046] 5.6.0-rc4-next-20200305 #1 Not tainted
> [   29.105231] -----------------------------
> [   29.105401] fs/btrfs/block-group.c:2011 RCU-list traversed in non-reader section!!
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

I've updated the changelog based on comments from the mail thread and
applied the patch. Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
