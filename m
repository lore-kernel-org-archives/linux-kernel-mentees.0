Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8B5C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 02:22:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CBD2072E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 02:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2CBD2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D70278854A;
	Wed,  1 Apr 2020 02:22:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcz1GSgAcrGj; Wed,  1 Apr 2020 02:22:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6C40883B6;
	Wed,  1 Apr 2020 02:22:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9899CC1AE2;
	Wed,  1 Apr 2020 02:22:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4963C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BC65F864C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asQz1iBiSydn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:22:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0244.hostedemail.com
 [216.40.44.244])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B168C864B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:22:04 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id BC4FF18353707
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 02:02:51 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2A66B180295A7;
 Wed,  1 Apr 2020 02:02:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: swim09_52a8a4aeb7003
X-Filterd-Recvd-Size: 1649
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Wed,  1 Apr 2020 02:02:47 +0000 (UTC)
Message-ID: <b630a85e4f75e179cfa4a3cef4a4bc9fcca8109a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jonathan Corbet <corbet@lwn.net>, Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 31 Mar 2020 19:00:53 -0700
In-Reply-To: <20200331164956.0e10b87e@lwn.net>
References: <cover.1585693146.git.vitor@massaru.org>
 <20200331164956.0e10b87e@lwn.net>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 0/2] Documentation: Convert
	sysfs-pci to ReST
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

On Tue, 2020-03-31 at 16:49 -0600, Jonathan Corbet wrote:
> On Tue, 31 Mar 2020 19:28:55 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Vitor Massaru Iha (2):
> >   Documentation: filesystems: Convert sysfs-pci to ReST
> >   Documentation: filesystems: remove whitespaces
> > 
> >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 44 ++++++++++---------
> >  1 file changed, 24 insertions(+), 20 deletions(-)
> >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst} (81%)
[]
> When you convert a file to RST, you need to add it to the index.rst file
> as well so that it can be a part of the documentation build.

And if it's in the MAINTAINERS file, update the file type too.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
