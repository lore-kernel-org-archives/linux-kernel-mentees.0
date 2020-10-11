Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33AFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 20:20:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19842215A4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 20:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19842215A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A52F3875D4;
	Sun, 11 Oct 2020 20:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oeCN2ldDg8qu; Sun, 11 Oct 2020 20:20:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3F94875CD;
	Sun, 11 Oct 2020 20:20:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBE0DC0052;
	Sun, 11 Oct 2020 20:20:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5281EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 37231203BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 20:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJvI9GBMglqE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 20:20:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0011.hostedemail.com
 [216.40.44.11])
 by silver.osuosl.org (Postfix) with ESMTPS id 960FB2026D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 20:20:52 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 3844E1800803D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 20:14:46 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id B9873181D3025;
 Sun, 11 Oct 2020 20:14:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: trip41_401056a271f4
X-Filterd-Recvd-Size: 3000
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Sun, 11 Oct 2020 20:14:41 +0000 (UTC)
Message-ID: <a272d209e84fda3c74385bf104a5f209ae7bc6a1.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Petko Manolov <petkan@nucleusys.com>
Date: Sun, 11 Oct 2020 13:14:40 -0700
In-Reply-To: <20201011193119.GA4061@p310>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201011173030.141582-1-anant.thazhemadam@gmail.com>
 <20201011105934.5c988cd3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <6307397bd43636fea2e7341d24417cbbc3aaf922.camel@perches.com>
 <20201011193119.GA4061@p310>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: sfr@canb.auug.org.au, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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

On Sun, 2020-10-11 at 22:31 +0300, Petko Manolov wrote:
> On 20-10-11 11:33:00, Joe Perches wrote:
> > On Sun, 2020-10-11 at 10:59 -0700, Jakub Kicinski wrote:
> > > On Sun, 11 Oct 2020 23:00:30 +0530 Anant Thazhemadam wrote:
> > > > In set_ethernet_addr(), if get_registers() succeeds, the ethernet address
> > > > that was read must be copied over. Otherwise, a random ethernet address
> > > > must be assigned.
> > > > 
> > > > get_registers() returns 0 if successful, and negative error number
> > > > otherwise. However, in set_ethernet_addr(), this return value is
> > > > incorrectly checked.
> > > > 
> > > > Since this return value will never be equal to sizeof(node_id), a
> > > > random MAC address will always be generated and assigned to the
> > > > device; even in cases when get_registers() is successful.
> > > > 
> > > > Correctly modifying the condition that checks if get_registers() was
> > > > successful or not fixes this problem, and copies the ethernet address
> > > > appropriately.
> > 
> > There are many unchecked uses of set_registers and get_registers
> >  in this file.
> > 
> > If failures are really expected, then it might be better to fix
> > them up too.
> 
> Checking the return value of each get/set_registers() is going to be a PITA and
> not very helpful.  Doing so when setting the MAC address _does_ make sense as in
> that case it is not a hard error.
> 
> In almost all other occasions if usb_control_msg_send/recv() return an error i'd
> rather dump an error message (from within get/set_registers()) and let the user
> decide whether to get rid of this adapter or start debugging it.

Your code, your choices...

Consider using _once or _ratelimited output too.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
