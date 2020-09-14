Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B36EC2BBD1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 19:27:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033C1206E9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 19:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uCnI10Cp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033C1206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7C148667C;
	Mon, 14 Sep 2020 19:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBeq-lrQoxph; Mon, 14 Sep 2020 19:27:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 227818666C;
	Mon, 14 Sep 2020 19:27:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11B0FC0864;
	Mon, 14 Sep 2020 19:27:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 475F5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 19:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D51C861F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 19:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3e_jXQMLMFRL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 19:27:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E9D8A860F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 19:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ElivZyaPzL8sTWfizym2+Owr1Ypn3yVUWdClnfRy/rE=; b=uCnI10CpbKyLkMZsRbCBF8NO8I
 E0yhU73bDJ+60I30Oz519RlDzCfRHrFUhKPMZve1jMRdXNNATwE4LrhysZFcnCpm6h7sB29Veomcx
 asEg1ycd3JxU9n64NMwptG2j9hrxUDUvfm1kDx8EM9i4ps7ZMziPmHbhSFji8qmWxOzmbw351PhxO
 VGKkvuAwTmqfPnVWqf7ySl5Z7rlPMGqJBYTrs6V1EbEgvhSbX4zTqwTYdOOX67arGecaoWCbDekkp
 JdhCKFTeEt7oCGR7nAZF+V+Q+eq5F8Ogj7FnRXq9YDFCCDeK/3f2UFfhxU4/b5IjD7cCCYotzFC8q
 RHNnIO1A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kHu7r-0004CT-Sp; Mon, 14 Sep 2020 19:26:55 +0000
Date: Mon, 14 Sep 2020 20:26:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20200914192655.GW6583@casper.infradead.org>
References: <20200914071724.202365-1-anmol.karan123@gmail.com>
 <20200914110803.GL6583@casper.infradead.org>
 <20200914184755.GB213347@Thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914184755.GB213347@Thinkpad>
Cc: Necip Fazil Yildiran <necip@google.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, Eric Biggers <ebiggers@google.com>,
 netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com,
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

On Tue, Sep 15, 2020 at 12:17:55AM +0530, Anmol Karn wrote:
> On Mon, Sep 14, 2020 at 12:08:03PM +0100, Matthew Wilcox wrote:
> > On Mon, Sep 14, 2020 at 12:47:24PM +0530, Anmol Karn wrote:
> > > idr_get_next() gives WARN_ON_ONCE() when it gets (id > INT_MAX) true
> > > and this happens when syzbot does fuzzing, and that warning is
> > > expected, but WARN_ON_ONCE() is not required here and, cecking
> > > the condition and returning NULL value would be suffice.
> > > 
> > > Reference: commit b9959c7a347 ("filldir[64]: remove WARN_ON_ONCE() for bad directory entries")
> > > Reported-and-tested-by: syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?extid=f7204dcf3df4bb4ce42c 
> > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > 
> > https://lore.kernel.org/netdev/20200605120037.17427-1-willy@infradead.org/
> 
> Hello sir,
> 
> I have looked into the patch, and it seems the problem is fixed to the root cause
> in this patch, but not yet merged due to some backport issues, so, please ignore 
> this patch(sent by me), and please let me know if i can contribute to fixing this 
> bug's root cause.

The root cause is that the network maintainers believe I have a far
greater interest in the qrtr code than I actually do, and the maintainer
of the qrtr code is not doing anything.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
