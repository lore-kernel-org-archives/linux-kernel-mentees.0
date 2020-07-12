Return-Path: <SRS0=cUZQ=AX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A63C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 21:36:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF80D20674
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 12 Jul 2020 21:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyM2cyiE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF80D20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB67389128;
	Sun, 12 Jul 2020 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQB-2POtN2zL; Sun, 12 Jul 2020 21:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8EFEC88CC6;
	Sun, 12 Jul 2020 21:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71396C088E;
	Sun, 12 Jul 2020 21:36:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD325C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A9F29273A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31SL3vzIrwUq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:36:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id B51012045E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 12 Jul 2020 21:36:33 +0000 (UTC)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 229BA20674;
 Sun, 12 Jul 2020 21:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594589793;
 bh=LaukERu2pv75LoRhGqzTdKknNVP0Uslzw4bshPJDjGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyM2cyiEITBrG5oIVpYyR4sxM6ZHAlQtrGYEedEQtuZUVF8OxssMF9d/SiWt2H7Bx
 W7xyNnYvIxxfOVRxpUNs1t5hO9OZcEQorI5Qbom3a1RV3HcJwby6lDBJU2Fa+riMch
 TW88A8oZWfecMj0VbvXNhDGfRK9kXwhaKsRQsXSc=
Date: Sun, 12 Jul 2020 14:36:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200712213631.GA809@sol.localdomain>
References: <20200712210300.200399-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200712210300.200399-1-yepeilin.cs@gmail.com>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] qrtr: Fix ZERO_SIZE_PTR
 deref in qrtr_tun_write_iter()
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

On Sun, Jul 12, 2020 at 05:03:00PM -0400, Peilin Ye wrote:
> qrtr_tun_write_iter() is dereferencing `ZERO_SIZE_PTR`s when `from->count`
> equals to zero. Fix it by rejecting zero-length kzalloc() requests.
> 
> This patch fixes the following syzbot bug:
> 
>     https://syzkaller.appspot.com/bug?id=f56bbe6668873ee245986bbd23312b895fa5a50a
> 
> Reported-by: syzbot+03e343dbccf82a5242a2@syzkaller.appspotmail.com
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  net/qrtr/tun.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/qrtr/tun.c b/net/qrtr/tun.c
> index 15ce9b642b25..5465e94ba8e5 100644
> --- a/net/qrtr/tun.c
> +++ b/net/qrtr/tun.c
> @@ -80,6 +80,9 @@ static ssize_t qrtr_tun_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	ssize_t ret;
>  	void *kbuf;
>  
> +	if (!len)
> +		return -EINVAL;
> +
>  	kbuf = kzalloc(len, GFP_KERNEL);
>  	if (!kbuf)
>  		return -ENOMEM;

Wasn't this already fixed by:

    commit 8ff41cc21714704ef0158a546c3c4d07fae2c952
    Author: Dan Carpenter <dan.carpenter@oracle.com>
    Date:   Tue Jun 30 14:46:15 2020 +0300

        net: qrtr: Fix an out of bounds read qrtr_endpoint_post()
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
