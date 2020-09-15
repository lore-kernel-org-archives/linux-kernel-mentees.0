Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FF2C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 05:26:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872F020897
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 05:26:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zuMEpouu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872F020897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 341668656A;
	Tue, 15 Sep 2020 05:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4yq2k9-v4OAA; Tue, 15 Sep 2020 05:26:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C3798651F;
	Tue, 15 Sep 2020 05:26:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80E34C0859;
	Tue, 15 Sep 2020 05:26:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 392BDC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 10E4C20472
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2yjuxk1uJrd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:26:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id E154D20466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:26:44 +0000 (UTC)
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4320C20756;
 Tue, 15 Sep 2020 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600147604;
 bh=3YRNdYIm4sAf3BLgQjBz79qzM15AHtoJPCq5PN9ukyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zuMEpouuEr8pt08h+xo1UWS3YJw43raWeTOxfgZvC72zPFpYl70NRSDSuToU2Aecw
 X/ofVOJe662gdkbA2w8+rjyoemD2RHFUoyKTjYBbwCPVC2NiX9BqjTCM09AI7r4xkk
 JZUwj2AgpmKt4RTu/lraKqhKBfczLVvVeZcWYQYI=
Date: Mon, 14 Sep 2020 22:26:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20200915052642.GO899@sol.localdomain>
References: <20200914071724.202365-1-anmol.karan123@gmail.com>
 <20200914110803.GL6583@casper.infradead.org>
 <20200914184755.GB213347@Thinkpad>
 <20200914192655.GW6583@casper.infradead.org>
 <20200915051331.GA7980@Thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915051331.GA7980@Thinkpad>
Cc: Necip Fazil Yildiran <necip@google.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH] idr: remove WARN_ON_ONCE() when
	trying to check id
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

On Tue, Sep 15, 2020 at 10:43:31AM +0530, Anmol Karn wrote:
> On Mon, Sep 14, 2020 at 08:26:55PM +0100, Matthew Wilcox wrote:
> > On Tue, Sep 15, 2020 at 12:17:55AM +0530, Anmol Karn wrote:
> > > On Mon, Sep 14, 2020 at 12:08:03PM +0100, Matthew Wilcox wrote:
> > > > On Mon, Sep 14, 2020 at 12:47:24PM +0530, Anmol Karn wrote:
> > > > > idr_get_next() gives WARN_ON_ONCE() when it gets (id > INT_MAX) true
> > > > > and this happens when syzbot does fuzzing, and that warning is
> > > > > expected, but WARN_ON_ONCE() is not required here and, cecking
> > > > > the condition and returning NULL value would be suffice.
> > > > > 
> > > > > Reference: commit b9959c7a347 ("filldir[64]: remove WARN_ON_ONCE() for bad directory entries")
> > > > > Reported-and-tested-by: syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com
> > > > > Link: https://syzkaller.appspot.com/bug?extid=f7204dcf3df4bb4ce42c 
> > > > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > > 
> > > > https://lore.kernel.org/netdev/20200605120037.17427-1-willy@infradead.org/
> > > 
> > > Hello sir,
> > > 
> > > I have looked into the patch, and it seems the problem is fixed to the root cause
> > > in this patch, but not yet merged due to some backport issues, so, please ignore 
> > > this patch(sent by me), and please let me know if i can contribute to fixing this 
> > > bug's root cause.
> > 
> > The root cause is that the network maintainers believe I have a far
> > greater interest in the qrtr code than I actually do, and the maintainer
> > of the qrtr code is not doing anything.
> 
> Hello sir,
> 
> I hope the patch will get merged soon.

No need to "hope"; you could split up Matthew's patch yourself, and test and
send the resulting patches.  From the above thread, it looks like the networking
developers want one patch to fix the improper use of GFP_ATOMIC (which is the
bug reported by syzbot), and a separate patch to convert qrtr to use the XArray.

> also, i have tried a patch for this bug
> 
> Link: https://syzkaller.appspot.com/bug?extid=3b14b2ed9b3d06dcaa07
> 
> can you please guide me little how should i proceede with it, and 
> also syzbot tested it.  

Looks like something timer-related.  You'll need to investigate more, write and
test a fix, and send it to the appropriate kernel mailing lists and developers
(which will probably be different from the ones receiving this current thread).

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
