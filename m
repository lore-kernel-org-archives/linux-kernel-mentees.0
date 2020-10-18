Return-Path: <SRS0=+KdI=DZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02996C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 07:11:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48CD9208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 18 Oct 2020 07:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48CD9208FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E41CE873A1;
	Sun, 18 Oct 2020 07:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmDLuAmNeA_1; Sun, 18 Oct 2020 07:11:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D499C87361;
	Sun, 18 Oct 2020 07:11:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC37EC0052;
	Sun, 18 Oct 2020 07:11:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D4EAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E47B787751
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhGZrMmuXPyA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:11:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0164.hostedemail.com
 [216.40.44.164])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DF21D8762F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 18 Oct 2020 07:11:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 7FDA4181D341E;
 Sun, 18 Oct 2020 07:11:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sand51_3b152dd2722c
X-Filterd-Recvd-Size: 1625
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Sun, 18 Oct 2020 07:11:21 +0000 (UTC)
Message-ID: <e417e506c23ad56b2618204071c86e8a6ec2cb85.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 18 Oct 2020 00:11:20 -0700
In-Reply-To: <CABJPP5Cr3giDJkJvBDd62iwx6y6r1dFhaVXp9jYXS8Y6k9b09A@mail.gmail.com>
References: <20201017162732.152351-1-dwaipayanray1@gmail.com>
 <1ad9c5f49e10a192f0c6efb1116f3f0d31adce74.camel@perches.com>
 <CABJPP5DuQ_Y0LLS5BzNXUWyxjzp9ts5kgEH-3+7Pn7PPjq0Ljg@mail.gmail.com>
 <eda7a64b4af42ba1fb66a5b3704780cf3f761951.camel@perches.com>
 <CABJPP5Cr3giDJkJvBDd62iwx6y6r1dFhaVXp9jYXS8Y6k9b09A@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v5] checkpatch: add new exception
	to repeated word check
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

On Sun, 2020-10-18 at 12:10 +0530, Dwaipayan Ray wrote:
> print index(" \t.,;?!", '');
> 
> It output 0 in my case. So last words on a line seems to work.
> I don't know if this changes with the perl version though.
> 
> So given this, will it be necessary to change end_char to ' ' ?
> or perhaps change both start_char and end_char to a ' ' to maintain
> uniformity?

It seems it's fine even back to perl 5.6, so it's fine as is.

cheers, Joe


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
