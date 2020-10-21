Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BEBC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:14:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A260524198
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 22:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A260524198
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00CEF858C6;
	Wed, 21 Oct 2020 22:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZ9YfBYdZIVH; Wed, 21 Oct 2020 22:14:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4F9B85535;
	Wed, 21 Oct 2020 22:14:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4AAAC08A1;
	Wed, 21 Oct 2020 22:14:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F821C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 22:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F027B20029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 22:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mo2mk2ayc46l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 22:14:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0242.hostedemail.com
 [216.40.44.242])
 by silver.osuosl.org (Postfix) with ESMTPS id 648902E2D6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:26:26 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 40DEB8124323
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 19:26:24 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id D508F18224D7B;
 Wed, 21 Oct 2020 19:26:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: line11_230ddab2724a
X-Filterd-Recvd-Size: 2668
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Wed, 21 Oct 2020 19:26:20 +0000 (UTC)
Message-ID: <5bacf91085ce7e253b2697333dc8ff0378fcfae9.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Aditya <yashsri421@gmail.com>
Date: Wed, 21 Oct 2020 12:26:19 -0700
In-Reply-To: <0562c42d-f9af-1141-ab77-8abb73bfd31f@gmail.com>
References: <20201021150120.29920-1-yashsri421@gmail.com>
 <f073750511750336de5f82600600ba6cb3ddbec0.camel@perches.com>
 <0562c42d-f9af-1141-ab77-8abb73bfd31f@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dwaipayanray1@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive
	for REPEATED_WORD warning
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

On Thu, 2020-10-22 at 00:40 +0530, Aditya wrote:
> On 21/10/20 8:48 pm, Joe Perches wrote:
> > On Wed, 2020-10-21 at 20:31 +0530, Aditya Srivastava wrote:
> > > Presence of hexadecimal address or symbol results in false warning
> > > message by checkpatch.pl.
> > > 
> > > For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
> > > memory leak in mptcp_subflow_create_socket()") results in warning:
> > > 
> > > WARNING:REPEATED_WORD: Possible repeated word: 'ff'
> > >     00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....
> > 
> > Right.
> > 
> > > To avoid all such reports, add an additional regex check for a repeating
> > > pattern of 4 or more 2-lettered words separated by space in a line.
> > > A quick evaluation on v5.6..v5.8 showed that this fix reduces
> > > REPEATED_WORD warnings from 2797 to 1043.
> > 
> > Are many of the other 1043 false positives?
> > Any pattern to them?
> > 
> Apart from the changes suggested by Dwaipayan in
> https://lore.kernel.org/linux-kernel-mentees/20201017162732.152351-1-dwaipayanray1@gmail.com/
> 
> The 'ls -l' output seems to be another common false positive for
> REPEATED_WORD (Frequency 106 over v5.6..v5.8). For eg.
> 
> WARNING:REPEATED_WORD: Possible repeated word: 'root'
> #18:
>   drwxr-xr-x. 2 root root    0 Apr 17 10:53 .
[]
> @@ -3050,8 +3050,10 @@ sub process {
>  			}
>  		}
> 
> -		if ($rawline =~ /^\+/ || $in_commit_log) {
> +		if (($rawline =~ /^\+/ || $in_commit_log) &&
> +		$rawline !~ /\b[a-z-]+.* \d{1,3} [a-zA-Z]+ \w+ +\d+ \w{3} \d{1,2}
> \d{1,2}:\d{1,2}/) {

Perhaps a regex for permissions is good enough

	$line !~ /\b[cbdl-][rwxs-]{9,9}\b/


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
