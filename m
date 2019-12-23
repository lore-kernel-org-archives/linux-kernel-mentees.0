Return-Path: <SRS0=sSDe=2N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DE6C2D0C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Dec 2019 07:47:11 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B698120715
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Dec 2019 07:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B698120715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=darmarit.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D1448738B;
	Mon, 23 Dec 2019 07:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Yr7hth8QoDg; Mon, 23 Dec 2019 07:47:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 023D38739D;
	Mon, 23 Dec 2019 07:47:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEC17C1D81;
	Mon, 23 Dec 2019 07:47:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00CA6C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Dec 2019 07:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DC1961FFFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Dec 2019 07:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vsFH6TQacTE5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Dec 2019 07:47:06 +0000 (UTC)
X-Greylist: delayed 00:09:28 by SQLgrey-1.7.6
Received: from smtp1-3.goneo.de (smtp1-3.goneo.de [85.220.129.32])
 by silver.osuosl.org (Postfix) with ESMTPS id 557861FF59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Dec 2019 07:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.goneo.de (Postfix) with ESMTP id 9A2B323F0D5;
 Mon, 23 Dec 2019 08:37:35 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
 by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uz_X5WMlX-IY; Mon, 23 Dec 2019 08:37:34 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-085-016-047-111.ewe-ip-backbone.de
 [85.16.47.111])
 by smtp1.goneo.de (Postfix) with ESMTPSA id 1D2C523F0C6;
 Mon, 23 Dec 2019 08:37:34 +0100 (CET)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, corbet@lwn.net,
 miklos@szeredi.hu
References: <20191223012248.606168-1-dwlsalmeida@gmail.com>
From: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <91ded87c-ca70-bcf7-49fc-fa2988f4e36b@darmarit.de>
Date: Mon, 23 Dec 2019 08:37:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191223012248.606168-1-dwlsalmeida@gmail.com>
Content-Language: de-DE
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] Documentation: filesystems:
	convert fuse to RST
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Daniel,

just some nits ...

Am 23.12.19 um 02:22 schrieb Daniel W. S. Almeida:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
...

> diff --git a/Documentation/filesystems/fuse.txt b/Documentation/filesystems/fuse.rst
> similarity index 79%
> rename from Documentation/filesystems/fuse.txt
> rename to Documentation/filesystems/fuse.rst
> index 13af4a49e7db..1ca3aac04606 100644
> --- a/Documentation/filesystems/fuse.txt
> +++ b/Documentation/filesystems/fuse.rst
> @@ -1,41 +1,39 @@

...

>   Filesystem type
> -~~~~~~~~~~~~~~~
> +===============
>   
>   The filesystem type given to mount(2) can be one of the following:
>   
> -'fuse'
> +    **fuse**
>   

drop empty line, use definition list[1] / you used definition list everywhere 
except here.  I guess the follwowing matches better:


``fuse``
   This is the usual way to mount a FUSE filesystem. ...

``fuseblk``
   The filesystem is block device based. ..

[1] 
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#definition-lists

-- Markus --
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
