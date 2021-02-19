Return-Path: <SRS0=gXAh=HV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0254DC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 17:55:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D30764DEC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 17:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D30764DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 081698714B;
	Fri, 19 Feb 2021 17:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tus7jJ--HIHa; Fri, 19 Feb 2021 17:55:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A9FD8713A;
	Fri, 19 Feb 2021 17:55:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DE4FC000F;
	Fri, 19 Feb 2021 17:55:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFA9BC000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 17:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 97AE08713A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 17:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqIe6nG5iii4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 17:55:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7637086A93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 17:55:27 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 3B793180F68DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 17:55:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 834F8100E7B47;
 Fri, 19 Feb 2021 17:55:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: food09_3c097ed2765f
X-Filterd-Recvd-Size: 1969
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Fri, 19 Feb 2021 17:55:22 +0000 (UTC)
Message-ID: <a30afcb59bd441d90d6bba9936125c2773d830fb.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 19 Feb 2021 09:55:21 -0800
In-Reply-To: <20210217165434.69298-2-dwaipayanray1@gmail.com>
References: <20210217165434.69298-1-dwaipayanray1@gmail.com>
 <20210217165434.69298-2-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v4 1/2] checkpatch: add verbose
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

On Wed, 2021-02-17 at 22:24 +0530, Dwaipayan Ray wrote:
> Add a new verbose mode to checkpatch.pl to emit additional verbose
> test descriptions. The verbose mode is optional and can be enabled
> by the flag -v or --verbose.
[]
> The verbose descriptions are not shown when the --terse option
> is enabled.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2209,7 +2256,15 @@ sub report {
> =A0		splice(@lines, 1, 1);
> =A0		$output =3D join("\n", @lines);
> =A0	}
> -	$output =3D (split('\n', $output))[0] . "\n" if ($terse);
> +
> +	if ($terse) {
> +		$output =3D (split('\n', $output))[0] . "\n";
> +	}
> +
> +	if ($verbose &&
> +	    exists $verbose_messages{$type}) {
> +		$output .=3D $verbose_messages{$type} . "\n\n";
> +	}

verbose output can be silly long if repeated multiple times.
Perhaps the verbose content should only be printed once when
first emitted with a flag set for that type.

Something like:

	if ($verbose && exists($verbose_messages{$type}) &&
	    !$verbose_emitted{$type}) {
		$output .=3D ...
		$verbose_emitted{$type} =3D 1;
	}


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
