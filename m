Return-Path: <SRS0=HxGY=LU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0ADC49EA6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Jun 2021 23:14:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E4661C21
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Jun 2021 23:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E4661C21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFCF3400F4;
	Sat, 26 Jun 2021 23:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhYc3RbcTlnI; Sat, 26 Jun 2021 23:14:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE3364002B;
	Sat, 26 Jun 2021 23:14:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A02CDC0010;
	Sat, 26 Jun 2021 23:14:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55522C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 23:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F66C83300
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 23:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mohOrAMH-iC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 23:14:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fgw20-4.mail.saunalahti.fi (fgw20-4.mail.saunalahti.fi
 [62.142.5.107])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FCB9832E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Jun 2021 23:14:28 +0000 (UTC)
Received: from macbook.musicnaut.iki.fi (85-76-11-157-nat.elisa-mobile.fi
 [85.76.11.157]) by fgw20.mail.saunalahti.fi (Halon) with ESMTP
 id 3ec9cd77-d6d4-11eb-ba24-005056bd6ce9;
 Sun, 27 Jun 2021 02:14:25 +0300 (EEST)
Date: Sun, 27 Jun 2021 02:14:23 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH] OMAP: DSS2: OMAPFB: fix potential GPF
Message-ID: <20210626231423.GA38365@macbook.musicnaut.iki.fi>
References: <20210625223323.13930-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625223323.13930-1-paskripkin@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com,
 linux-omap@vger.kernel.org, sam@ravnborg.org
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

Hi,

On Sat, Jun 26, 2021 at 01:33:23AM +0300, Pavel Skripkin wrote:
> In case of allocation failures, all code paths was jumping
> to this code:
> 
> err:
> 	kfree(fbi);
> 	kfree(var);
> 	kfree(fbops);
> 
> 	return r;
> 
> Since all 3 pointers placed on stack and don't initialized, they
> will be filled with some random values, which leads to
> deferencing random pointers in kfree(). Fix it by rewriting
> error handling path.

They are initialized before the first goto:

[...]
	fbi = NULL;
	var = NULL;
	fbops = NULL;

	fbi = kzalloc(sizeof(*fbi), GFP_KERNEL);
	if (fbi == NULL) {
		r = -ENOMEM;
		goto err;
	}
[...]

A.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
