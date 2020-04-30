Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27815C83001
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 04:37:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0477221EA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 04:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0477221EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D028086B15;
	Thu, 30 Apr 2020 04:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qK7K3i4MlAzO; Thu, 30 Apr 2020 04:37:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 06A0986B12;
	Thu, 30 Apr 2020 04:37:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9CB4C0865;
	Thu, 30 Apr 2020 04:37:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF1F8C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 04:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B974787D6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 04:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEoI-F1OEuv9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 04:37:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4147787ABA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 04:37:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8A20620025;
 Thu, 30 Apr 2020 06:37:24 +0200 (CEST)
Date: Thu, 30 Apr 2020 06:37:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vitor Massaru Iha <vitor@massaru.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Message-ID: <20200430043723.GA27272@ravnborg.org>
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
 <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=DAf_8NmfAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=NxUiqei-aeCDQRDTOOgA:9 a=CjuIK1q_8ugA:10 a=-sleECFk_mc0XVijyva9:22
 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Cc: Randy Dunlap <rdunlap@infradead.org>, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
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

On Wed, Apr 29, 2020 at 11:27:22PM -0300, Vitor Massaru Iha wrote:
> On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> > On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > > Add missed ":" on kernel-doc function parameter.
> > > 
> > > This patch fixes this warnings from `make htmldocs`:
> > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > > 
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > ---
> > >  drivers/dma-buf/dma-buf.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index ccc9eda1bc28..0756d2155745 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> > >   * calls attach() of dma_buf_ops to allow device-specific attach
> > > functionality
> > >   * @dmabuf:		[in]	buffer to attach device to.
> > >   * @dev:		[in]	device to be attached.
> > > - * @importer_ops	[in]	importer operations for the
> > > attachment
> > > - * @importer_priv	[in]	importer private pointer for the
> > > attachment
> > > + * @importer_ops:	[in]	importer operations for the
> > > attachment
> > > + * @importer_priv:	[in]	importer private pointer for the
> > > attachment
> > >   *
> > >   * Returns struct dma_buf_attachment pointer for this attachment.
> > > Attachments
> > >   * must be cleaned up by calling dma_buf_detach().
> > > 
> > 
> > Sumit said that he would be applying my patch from April 7:
> > https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> > 
> > thanks.
> 
> Sorry. I didn't check if the patch has already been sent.

Sumit - patch from Randy is neither applied to drm-misc-next nor
drm-misc-fixes.
A reminder in case it was lost somewhere.

	Sam
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
