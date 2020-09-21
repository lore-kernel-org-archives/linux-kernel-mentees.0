Return-Path: <SRS0=KrtX=C6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB122C43465
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 12:24:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78E9206A4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Sep 2020 12:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78E9206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6A7B685EC2;
	Mon, 21 Sep 2020 12:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id seDlKgkU3Eti; Mon, 21 Sep 2020 12:24:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 08A1A8579E;
	Mon, 21 Sep 2020 12:24:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA433C0859;
	Mon, 21 Sep 2020 12:24:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3338DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2EE58857CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5xsFTvcueeE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:24:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0232.hostedemail.com
 [216.40.44.232])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6A9C38579E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 12:24:55 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 20F1718224D6B;
 Mon, 21 Sep 2020 12:24:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sign14_03028cf27145
X-Filterd-Recvd-Size: 1528
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 21 Sep 2020 12:24:53 +0000 (UTC)
Message-ID: <9ab72752c9c11bebc15a4a0776d1b1171cdb63bc.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Date: Mon, 21 Sep 2020 05:24:52 -0700
In-Reply-To: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
References: <CABJPP5AVLBwACOwZQKhMoOgUF9ZiO6OoZt0+TkQQHoeUD8igYw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch.pl improvement:
 NO_AUTHOR_SIGN_OFF warnings for users with multiple emails
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

On Mon, 2020-09-21 at 17:41 +0530, Dwaipayan Ray wrote:
> One possible solution is while parsing the author, also load mailmap
> and load associated email addresses to the author and load it
> into a hash. Next when a signed-off-by line is encountered and
> the email is found in our hash ( or maybe some other ds ), then
> the signed-off-by match should be positive.
> 
> Is this feasible? I would be looking at other possibilities too. But it
> would be great to have your view on it!

Either copy the mailmap handling out of get_maintainer
or strip it from get_maintainer and put it into a 
separate perl module/file.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
