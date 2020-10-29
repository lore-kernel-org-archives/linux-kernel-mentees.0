Return-Path: <SRS0=yQZp=EE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ADBC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 16:37:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D5F720825
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Oct 2020 16:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D5F720825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B944F228BD;
	Thu, 29 Oct 2020 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXz3F9IrIBA7; Thu, 29 Oct 2020 16:36:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8332A2037B;
	Thu, 29 Oct 2020 16:36:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71863C0859;
	Thu, 29 Oct 2020 16:36:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1E27C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 16:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DE333869FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 16:36:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X69BgY0IwF8w
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 16:36:55 +0000 (UTC)
X-Greylist: delayed 00:06:40 by SQLgrey-1.7.6
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by whitealder.osuosl.org (Postfix) with SMTP id A37CD8688F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Oct 2020 16:36:55 +0000 (UTC)
Received: (qmail 1330944 invoked by uid 1000); 29 Oct 2020 12:30:14 -0400
Date: Thu, 29 Oct 2020 12:30:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201029163014.GC1324094@rowland.harvard.edu>
References: <20201010065623.10189-1-anant.thazhemadam@gmail.com>
 <20201029132256.11793-1-anant.thazhemadam@gmail.com>
 <d8417f98-0896-25d0-e72d-dcf111011129@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8417f98-0896-25d0-e72d-dcf111011129@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-usb@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 Oliver Neukum <oneukum@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: usbnet: update
 __usbnet_{read|write}_cmd() to use new API
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

On Thu, Oct 29, 2020 at 08:46:59PM +0530, Anant Thazhemadam wrote:
> I had a v2 prepared and ready but was told to wait for a week before send=
ing it in,
> since usb_control_msg_{send|recv}() that were being used were not present=
 in the
> networking tree at the time, and all the trees would be=A0converged by th=
en.
> So, just to be on the safer side, I waited for two weeks.
> I checked the net tree, and found the APIs there too (defined in usb.h).
> =

> However the build seems to fail here,
> =A0=A0=A0 https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/th=
read/O2BERGN7SYYC6LNOOKNUGPS2IJLDWYT7/
> =

> I'm not entirely sure at this point why this is happening, and would appr=
eciate it if
> someone could take the time to tell me if and how this might be an issue =
with my
> patch.

It's happening because the tree you used for building did not include =

the declarations of usb_control_msg_{send|recv}().

It's hard to tell exactly what that tree does contain, because the =

github.com links embedded in the web page you mention above don't work.

Alan Stern
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
