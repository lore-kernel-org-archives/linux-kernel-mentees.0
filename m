Return-Path: <SRS0=RDF/=BM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04BAC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 22:43:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B59206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 22:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B59206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 535182046A;
	Sun,  2 Aug 2020 22:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5EdPPsOqunL; Sun,  2 Aug 2020 22:43:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 08CA820461;
	Sun,  2 Aug 2020 22:43:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2EC4C0051;
	Sun,  2 Aug 2020 22:42:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6D4BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8F9F886569
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZzx0LZ3T6xP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:42:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0214.hostedemail.com
 [216.40.44.214])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A3527865C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:42:57 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id ED2B518016848
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 22:24:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 6B8211730850;
 Sun,  2 Aug 2020 22:24:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: taste53_3b1265f26f98
X-Filterd-Recvd-Size: 1940
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sun,  2 Aug 2020 22:23:59 +0000 (UTC)
Message-ID: <fb7ec4d4ed78e6ae7fa6c04abb24d1c00dc2b0f7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Date: Sun, 02 Aug 2020 15:23:58 -0700
In-Reply-To: <20200802221020.GN24045@ziepe.ca>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731053306.GA466103@kroah.com>
 <20200731053333.GB466103@kroah.com> <20200731140452.GE24045@ziepe.ca>
 <20200731142148.GA1718799@kroah.com> <20200731143604.GF24045@ziepe.ca>
 <20200731171924.GA2014207@kroah.com> <20200801053833.GK75549@unreal>
 <20200802221020.GN24045@ziepe.ca>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 linux-rdma@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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

On Sun, 2020-08-02 at 19:10 -0300, Jason Gunthorpe wrote:
> On Sat, Aug 01, 2020 at 08:38:33AM +0300, Leon Romanovsky wrote:
> 
> > I'm using {} instead of {0} because of this GCC bug.
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
> 
> This is why the {} extension exists..

There is no guarantee that the gcc struct initialization {}
extension also zeros padding.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
