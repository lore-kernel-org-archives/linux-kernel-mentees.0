Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A868C83009
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 02:27:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9BDA208E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 02:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="StXRVF2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9BDA208E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C658E87D42;
	Thu, 30 Apr 2020 02:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMf7uCg8OvCS; Thu, 30 Apr 2020 02:27:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4490F87CA9;
	Thu, 30 Apr 2020 02:27:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D3D8C0865;
	Thu, 30 Apr 2020 02:27:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FAA6C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C1EC203DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tI-Y+aY6Idqu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:27:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0F2271FC94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 02:27:27 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 23so4324852qkf.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 19:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=n0ueUL4qNH47b8rihpaXCJX1CS3A2QwjcGlCkj6DNLU=;
 b=StXRVF2Z/oF8mgEHbwGRd4ZgjZsl1Cy/jpVXd7mPocE9mQASuyBOR1afSdGwqz+pLD
 TLSZZ6hrfL900AHs6UFdkzuJ6T1ZIk+8KDQvcRKfkMf6iqskQGzMHwIcyp0KTBN/B3Jr
 g3/ic6KlxS4zOurl1rvIPyzp3eTCZukVKBygeVeFutnK0wkK+eLJKsoIADyrDo/uCvih
 rTNF99Bba52PPEijHtMcy1tXNvF6zHwU2dZvDJkYaxB48lBe5mwH4Ei+O/6Idefys5Rh
 Cmsk5oB1YL4dIxX9vuDKpKwwnFbv6l0RYfgogeXgN9var+eGCXLr6FRuw71Dv55AOOnH
 qk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=n0ueUL4qNH47b8rihpaXCJX1CS3A2QwjcGlCkj6DNLU=;
 b=Lkv+gXm5/EPHPNVAal9XrE/sgkBhL/vLjVxGI7d9TVp3SeVCMhdlMyabfPaN68cuCe
 /mlPCp5MJxUClACkodeciR4FxZ6+3VLHFMJTWnCTmrul2XnRQhAX+G4cOmvcFDeBxlvE
 gXbMdYuaz2m1zKXk+tVoXfKPqbbBcGw2fdBFNNlP3GGUs75pq/veOJW4AXAyTr0Gdo8p
 2Z+km92ZBbdI0u3hrQ0G3tklWesCHM/DNAII/k3mitoGlDnbW1LiU7VOcZYGmDXRWeRJ
 hQJpubHiHvlMkG/8sO0E5gLv7PhBta8p2Deg1TIuwa4b0h/qKmH6vaRE5JQnJZy4T+7o
 VDIQ==
X-Gm-Message-State: AGi0PuY0GFmS6yGfL/eiEbvn3naGNGZYfn5QKfs36ZNZxldl2gvkkVfj
 kBsvyMyB242wacGcg0tobU0dlA==
X-Google-Smtp-Source: APiQypJIgieYBZmgtgtmw8KT3AWQ292kizhBLwc90lYViUzaNYyqOUctQH/KIfh3FW1L9bc3b6KCrg==
X-Received: by 2002:a37:a312:: with SMTP id m18mr1455117qke.251.1588213645884; 
 Wed, 29 Apr 2020 19:27:25 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id o33sm953420qtj.62.2020.04.29.19.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 19:27:25 -0700 (PDT)
Message-ID: <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Date: Wed, 29 Apr 2020 23:27:22 -0300
In-Reply-To: <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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

On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > Add missed ":" on kernel-doc function parameter.
> > 
> > This patch fixes this warnings from `make htmldocs`:
> > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  drivers/dma-buf/dma-buf.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index ccc9eda1bc28..0756d2155745 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> >   * calls attach() of dma_buf_ops to allow device-specific attach
> > functionality
> >   * @dmabuf:		[in]	buffer to attach device to.
> >   * @dev:		[in]	device to be attached.
> > - * @importer_ops	[in]	importer operations for the
> > attachment
> > - * @importer_priv	[in]	importer private pointer for the
> > attachment
> > + * @importer_ops:	[in]	importer operations for the
> > attachment
> > + * @importer_priv:	[in]	importer private pointer for the
> > attachment
> >   *
> >   * Returns struct dma_buf_attachment pointer for this attachment.
> > Attachments
> >   * must be cleaned up by calling dma_buf_detach().
> > 
> 
> Sumit said that he would be applying my patch from April 7:
> https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> 
> thanks.

Sorry. I didn't check if the patch has already been sent.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
