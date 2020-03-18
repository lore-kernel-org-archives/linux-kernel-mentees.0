Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80BDC2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:55:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCE4206EC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cJRp34yq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCE4206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67A27878F1;
	Wed, 18 Mar 2020 01:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7F+OFFZSA-VP; Wed, 18 Mar 2020 01:55:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91191878E5;
	Wed, 18 Mar 2020 01:55:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CB39C1D74;
	Wed, 18 Mar 2020 01:55:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA12C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49721878F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfhoJA8WRUT0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D192E878E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=n8WaT2pi8h8ZeSpbZU79nxS0PDKpvFIPkib3B7Iy9xo=; b=cJRp34yqma1tSdCdEvUG3RzlW+
 nYLQAuW3ut+cPDQT+qgwMH9B8XbF05HmlF14rbg3fUUYk+O0ZJwkP3tlXZpu8S2UZjegPSJ/4UxlK
 yLesmu14kWTCCKYD1hwqoRlAb9Ru3e0iH+O/w2itPRsUDQZafc+BOPH9KXjd8pSJ8UhSdeWynFbw3
 aHG6M/3uBRhFh/vPgfyOq18gbUT2WgYr5kOsDBCeesBvlJ0azDAltFrgIRw3/OZxg0soJasZBJIbf
 C+iaRvCIMEomV+Eijyw4GyrvMZHD4VnF6PDmQhOC0zQ0rUgI+gkpMik1Q9F2QIlInRiWDo2dwdWmE
 pjL8taDA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jENw2-0004mi-1j; Wed, 18 Mar 2020 01:55:54 +0000
Date: Tue, 17 Mar 2020 18:55:53 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200318015553.GG22433@bombadil.infradead.org>
References: <cover.1584494902.git.vitor@massaru.org>
 <7efa62f727eb176341fc0cdfcd47c890ff424451.1584494902.git.vitor@massaru.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7efa62f727eb176341fc0cdfcd47c890ff424451.1584494902.git.vitor@massaru.org>
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 2/2] xarray: Add missing blank
	line after declaration
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

On Tue, Mar 17, 2020 at 10:43:03PM -0300, Vitor Massaru Iha wrote:
> @@ -1624,6 +1624,7 @@ static inline unsigned int xas_find_chunk(struct xa_state *xas, bool advance,
>  	if (XA_CHUNK_SIZE == BITS_PER_LONG) {
>  		if (offset < XA_CHUNK_SIZE) {
>  			unsigned long data = *addr & (~0UL << offset);
> +
>  			if (data)
>  				return __ffs(data);
>  		}

Do you seriously think this makes the function in any way more legible?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
