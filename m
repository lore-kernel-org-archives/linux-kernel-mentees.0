Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519A2C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 04:27:04 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CB32463D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 04:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CB32463D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F42C86755;
	Tue, 17 Nov 2020 04:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSF4LiP6e0ql; Tue, 17 Nov 2020 04:27:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F23458674D;
	Tue, 17 Nov 2020 04:27:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D89B7C0891;
	Tue, 17 Nov 2020 04:27:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04F04C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E3C7B86750
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNEzJ2ec7gcg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:26:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0242.hostedemail.com
 [216.40.44.242])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EBF1C8674D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:26:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id C47CF182CED28;
 Tue, 17 Nov 2020 04:26:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: shock35_5b1437b2732e
X-Filterd-Recvd-Size: 1534
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Tue, 17 Nov 2020 04:26:55 +0000 (UTC)
Message-ID: <1b9c5353c6318cc7a4e013886012739e6627d82d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Mon, 16 Nov 2020 20:26:54 -0800
In-Reply-To: <20201117040501.21914-1-yashsri421@gmail.com>
References: <20201117040501.21914-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option
	for MAINTAINERS_STYLE
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

On Tue, 2020-11-17 at 09:35 +0530, Aditya Srivastava wrote:
> Checkpatch expects entries in MAINTAINERS file in a specific order and
> warns if the changes made do not follow the specified order.
> 
> E.g., running checkpatch on commit b33bc2b878e0 ("nexthop: Add entry to
> MAINTAINERS") reports this warning:
> 
> WARNING: Misordered MAINTAINERS entry - list file patterns in
> alphabetic order
> +F:	include/uapi/linux/nexthop.h
> +F:	include/net/netns/nexthop.h
> 
> Provide a simple fix by swapping the unordered lines, if both the lines
> are additions (start with '+')

On second thought, nak.

This fails when there are 3 consecutive misordered lines.

SECTION
F:	c
F:	b
F:	a


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
