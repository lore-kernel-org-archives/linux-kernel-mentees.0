Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4D7C5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 09:06:36 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC8E2187F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 09:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBC8E2187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 93D8713E7;
	Thu,  7 Nov 2019 09:06:35 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DEBFF13E6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 09:06:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5C46A196
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 09:06:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 339D5AE65;
	Thu,  7 Nov 2019 09:06:31 +0000 (UTC)
Message-ID: <1573116629.3024.1.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: Phong Tran <tranmanphong@gmail.com>, 
	syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
Date: Thu, 07 Nov 2019 09:50:29 +0100
In-Reply-To: <d6c628d0-71ad-7343-d80e-1b0cd0795242@gmail.com>
References: <00000000000042d60805933945b5@google.com>
	<20191105233652.21033-1-tranmanphong@gmail.com>
	<1573040577.3090.22.camel@suse.com>
	<d6c628d0-71ad-7343-d80e-1b0cd0795242@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Cc: alex.theissen@me.com, andreyknvl@google.com, linux-usb@vger.kernel.org,
	2pi@mok.nu, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] usb: appledisplay: fix
 use-after-free in bl_get_brightness
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

Am Mittwoch, den 06.11.2019, 21:22 +0700 schrieb Phong Tran:

> compare with message size (2) can be considered.
> 
> if (retval == 2) {
> 	brightness = pdata->msgdata[1];
> } else {
> 	retval = -EMSGSIZE;
> }

If you do it that way, the error reporting will be distorted.
Hence I did it a bit more complexly.

	Regards
		Oliver
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
