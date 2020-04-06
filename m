Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A622FC2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 12:31:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734CE21D79
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 12:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734CE21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 48D25884CE;
	Mon,  6 Apr 2020 12:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gW5GMRKlAgcZ; Mon,  6 Apr 2020 12:31:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 99898882B5;
	Mon,  6 Apr 2020 12:31:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 865DCC089E;
	Mon,  6 Apr 2020 12:31:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5B83C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 12:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9CB5E87E6A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 12:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iPk2A3A4AiYW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 12:31:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.us.es (correo.us.es [193.147.175.20])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 369E387E1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 12:31:22 +0000 (UTC)
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
 by mail.us.es (Postfix) with ESMTP id 471E1F2DEA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 14:31:20 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 37AC8100A76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 14:31:20 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
 id 1E14D100A60; Mon,  6 Apr 2020 14:31:20 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 1E548100A47;
 Mon,  6 Apr 2020 14:31:18 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
 by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int);
 Mon, 06 Apr 2020 14:31:18 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: 1984lsi)
 by entrada.int (Postfix) with ESMTPSA id D75D242EE38E;
 Mon,  6 Apr 2020 14:31:17 +0200 (CEST)
Date: Mon, 6 Apr 2020 14:31:17 +0200
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20200406123117.22e22uurcvqyc4qs@salvia>
References: <20200216172653.19772-1-frextrite@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216172653.19772-1-frextrite@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jeremy Sowden <jeremy@azazel.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, netdev@vger.kernel.org,
 Florent Fourcot <florent.fourcot@wifirst.fr>, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] netfilter: ipset: Pass lockdep
	expression to RCU lists
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

Applied.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
