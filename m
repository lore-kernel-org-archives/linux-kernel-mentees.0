Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758F3C83003
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 02:07:09 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37777208E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 02:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JJMEwpVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37777208E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E061824214;
	Thu, 30 Apr 2020 02:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMvGCT4ZEMq6; Thu, 30 Apr 2020 02:07:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE4B5241F9;
	Thu, 30 Apr 2020 02:07:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE128C0864;
	Thu, 30 Apr 2020 02:07:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18A33C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 07DD08793F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7GBKWNVv9fK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:06:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BABF8878BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=djVWTxQYfvvGPGVFEwE2B90kkenXlbJGcD+PszmK/2M=; b=JJMEwpVhbqEyGZO1pKvJpLnxth
 l1dJJuerlo8k6yWXdJPNp+1kH1Oyo5kRouZLy3l789vCJ+vxL/gSEbyC4c3psSR8P804xeCogBX2M
 VAFy1RSfIdypQziZGq1UySM3FMVxZQNei7JFpfQLE1Igoi0iJ2NA5A2aYquBMVVgSziPXEBh0Nxzh
 ZQ1ZBIuytrhT8BzPQizoAO3nA+btm4GZ/nVBVBe4QpJL9PeIjnWfQTE2IJpOHKJIE1EEK4EtblaSf
 Iyo2WHE0ul+UFfvw7T7QfY++MM7AdS2K1LNEiNmv6greKpZ2EmZjAmuvmMfT7lQbcW/C/mvBL8fe3
 rZrXahig==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTybJ-0007Az-Jf; Thu, 30 Apr 2020 02:06:57 +0000
To: Vitor Massaru Iha <vitor@massaru.org>, dri-devel@lists.freedesktop.org
References: <20200430015930.32224-1-vitor@massaru.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
Date: Wed, 29 Apr 2020 19:06:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430015930.32224-1-vitor@massaru.org>
Content-Language: en-US
Cc: brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel-mentees@lists.linuxfoundation.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] dma-buf: Documentation: fix:
	`make htmldocs` warnings
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

On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> Add missed ":" on kernel-doc function parameter.
> 
> This patch fixes this warnings from `make htmldocs`:
> ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> 
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  drivers/dma-buf/dma-buf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ccc9eda1bc28..0756d2155745 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
>   * calls attach() of dma_buf_ops to allow device-specific attach functionality
>   * @dmabuf:		[in]	buffer to attach device to.
>   * @dev:		[in]	device to be attached.
> - * @importer_ops	[in]	importer operations for the attachment
> - * @importer_priv	[in]	importer private pointer for the attachment
> + * @importer_ops:	[in]	importer operations for the attachment
> + * @importer_priv:	[in]	importer private pointer for the attachment
>   *
>   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
>   * must be cleaned up by calling dma_buf_detach().
> 

Sumit said that he would be applying my patch from April 7:
https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/

thanks.
-- 
~Randy

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
