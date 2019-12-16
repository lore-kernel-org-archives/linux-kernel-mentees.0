Return-Path: <SRS0=Gm4r=2G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87709C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Dec 2019 02:42:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B0C2465E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Dec 2019 02:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53B0C2465E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2DEED20109;
	Mon, 16 Dec 2019 02:42:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6R4eVMEgc2f; Mon, 16 Dec 2019 02:42:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8A4DE20035;
	Mon, 16 Dec 2019 02:42:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 702D1C18DD;
	Mon, 16 Dec 2019 02:42:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B209C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Dec 2019 02:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 04C6B87A00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Dec 2019 02:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6lBwYGmKIZod
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Dec 2019 02:42:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2E966879DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Dec 2019 02:42:00 +0000 (UTC)
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xBG2fsqX002256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 21:41:55 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 9A7CF4207DF; Sun, 15 Dec 2019 21:41:54 -0500 (EST)
Date: Sun, 15 Dec 2019 21:41:54 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Phong Tran <tranmanphong@gmail.com>
Message-ID: <20191216024154.GB11512@mit.edu>
References: <20191213113510.GG15474@quack2.suse.cz>
 <20191213153306.30744-1-tranmanphong@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213153306.30744-1-tranmanphong@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: jack@suse.cz, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 linux-ext4@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH V2] ext4: use rcu API in
	debug_print_tree
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

On Fri, Dec 13, 2019 at 10:33:07PM +0700, Phong Tran wrote:
> struct ext4_sb_info.system_blks was marked __rcu.
> But access the pointer without using RCU lock and dereference.
> Sparse warning with __rcu notation:
> 
> block_validity.c:139:29: warning: incorrect type in argument 1 (different address spaces)
> block_validity.c:139:29:    expected struct rb_root const *
> block_validity.c:139:29:    got struct rb_root [noderef] <asn:4> *
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>

Applied, thanks.

						- Ted
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
