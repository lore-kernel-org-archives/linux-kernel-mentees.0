Return-Path: <SRS0=5uhS=GP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA54CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 06:23:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2BB222288
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Jan 2021 06:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2BB222288
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 756F48704C;
	Tue, 12 Jan 2021 06:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3bEAg7yw2VC; Tue, 12 Jan 2021 06:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BF858704A;
	Tue, 12 Jan 2021 06:23:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E005DC0893;
	Tue, 12 Jan 2021 06:23:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B97EC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 42CDA8704A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvIKgpIka-pw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:23:23 +0000 (UTC)
X-Greylist: delayed 00:06:17 by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0087.hostedemail.com
 [216.40.44.87])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 60A7D87016
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:23:23 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 481B418027A7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jan 2021 06:17:04 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 381FB100E7B40;
 Tue, 12 Jan 2021 06:17:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: whip85_0416c1c27513
X-Filterd-Recvd-Size: 1524
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Tue, 12 Jan 2021 06:17:01 +0000 (UTC)
Message-ID: <36054f502ac63593c346195bc1f3946c9223de7d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 11 Jan 2021 22:16:59 -0800
In-Reply-To: <CAKXUXMzuu7BwKB0SGnT-kqbh-abKeoWpaqWHiPyRMYq7i=43gA@mail.gmail.com>
References: <CAKXUXMzydtFqJ_ZRoF0HQugTBYHZZ56ws9AdUq6TmGL-m5JP3Q@mail.gmail.com>
 <CABJPP5DH1YfT2aQ5ejK4_VJZy-XJG8Jib+FJjHq3PD3XagP=+Q@mail.gmail.com>
 <81fda9fc9abde72cde4965d84effc358bee565cf.camel@perches.com>
 <CAKXUXMzuu7BwKB0SGnT-kqbh-abKeoWpaqWHiPyRMYq7i=43gA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] comment on checkpatch
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

On Tue, 2021-01-12 at 07:08 +0100, Lukas Bulwahn wrote:
> We can always check if it makes locally sense; that still does not
> avoid the situation when a Fixes to an individual local tree and later
> during integration hashes change, but it does sanity-checking on Fixes
> tags for the hashes and descriptions that are stable.

Again: it's not a solvable problem.  I'd rather not generate
warnings on problems that are not obviously correct.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
