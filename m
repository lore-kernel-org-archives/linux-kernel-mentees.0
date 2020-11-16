Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C734C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 21:55:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEBCE2225E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 21:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEBCE2225E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30A5D85E47;
	Mon, 16 Nov 2020 21:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3kYUTAXWt7vM; Mon, 16 Nov 2020 21:55:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3127E85DFD;
	Mon, 16 Nov 2020 21:55:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 201F1C0891;
	Mon, 16 Nov 2020 21:55:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BB15C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 21:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 266401FF98
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 21:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmG7i9eeQarN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 21:55:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0041.hostedemail.com
 [216.40.44.41])
 by silver.osuosl.org (Postfix) with ESMTPS id 07F301FEED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 21:55:47 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id A099A100E7B49;
 Mon, 16 Nov 2020 21:55:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sky93_41062bc2732c
X-Filterd-Recvd-Size: 2867
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Mon, 16 Nov 2020 21:55:45 +0000 (UTC)
Message-ID: <d675ffc7c85c68117c3e2d78d2e35679f778a9c2.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Date: Mon, 16 Nov 2020 13:55:44 -0800
In-Reply-To: <20201116071930.7733-1-yashsri421@gmail.com>
References: <20201116071930.7733-1-yashsri421@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, 2020-11-16 at 12:49 +0530, Aditya Srivastava wrote:
> Checkpatch expects entries in MAINTAINERS file in a specific order and
> warns if the changes made do not follow the specified order.
> =

> E.g., running checkpatch on commit 6f736909f0a4 ("MAINTAINERS: Add
> patchwork link for PWM entry") reports this warning:
> =

> WARNING: Misordered MAINTAINERS entry - list 'Q:' before 'T:'
> =A0T:	git git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/li=
nux-pwm.git
> +Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/
> =

> Provide a simple fix by swapping the unordered lines

NAK.

This --fix option can't work if a patch merely adds a single line.
The patch context lines would be wrong.

This has to make sure the both lines are additions (start with +)


> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3299,13 +3299,22 @@ sub process {
> =A0					     "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
> =A0				} else {
> =A0					if ($previndex >=3D 0 && $curindex < $previndex) {
> -						WARN("MAINTAINERS_STYLE",
> -						     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\=
n" . $hereprev);
> +						if (WARN("MAINTAINERS_STYLE",
> +							 "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" =
. $hereprev) &&
> +						    $fix) {
> +							# swap these lines
> +							$fixed[$fixlinenr - 1] =3D $rawline;
> +							$fixed[$fixlinenr] =3D $prevrawline;
> +						}
> =A0					} elsif ((($prev eq 'F' && $cur eq 'F') ||
> =A0						  ($prev eq 'X' && $cur eq 'X')) &&
> =A0						 ($prevval cmp $curval) > 0) {
> -						WARN("MAINTAINERS_STYLE",
> -						     "Misordered MAINTAINERS entry - list file patterns in alphabe=
tic order\n" . $hereprev);
> +						if (WARN("MAINTAINERS_STYLE",
> +							 "Misordered MAINTAINERS entry - list file patterns in alphabetic=
 order\n" . $hereprev) &&
> +						    $fix) {
> +							$fixed[$fixlinenr - 1] =3D $rawline;
> +							$fixed[$fixlinenr] =3D $prevrawline;
> +						}
> =A0					}
> =A0				}
> =A0			}


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
