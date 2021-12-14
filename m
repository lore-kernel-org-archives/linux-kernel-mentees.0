Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E1AC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Dec 2021 07:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F5C24051A;
	Tue, 14 Dec 2021 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSJaYXV9MW83; Tue, 14 Dec 2021 07:55:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D554440502;
	Tue, 14 Dec 2021 07:55:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9E11C001E;
	Tue, 14 Dec 2021 07:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43E8FC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 07:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 283CF4088C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 07:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eQzguxLoApa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 07:55:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF2F14067F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Dec 2021 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZgCKIjCBbZsE6mdp2caR3SSGOAg+b9LM/fEfk4M75uI=; b=a/gLBA8F9cNhzmLzhckUQWXQHn
 vfDmVXr5wZbbexGYjk4Tt4Amy5LhIs8MlCjQS1u00G3Kf0rxZy23+AU3EulYc1gFoTGcs5NCiJ8aU
 XK2oWD6e1g6Zy8T79fie4iCScsAA67GmTKalGnXjJAxdOmVZBV1FIOgyiZvccc90z5M6myj1GtowC
 Z8AzJxrB1KF/0z4AWqNxR2yjuAqOaR5gdho4N3LyflyzCLwXHTuYc/5/D7HX2msKb8aLVHpPBwbO/
 bi4Cwx7CVv8Z63ph4ea1KqoCopQK6Fjn4VTwqxB24m712CLWHFcCcc4AwouVzXNm98lOnVBKezGO4
 f1WXhX5Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mx2ei-00CwRL-0P; Tue, 14 Dec 2021 07:55:24 +0000
Date: Mon, 13 Dec 2021 23:55:23 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 4/4] rsxx: Drop PCI legacy power management
Message-ID: <YbhN69IhTbGhvVeD@infradead.org>
References: <20211208192449.146076-1-helgaas@kernel.org>
 <20211208192449.146076-5-helgaas@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211208192449.146076-5-helgaas@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Philip Kelleher <pjk1939@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Joshua Morris <josh.h.morris@us.ibm.com>
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

Maybe it is time to just drop this driver?  It was never widly used,
seems unmaintained and uses a cumbersome own queueing layer instead
of blk-mq.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
