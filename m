Return-Path: <SRS0=22Qo=2V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C290C2D0C2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 18:34:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AFE9206E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Dec 2019 18:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AFE9206E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1FB71849FA;
	Tue, 31 Dec 2019 18:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1quW5Dk2-V3; Tue, 31 Dec 2019 18:34:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8871084439;
	Tue, 31 Dec 2019 18:34:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E43FC1D81;
	Tue, 31 Dec 2019 18:34:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA791C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8D277845FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:34:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fj2LllfQKAjZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:34:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6AB54841D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Dec 2019 18:34:24 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 3519E11A001; Tue, 31 Dec 2019 18:34:21 +0000 (GMT)
Date: Tue, 31 Dec 2019 18:34:21 +0000
From: Sean Young <sean@mess.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191231183421.GA10946@gofer.mess.org>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-4-dwlsalmeida@gmail.com>
 <20191231100802.GE24469@gofer.mess.org>
 <1be10ca9-4bfc-72f0-971a-cc366417a9b4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1be10ca9-4bfc-72f0-971a-cc366417a9b4@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 3/6] media: dvb_dummy_fe: Fix
	ERROR: POINTER_LOCATION
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

Hi Daniel,

On Tue, Dec 31, 2019 at 03:14:04PM -0300, Daniel W. S. Almeida wrote:
> Hi Sean, thanks for reviewing this!
> 
> 
> > The comments from Mauro in the previous version of this patch have not been
> > addressed:
> > 
> > https://patchwork.linuxtv.org/patch/60048/#114016
> > 
> > Thanks,
> > 
> > Sean
> 
> As you've also noted, I have these as separate patches, i.e.
> 
> https://patchwork.linuxtv.org/patch/60430/
> 
> https://patchwork.linuxtv.org/patch/60432/
> 
> 
> I will squash them with this one and send v2. I will also drop this from the
> series:
> 
> https://patchwork.linuxtv.org/patch/60428/
> 
> 
> Is this OK with you?

That's perfect, although v2 already exists so please name it v3 (or whatever
the next available version is).

Thanks!

Sean
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
