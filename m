Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C616DC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 15:23:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CCFF20878
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 15:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CCFF20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0167687458;
	Mon, 12 Oct 2020 15:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Vol2JpyDHln; Mon, 12 Oct 2020 15:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6A927873D5;
	Mon, 12 Oct 2020 15:23:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56490C0893;
	Mon, 12 Oct 2020 15:23:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6113C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B0EA68743D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iA5NQzlunjcc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:23:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0232.hostedemail.com
 [216.40.44.232])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9AB70873D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:23:43 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id BB5A81800DCA6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:23:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 634A5180A7FCF;
 Mon, 12 Oct 2020 15:23:40 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: twist43_3b049cd271fb
X-Filterd-Recvd-Size: 2477
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Mon, 12 Oct 2020 15:23:36 +0000 (UTC)
Message-ID: <a9ced92c25f45931fd4a387e2cf1a39a36a11c27.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ujjwal Kumar
 <ujjwalkumar0501@gmail.com>
Date: Mon, 12 Oct 2020 08:23:35 -0700
In-Reply-To: <alpine.DEB.2.21.2010121612150.6487@felia>
References: <20201012054943.1196031-1-ujjwalkumar0501@gmail.com>
 <63053585d41ff81cdaad6cb727eb83d81207041a.camel@perches.com>
 <5a3fc45f-e5d7-da3d-4b4b-2a23512ff8de@gmail.com>
 <alpine.DEB.2.21.2010121612150.6487@felia>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang
	check to EXECUTE_PERMISSIONS
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

On Mon, 2020-10-12 at 16:16 +0200, Lukas Bulwahn wrote:
> On Mon, 12 Oct 2020, Ujjwal Kumar wrote:
> > On 12/10/20 11:47 am, Joe Perches wrote:
> > > On Mon, 2020-10-12 at 11:19 +0530, Ujjwal Kumar wrote:
> > > > checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
> > > > files. The script leverages filename extensions and its path in
> > > > the repository to decide whether to allow execute permissions on
> > > > the file or not.
> > > > 
> > > > Based on current check conditions, a perl script file having
> > > > execute permissions, without '.pl' extension in its filename
> > > > and not belonging to 'scripts/' directory is reported as ERROR
> > > > which is a false-positive.
> > > > 
> > > > Adding a shebang check along with current conditions will make
> > > > the check more generalised and improve checkpatch reports.
> > > > To do so, without breaking the core design decision of checkpatch,
> > > > we can fetch the first line from the patch itself and match it for
> > > > a shebang pattern.
> > > > 
> > > > There can be cases where the first line is not part of the patch.
> > > 
> > > For instance: a patch that only changes permissions
> > > without changing any of the file content.
[]
> > Should these new changes go as a separate patch or can they be
> > included in the next iteration of this patch?
[]
The commit log should be updated with the example shown.
Please send a clean V2.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
