Return-Path: <SRS0=0ifB=HX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67730C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 03:01:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A613E653DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 03:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A613E653DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58EA36F4F6
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 03:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UvzzLJd4XMSg
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 21 Feb 2021 03:01:40 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id EDC6C6F49F; Sun, 21 Feb 2021 03:01:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF48D605F3;
	Sun, 21 Feb 2021 03:01:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89CCCC000B;
	Sun, 21 Feb 2021 03:01:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D6D9C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 03:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24D198354D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 03:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D58959PVaNIN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 03:01:35 +0000 (UTC)
Received: by smtp1.osuosl.org (Postfix, from userid 1001)
 id 4531983566; Sun, 21 Feb 2021 03:01:35 +0000 (UTC)
X-Greylist: delayed 11:46:38 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0195.hostedemail.com
 [216.40.44.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4CA183547
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 03:01:32 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave08.hostedemail.com (Postfix) with ESMTP id ACC4C182D5421
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Feb 2021 15:14:52 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id A2B45837F253;
 Sat, 20 Feb 2021 15:14:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wall13_5e05dae27667
X-Filterd-Recvd-Size: 2222
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Sat, 20 Feb 2021 15:14:48 +0000 (UTC)
Message-ID: <cda9541eb8cff5cbba178d6a6d511a46f193aab1.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 20 Feb 2021 07:14:46 -0800
In-Reply-To: <20210220120220.32585-1-dwaipayanray1@gmail.com>
References: <20210220120220.32585-1-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v5 0/2] checkpatch: add verbose
	mode
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 2021-02-20 at 17:32 +0530, Dwaipayan Ray wrote:
> Add a new verbose mode to checkpatch. The verbose test
> descriptions are read from the checkpatch documentation
> file at `Documentation/dev-tools/checkpatch.rst`.
> =

> The verbose mode is optional and can be enabled by the
> flag -v or --verbose.
> =

> The documentation file is only parsed by checkpatch.pl
> if the verbose mode is enabled. The verbose mode can
> not be used together with the --terse option.
> =

> Changes in v5:
> - Change the reference format to use absolute links.
> - Print verbose descriptions only for the first time
> =A0=A0a message type is encountered.

OK, I think a nice addition would be to add --verbose
text to the --list-types option when used together.

$ ./scripts/checkpatch.pl --list-types --verbose
1	ALLOC_ARRAY_ARGS

	The first argument for kcalloc or kmalloc_array should be the
	number of elements.  sizeof() as the first argument is generally
	wrong.

	See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html

2	ALLOC_SIZEOF_STRUCT

	The allocation style is bad.  In general for family of
	allocation functions using sizeof() to get memory size,
	constructs like::

	p =3D alloc(sizeof(struct foo), ...)

	should be::

	p =3D alloc(sizeof(*p), ...)

	See: https://www.kernel.org/doc/html/latest/process/coding-style.html#allo=
cating-memory

etc...


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
