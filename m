Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9AEC2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 11:36:32 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1769C2220D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 11:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="e6W4eeYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1769C2220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6BD78704B;
	Thu, 24 Sep 2020 11:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPP5lIGUX8Ed; Thu, 24 Sep 2020 11:36:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C45C8704F;
	Thu, 24 Sep 2020 11:36:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 258EDC0859;
	Thu, 24 Sep 2020 11:36:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91312C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 11:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7DE1F86BC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 11:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nu+YclBaez+A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 11:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB52186BC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 11:36:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600947387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZyvBg20qT73QpwIVlDigtRjVhnHdUuTkqO7GvwSeIE=;
 b=e6W4eeYUCdmzKdxQ7xtoWbgJ9qdgvwr2lNlDirzA5K8Wrebqf2M3M/HUEs+GFMz86GkDnO
 +SYxT7FpIuIZB1snPQ5GEuM7p9YxWimxBNYh3XwHLw5J+Y/O8gOgEZTtlGoi1WAQufifHL
 TGzb/bqFAm2cN/kjrzhCyCG1l4fajns=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D634AC65;
 Thu, 24 Sep 2020 11:36:27 +0000 (UTC)
Message-ID: <7f9e20b2eab783303c4e5f5c3244366fa88a6567.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Date: Thu, 24 Sep 2020 13:13:56 +0200
In-Reply-To: <CAOY-YVkciMUgtS7USbBh_Uy_=fVWwMMDeHv=Ub_H3GaY0FKZyQ@mail.gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
 <20200923090519.361-4-himadrispandya@gmail.com>
 <1600856557.26851.6.camel@suse.com>
 <CAOY-YVkHycXqem_Xr6nQLgKEunk3MNc7dBtZ=5Aym4Y06vs9xQ@mail.gmail.com>
 <1600870858.25088.1.camel@suse.com>
 <CAOY-YVkciMUgtS7USbBh_Uy_=fVWwMMDeHv=Ub_H3GaY0FKZyQ@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: petkan@nucleusys.com, pankaj.laxminarayan.bharadiya@intel.com,
 USB list <linux-usb@vger.kernel.org>, yuehaibing@huawei.com,
 LKML <linux-kernel@vger.kernel.org>, ogiannou@gmail.com,
 netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>, Kees Cook <keescook@chromium.org>
Subject: Re: [Linux-kernel-mentees] [PATCH 3/4] net: usb: rtl8150: use
 usb_control_msg_recv() and usb_control_msg_send()
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

Am Mittwoch, den 23.09.2020, 20:02 +0530 schrieb Himadri Pandya:

> I meant that it was stupid to change it without properly understanding
> the significance of GFP_NOIO in this context.
> 
> So now, do we re-write the wrapper functions with flag passed as a parameter?

Hi,

I hope I set you in CC for a patch set doing exactly that.

Do not let me or other maintainers discourage you from writing patches.
Look at it this way. Had you not written this patch, I would not have
looked into the matter. Patches are supposed to be reviewed.
If you want additional information, just ask. We do not want
people discouraged from writing substantial patches.

	Regards
		Oliver


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
