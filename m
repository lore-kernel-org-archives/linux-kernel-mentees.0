Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA83C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 14:26:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51BC920774
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 14:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pyVQXCzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51BC920774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A7ED884F0;
	Thu, 30 Apr 2020 14:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxYqxrym4ck8; Thu, 30 Apr 2020 14:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E39E884C1;
	Thu, 30 Apr 2020 14:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A6C4C0864;
	Thu, 30 Apr 2020 14:26:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11065C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 14:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F19B487ED1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 14:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiSWo4uadfiK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 14:26:10 +0000 (UTC)
X-Greylist: delayed 00:05:13 by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F95A87ECF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 14:26:10 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t199so5364333oif.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vU7NNDB88N8b7luDUTJQIrpl7937xKbm7PdW+jOV5J4=;
 b=pyVQXCzRdeYFN35dxvsghsrXzIdcIbEYwc3EaNswiigQ56cZTaQdOFWpaTh0LfCcdm
 2KjNZxbDLoiOShbqWhjVC9o5qbxrY7BWh0w5c+wVG3zivALqYuf86KUZjg5MdLb8W9j5
 pICF3wLWqrM0bo3kIYJMJJyW8jKzWQXR9OH5A5rzn2vBpKJwwOImwWTVnzVH08xSth+I
 9+4KH1ak29J3udYms0FoW4bD0Oh3Y2xYPy++zsxjMAbWXZc59UIOz4nbUiYnTT3lvxzn
 mR2DQiqizyIRFsjO3i3lIyN/yI1wkbOWVcjCADgROSvUQboVCrBkRfFoDvvfSHp3Hy19
 ZvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vU7NNDB88N8b7luDUTJQIrpl7937xKbm7PdW+jOV5J4=;
 b=C0lgPxbZnQVRLYsYBetZwvjA6qiqnsCwMDZESS4aRZnGBv/mOwKl4/J5npxbA5qN6R
 gB+RuoNf+ws17J/1/u6163MdJqQTJyvr3TSuPzhRM4bI3/YtOPEBNz5+legodKuEfRNZ
 j1cqakuQn8fzEsLLeHLWTprV97QVdNV0gNPrOotX0SUIsxgYuaBn5LwVDe9fKsVtz3B8
 rUAPmbTHYA/ztoSVId0C+tK/2x47r4FFtojPf1aiHkSkJSf1yowaeE0GxREth7OxpXbD
 +guYsC9fgBd5AXo22rUqKH5J/rnrGmrtZSsZLe5OehUAG1RN5PedZ4VNBxNouvZhHY2M
 XMcA==
X-Gm-Message-State: AGi0PuYNbMjLbvagRLYpla5jy2jfEa/F5hcMoSjGQutDXCfuNn1Mv8Ex
 i/7WDWA4sjN502PxMYXWY5y6cfumG/voOnKASbw5YjX2ijM=
X-Google-Smtp-Source: APiQypKi11+B07gGR75YnzeMGeraH6AVLTAvNHkxcGX7oFLvFp4wW4F3hi8wb9UT3WC71m1+ov8vwd6qa2wRA4NbCjo=
X-Received: by 2002:aca:d485:: with SMTP id l127mr1766826oig.119.1588256456666; 
 Thu, 30 Apr 2020 07:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
 <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
 <20200430043723.GA27272@ravnborg.org>
In-Reply-To: <20200430043723.GA27272@ravnborg.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 30 Apr 2020 19:50:45 +0530
Message-ID: <CAO_48GGgeJ9cFeAfKB7GjLTwOzXxk_goKsi42ocRswwXkWh11g@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, brendanhiggins@google.com,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

Hello Everyone,

On Thu, 30 Apr 2020 at 10:07, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Apr 29, 2020 at 11:27:22PM -0300, Vitor Massaru Iha wrote:
> > On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> > > On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > > > Add missed ":" on kernel-doc function parameter.
> > > >
> > > > This patch fixes this warnings from `make htmldocs`:
> > > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > > >
> > > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > > ---
> > > >  drivers/dma-buf/dma-buf.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > > index ccc9eda1bc28..0756d2155745 100644
> > > > --- a/drivers/dma-buf/dma-buf.c
> > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> > > >   * calls attach() of dma_buf_ops to allow device-specific attach
> > > > functionality
> > > >   * @dmabuf:              [in]    buffer to attach device to.
> > > >   * @dev:         [in]    device to be attached.
> > > > - * @importer_ops [in]    importer operations for the
> > > > attachment
> > > > - * @importer_priv        [in]    importer private pointer for the
> > > > attachment
> > > > + * @importer_ops:        [in]    importer operations for the
> > > > attachment
> > > > + * @importer_priv:       [in]    importer private pointer for the
> > > > attachment
> > > >   *
> > > >   * Returns struct dma_buf_attachment pointer for this attachment.
> > > > Attachments
> > > >   * must be cleaned up by calling dma_buf_detach().
> > > >
> > >
> > > Sumit said that he would be applying my patch from April 7:
> > > https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> > >
> > > thanks.
> >
> > Sorry. I didn't check if the patch has already been sent.
>
> Sumit - patch from Randy is neither applied to drm-misc-next nor
> drm-misc-fixes.
> A reminder in case it was lost somewhere.

My bad: I have now applied it to drm-misc-fixes, so should be seen in
-next soon.

>
>         Sam

Best,
Sumit.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
