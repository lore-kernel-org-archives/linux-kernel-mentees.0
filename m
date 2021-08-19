Return-Path: <SRS0=yLM5=NK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7199AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 09:28:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18FBA6023E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 09:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18FBA6023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB34B4012D;
	Thu, 19 Aug 2021 09:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLIlOwBsnYvh; Thu, 19 Aug 2021 09:28:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 04059400C3;
	Thu, 19 Aug 2021 09:28:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7D70C0010;
	Thu, 19 Aug 2021 09:28:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDB02C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9909680EA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlQPObRqHBlQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:28:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 251AF80E54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o71atK1N/ttros2m0GUwiV587h5QYRfIAhyzKk18UQQ=; b=iFi3JwVYlsdso3W4Dc3dMUU70s
 XK19q5yE4rJdVY/Sl0nQRrQcs3HQU+QdWs7bY2S/Gr4Tj9PyTUGNzQYrz+Y/khCli0gdeUHxt8xv7
 e2pz+vw0+beWpW7vjuoPPoYDMfBC3OAdeIHdKTl1oeB0gGA7X0MgcsgRDSq2mnM5vYeIQHiVikFMR
 0x51mSFLKcjeUESvZoZOgiRjbGX0bVOyLH5WuUF8c2Np42kh34ZGpOmT+fha6YQwrjP4LMFKFiua0
 qYPF547PsvMrvJF2HGkhmk4YL4o3fnbtOt8l77GP/jH9XCLv4Drdm01suCQ4bDnbNgamIu2S6SXlT
 wVHeRNTw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mGeJG-004ruk-MC; Thu, 19 Aug 2021 09:26:09 +0000
Date: Thu, 19 Aug 2021 10:26:02 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 8/9] kernel: export task_work_add
Message-ID: <YR4jqvZtu0gbaVmx@infradead.org>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818073824.1560124-9-desmondcheongzx@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, walter-zh.wu@mediatek.com, tzimmermann@suse.de,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 oleg@redhat.com, mripard@kernel.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, sumit.semwal@linaro.org,
 dvyukov@google.com, linux-media@vger.kernel.org
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

On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
> +EXPORT_SYMBOL(task_work_add);

EXPORT_SYMBOL_GPL for this kinds of functionality, please.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
