Return-Path: <SRS0=zhe+=HQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD5CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 17:13:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7F264DCD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 14 Feb 2021 17:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7F264DCD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C1778709A;
	Sun, 14 Feb 2021 17:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHWt5mTKdkhO; Sun, 14 Feb 2021 17:13:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CB5E87095;
	Sun, 14 Feb 2021 17:13:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E2EAC0174;
	Sun, 14 Feb 2021 17:13:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D9D2C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 343906F47C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 17:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0w-m19lIq3O2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 17:13:38 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 771126F4C3; Sun, 14 Feb 2021 17:13:38 +0000 (UTC)
X-Greylist: delayed 00:15:52 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0029.hostedemail.com
 [216.40.44.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2985B6F47C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 17:13:36 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 30DFB18041CE7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 14 Feb 2021 16:57:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id EDC4B18029299;
 Sun, 14 Feb 2021 16:57:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: place77_161588327634
X-Filterd-Recvd-Size: 2333
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Sun, 14 Feb 2021 16:57:41 +0000 (UTC)
Message-ID: <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 14 Feb 2021 08:57:40 -0800
In-Reply-To: <20210213131513.51386-3-dwaipayanray1@gmail.com>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Sat, 2021-02-13 at 18:45 +0530, Dwaipayan Ray wrote:
> Add documentation for kernel script checkpatch.pl.
> This documentation is also parsed by checkpatch to
> enable a verbose mode.
> 
> The message types in checkpatch are documented with rst
> field lists. A total of 33 checkpatch type descriptions
> are added.

Alphabetic ordering isn't that great for these entries.
Please group them by use:

whitespace/code layout style:
SPACING, TRAILING_WHITESPACE, LINE_SPACING

commit message defects:
BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SYMBOL, COMMIT_MESSAGE

Allocation style:
group: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTIPLY

> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
[]
> +4 Type Descriptions
> +-------------------
> +
> +This section contains a description of all the message types in checkpatch.
> +
> +.. Types in this section are also parsed by checkpatch.
> +.. Please keep the types sorted alphabetically.
> +
> +:ALLOC_ARRAY_ARGS:
> +  The first argument for kcalloc or kmalloc_array should be the
> +  number of elements.  sizeof() as the first argument is generally
> +  wrong.

If you look at the generated .html file, the output format  is poor.

It would probably be better to use
**<TYPE>**
for each of these blocks instead of
:<TYPE>:

and update the script appropriately.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
