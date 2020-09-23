Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A469C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:21:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE7E214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 14:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Th4XZjSP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE7E214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9642E87317;
	Wed, 23 Sep 2020 14:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O+yRSwZb39lC; Wed, 23 Sep 2020 14:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 338BB87310;
	Wed, 23 Sep 2020 14:21:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A9DEC0859;
	Wed, 23 Sep 2020 14:21:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F179DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E70DD87317
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RK3kw0MKZsEj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:21:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3226687310
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 14:21:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600870879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZWkBOW6OkyhpRIUicvESlEm1fQJupW4N/xDOD1gvLc=;
 b=Th4XZjSPlywXH6zCrM7dRqvtQDp/fjEjNRk//qQhxhFDqdpwg8cWymJ+mAtRzt5503Jpwl
 oqI/f5UQ1RzPm60+DU2G6I4H8HG/3tzW8mykBylZ2wrfIGGbT94h3014agaNVmMh+TVh+b
 G8SR8D939WpImyI4CKO44vvds1G44Ok=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FBEAB29E;
 Wed, 23 Sep 2020 14:21:56 +0000 (UTC)
Message-ID: <1600870858.25088.1.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Date: Wed, 23 Sep 2020 16:20:58 +0200
In-Reply-To: <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com>
 <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Cc: petkan@nucleusys.com, pankaj.laxminarayan.bharadiya@intel.com,
 USB list <linux-usb@vger.kernel.org>, yuehaibing@huawei.com,
 LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
 usb_control_msg_recv() and usb_control_msg_send()
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

Am Mittwoch, den 23.09.2020, 19:36 +0530 schrieb Himadri Pandya:
> On Wed, Sep 23, 2020 at 3:52 PM Oliver Neukum <oneukum@suse.com> wrote:
> > 
> > Am Mittwoch, den 23.09.2020, 14:35 +0530 schrieb Himadri Pandya:

> > GFP_NOIO is used here for a reason. You need to use this helper
> > while in contexts of error recovery and runtime PM.
> > 
> 
> Understood. Apologies for proposing such a stupid change.

Hi,

sorry if you concluded that the patch was stupid. That was not my
intent. It was the best the API allowed for. If an API makes it
easy to make a mistake, the problem is with the API, not the developer.

	Regards
		Oliver

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
