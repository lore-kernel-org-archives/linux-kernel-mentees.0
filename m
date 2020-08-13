Return-Path: <SRS0=MBlu=BX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF54AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Aug 2020 01:28:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84BFB20675
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Aug 2020 01:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84BFB20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60A3E86224;
	Thu, 13 Aug 2020 01:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EWOfBCu8XcQ; Thu, 13 Aug 2020 01:28:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E16685F55;
	Thu, 13 Aug 2020 01:28:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 161EEC07FF;
	Thu, 13 Aug 2020 01:28:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73F7CC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 01:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7054688278
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 01:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPPw3ExFhBm6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 01:28:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.us.es (correo.us.es [193.147.175.20])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C4D0988270
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 01:28:45 +0000 (UTC)
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
 by mail.us.es (Postfix) with ESMTP id 4BD26DA7B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 03:28:41 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 3DCDFDA797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Aug 2020 03:28:41 +0200 (CEST)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
 id 31BF9DA78D; Thu, 13 Aug 2020 03:28:41 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
 by antivirus1-rhel7.int (Postfix) with ESMTP id 9C6DEDA704;
 Thu, 13 Aug 2020 03:28:38 +0200 (CEST)
Received: from 192.168.1.97 (192.168.1.97)
 by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int);
 Thu, 13 Aug 2020 03:28:38 +0200 (CEST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (246.pool85-48-185.static.orange.es [85.48.185.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: 1984lsi)
 by entrada.int (Postfix) with ESMTPSA id 111A542EE38E;
 Thu, 13 Aug 2020 03:28:37 +0200 (CEST)
Date: Thu, 13 Aug 2020 03:28:35 +0200
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Simon Horman <horms@verge.net.au>
Message-ID: <20200813012835.GA1851@salvia>
References: <20200810220703.796718-1-yepeilin.cs@gmail.com>
 <20200811074640.841693-1-yepeilin.cs@gmail.com>
 <alpine.LFD.2.23.451.2008111324570.7428@ja.home.ssi.bg>
 <20200811125956.GA31293@vergenet.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811125956.GA31293@vergenet.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Wensong Zhang <wensong@linux-vs.org>, coreteam@netfilter.org,
 "David S. Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>,
 linux-kernel@vger.kernel.org, Jozsef Kadlecsik <kadlec@netfilter.org>,
 lvs-devel@vger.kernel.org, Julian Anastasov <ja@ssi.bg>,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Cong Wang <xiyou.wangcong@gmail.com>,
 syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net-next v2] ipvs: Fix
 uninit-value in do_ip_vs_set_ctl()
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

On Tue, Aug 11, 2020 at 02:59:59PM +0200, Simon Horman wrote:
> On Tue, Aug 11, 2020 at 01:29:04PM +0300, Julian Anastasov wrote:
> > 
> > 	Hello,
> > 
> > On Tue, 11 Aug 2020, Peilin Ye wrote:
> > 
> > > do_ip_vs_set_ctl() is referencing uninitialized stack value when `len` is
> > > zero. Fix it.
> > > 
> > > Reported-by: syzbot+23b5f9e7caf61d9a3898@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?id=46ebfb92a8a812621a001ef04d90dfa459520fe2
> > > Suggested-by: Julian Anastasov <ja@ssi.bg>
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > 
> > 	Looks good to me, thanks!
> > 
> > Acked-by: Julian Anastasov <ja@ssi.bg>
> 
> Pablo, could you consider this for nf-next or should we repost when
> net-next re-opens?

No worries, it will sit in netfilter's patchwork until net-next
reopens.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
